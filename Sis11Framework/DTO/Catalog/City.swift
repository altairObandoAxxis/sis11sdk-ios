//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
/**
 City DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct City: Codable {
    public var id: Int
    public var code: String?;
    public var name: String?;
    public var stateCode: String?
}
