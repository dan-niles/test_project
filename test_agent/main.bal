import ballerina/ai;
import ballerina/http;

listener ai:Listener weatherListener = new (listenOn = check http:getDefaultListener());

service /weather\-agent on weatherListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        string stringResult = check weatherAgent.run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
