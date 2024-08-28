//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation

public struct Currency: Codable{
    public var code : String
    public var enabled: Bool
    public var name: String?;
    public var symbol: String?;
}
