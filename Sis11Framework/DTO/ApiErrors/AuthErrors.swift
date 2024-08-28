//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
public enum AuthErrors:Error{
    case loginError
    case invalidUrl
    case invalidData
    case invalidHTTPResponse
    case requestFailed(String)
    case decodingError(Error)
}
