import ballerinax/ai.anthropic;

final PixelgustMcpToolkit pixelgustMcp = check new (pixelgustMcpUrl, auth = {tokenUrl: agentIdTokenUrl, clientId: agentIdClientId, clientSecret: agentIdClientSecret, scopes: agentIdScopes, optionalParams: {"resource": pixelgustMcpUrl}});
final anthropic:ModelProvider anthropicModelprovider = check new (ampAnthropicProviderAgentManagerKey, "claude-sonnet-4-5", ampAnthropicProviderAgentManagerUrl + "/v1");
