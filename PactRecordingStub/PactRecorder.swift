//
//  PactRecorder.swift
//  SpringStateMachine-iOS
//
//  Created by Deline Neo on 17/12/2015.
//  Copyright © 2015 Deline Neo. All rights reserved.
//
import Foundation

class PactRecorder {
    private var noRecording = false
    private let pactPublishPath: String
    private let interactions = [String: String]()

    init(pactPublishPath: String) {
        self.pactPublishPath = pactPublishPath
    }

    convenience init() {
        self.init(pactPublishPath: "/tmp/pact.json")
    }

    func publish() {
        let text = "Some text that \nspans multiple lines and \tincludes a tab-space."
        
        
        do {
            try text.writeToFile(pactPublishPath, atomically: false, encoding: NSUTF8StringEncoding)
        }
        catch {
            print("There was some kind of error")
        }
        
        //
    }
    
}