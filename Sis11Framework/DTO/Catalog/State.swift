//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation

public struct StateCatalog: Codable {
    public var id: Int
    public var code: String;
    public var countryCode: String?;
    public var name: String?
    public var riskZone: String?;
}
