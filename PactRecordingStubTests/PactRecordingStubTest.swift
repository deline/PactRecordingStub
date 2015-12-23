//
//  PactRecordingStubTest.swift
//  PactRecordingStub
//
//  Created by Deline Neo on 22/12/2015.
//  Copyright © 2015 Deline Neo. All rights reserved.
//

import XCTest
import Nimble

@testable import PactRecordingStub

class PactRecordingStubTest: XCTestCase {

    let networkService = NetworkService()
    let recordingStub = PactRecordingStub(outputPath: "/tmp/my-output-file.json")
    

    func testRecordsInteractions() {

        recordingStub.interaction("Interaction 1").whenRequest().respondWith("Hello there")

        var result: String?
        networkService.makeNetworkCall {
            result = $0
        }

        expect(result).toEventually(equal("Hello there"));
        recordingStub.finishInteraction()
        
        
        
        //Second interaction
        recordingStub.interaction("Interaction 2").whenRequest().respondWith("Good night")
        
        result = nil
        networkService.makeNetworkCall {
            response in
            result = response
        }
        
        recordingStub.finishInteraction()
        expect(result).toEventually(equal("Good night"));
    }
}
