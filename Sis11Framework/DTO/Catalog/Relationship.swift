//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
/**
 Contact Relationship DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct Relationship: Codable {
    public var id: Int;
    public var name: String?;
    public var nameInverse : String?;
    public var principalType : String?;
    public var rule : String?;
    public var expires : Bool;
}
