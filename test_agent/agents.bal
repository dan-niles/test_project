import ballerina/ai;
import ballerina/mcp;

final ai:Agent weatherAgent = check new (
    systemPrompt = {
        role: string `Weather Assistant`,
        instructions: string `You are a helpful weather assistant.
Answer questions about current weather, forecasts, and general weather-related advice.
If you do not have a tool to fetch live weather data, say so clearly instead of guessing.
Be concise and friendly in your responses.`
    }, model = anthropicModelprovider, tools = [pixelgustMcp]
);

isolated class PixelgustMcpToolkit {
    *ai:McpBaseToolKit;
    private final mcp:StreamableHttpClient mcpClient;
    private final readonly & ai:ToolConfig[] tools;

    public isolated function init(string serverUrl, mcp:Implementation info = {name: "MCP", version: "1.0.0"},
            *mcp:StreamableHttpClientTransportConfig config) returns ai:Error? {
        do {
            self.mcpClient = check new mcp:StreamableHttpClient(serverUrl, config);
            self.tools = check ai:getPermittedMcpToolConfigs(self.mcpClient, info, self.callTool).cloneReadOnly();
        } on fail error e {
            return error ai:Error("Failed to initialize MCP toolkit", e);
        }
    }

    public isolated function getTools() returns ai:ToolConfig[] => self.tools;

    @ai:AgentTool
    public isolated function callTool(mcp:CallToolParams params) returns mcp:CallToolResult|error {
        return self.mcpClient->callTool(params);
    }
}
