//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
public enum APIError: Error {
    case invalidURL
    case invalidHTTPResponse
    case encodingError
    case requestFailed(String)
    case decodingError(Error)
    case missingParameters(String)
}
