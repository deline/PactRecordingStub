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

    func testRecordsInteractions() {

        let recordingStub = PactRecordingStub()
        
        recordingStub.interaction().whenRequest().respondWith("Hello Matthew")

        var result: String?
        networkService.makeNetworkCall {
            response in
            debugPrint("******************\(response)")
            result = response
        }

        expect(result).toEventuallyNot(beNil(), timeout: 5);

        
        recordingStub.finishInteraction()
        

    }


}
