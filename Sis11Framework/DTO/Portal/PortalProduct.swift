//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
public struct Product:Codable,Identifiable{
    // Computed property to satisfy the Identifiable protocol
    public var id: String { code }
    public let code:String
    public let configJson:String
    public let lobCode:String?
    public let name:String?
}
