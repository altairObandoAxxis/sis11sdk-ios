//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
/**
 Country DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct Country: Codable {
    /// Country Code
    public var code: String;
    /// Country Name
    public var name: String;
    /// Is FATCA
    public var fatca: Bool;
}
