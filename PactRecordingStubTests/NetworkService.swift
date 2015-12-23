//
// Created by Deline Neo on 23/12/2015.
// Copyright (c) 2015 Deline Neo. All rights reserved.
//

import Alamofire

class NetworkService {

    func makeNetworkCall(completion: ((response: String) -> Void)) {
        
        Alamofire.request(.GET, "http://localhost").responseData {
            response in
            
            debugPrint(response)
            
            debugPrint(response.response)
                        debugPrint(response.data)
            
            let x = String(data: response.data!, encoding: NSUTF8StringEncoding)
            
            completion(response: x!)
        }
    }

}
