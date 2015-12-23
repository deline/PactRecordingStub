//
//  PactRecordingStubTests.swift
//  PactRecordingStubTests
//
//  Created by Deline Neo on 22/12/2015.
//  Copyright © 2015 Deline Neo. All rights reserved.
//

import XCTest
import Nimble

@testable import PactRecordingStub

class PactRecorderStubTest: XCTestCase {
    
    let filemgr = NSFileManager.defaultManager()
    let pactPublishPath = "/tmp/pactRecorderTest.txt"
    
    override func setUp() {
        deleteExistingPactFilesFromTmp()
    }
    
    func testCallingPublishWritesPactFile() {
        let pactRecorder = PactRecorder(pactPublishPath: pactPublishPath)
        pactRecorder.publish()
        
        let pactFilePublished = filemgr.fileExistsAtPath(pactPublishPath)
        expect(pactFilePublished).to(equal(true))
    }
    
    func testXXX() {
        //        let pactRecorder = PactRecorder(pactPublishPath: pactPublishPath)
    }
    
    private func deleteExistingPactFilesFromTmp() {
        do {
            try filemgr.removeItemAtPath(pactPublishPath)
        } catch {
            print ("Failed")
        }
    }
    
}
