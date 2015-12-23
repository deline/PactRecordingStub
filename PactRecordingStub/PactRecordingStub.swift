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
    func interaction() -> PactRecordingStubRequest
}

protocol PactRecordingStubRequest {
    func whenRequest() -> PactRecordingStubResponse
}

protocol PactRecordingStubResponse {
    func respondWith(response: String) -> PactRecordingStubInteraction
}


public class PactRecordingStub: PactRecordingStubInteraction, PactRecordingStubRequest, PactRecordingStubResponse {

    func interaction() -> PactRecordingStubRequest {
        return self
    }
    
    func finishInteraction() {
        
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
