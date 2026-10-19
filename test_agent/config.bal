import ballerina/os;

configurable string pixelgustMcpUrl = os:getEnv("PIXELGUST_MCP_URL");
configurable string agentIdTokenUrl = os:getEnv("AMP_AGENTID_TOKEN_ENDPOINT");
configurable string agentIdScopes = os:getEnv("AMP_AGENTID_SCOPES");
configurable string agentIdClientId = os:getEnv("AMP_AGENTID_CLIENT_ID");
configurable string agentIdClientSecret = os:getEnv("AMP_AGENTID_CLIENT_SECRET");
configurable string ampOpenaiProviderAgentManagerUrl = os:getEnv("AMP_OPENAI_PROVIDER_URL");
configurable string ampOpenaiProviderAgentManagerKey = os:getEnv("AMP_OPENAI_PROVIDER_API_KEY");
