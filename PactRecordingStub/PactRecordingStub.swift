//
//  PactRecordingStub.swift
//  PactRecordingStub
//
//  Created by Deline Neo on 22/12/2015.
//  Copyright © 2015 Deline Neo. All rights reserved.
//

import OHHTTPStubs
import OHHTTPStubs.Swift

protocol PactRecordingStubInteraction {
    func interaction(name: String) throws -> PactRecordingStubRequest
}

protocol PactRecordingStubRequest {
    func whenRequest() -> PactRecordingStubResponse
}

protocol PactRecordingStubResponse {
    func respondWith(response: String) -> PactRecordingStubInteraction
}


public class PactRecordingStub: PactRecordingStubInteraction, PactRecordingStubRequest, PactRecordingStubResponse {

    private let pactRecorder: PactRecorder
    var interactionStarted = false;
    
    init() {
        pactRecorder = PactRecorder()
    }
    
    init(outputPath: String) {
        pactRecorder = PactRecorder(pactPublishPath: outputPath)
    }

    func interaction(name: String) -> PactRecordingStubRequest {
        guard !interactionStarted else {
            preconditionFailure("interaction() started without calling finishInteraction() on previous interaction")
        }

        
        interactionStarted = true;
        return self
    }
    
    func finishInteraction() {
        interactionStarted = false
        pactRecorder.publish()
    }

    func whenRequest() -> PactRecordingStubResponse {
        return self
    }

    func respondWith(response: String) -> PactRecordingStubInteraction {
        
        stub(isHost("localhost")) {
            _ in
            return OHHTTPStubsResponse(
                data: response.dataUsingEncoding(NSUTF8StringEncoding)!,
                statusCode: 200,
                headers: nil)
        }
        
        return self
    }
    
    
}
