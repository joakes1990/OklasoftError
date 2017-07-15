//
//  Error.swift
//  OklasoftError
//
//  Created by Justin Oakes on 7/6/17.
//  Copyright © 2017 Oklasoft LLC. All rights reserved.
//

import Foundation

public struct oklasoftError: Error {
    let domain: String = "com.oklasoft"
    var errorCode: Int
    var userInfo: [AnyHashable : Any]?
    var localizedDescription: String
    
    public init(errorCode: Int, userInfo: [AnyHashable : Any]?, localizedDescription: String) {
        self.errorCode = errorCode
        self.userInfo = userInfo
        self.localizedDescription = localizedDescription
    }
    
    public func toError() -> Error {
        let newError: NSError = NSError(domain: domain,
                                        code: errorCode,
                                        userInfo: (userInfo as? [String:Any]) ?? ["":""])
        return newError as Error
    }
}
