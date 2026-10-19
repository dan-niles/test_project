import ballerinax/ai.openai;

final PixelgustMcpToolkit pixelgustMcp = check new (pixelgustMcpUrl, auth = {tokenUrl: agentIdTokenUrl, clientId: agentIdClientId, clientSecret: agentIdClientSecret, scopes: agentIdScopes, optionalParams: {"resource": pixelgustMcpUrl}});

final openai:ModelProvider openaiModelprovider = check new (ampOpenaiProviderAgentManagerKey, "gpt-5.6-luna", ampOpenaiProviderAgentManagerUrl, reasoningEffort = "none");
