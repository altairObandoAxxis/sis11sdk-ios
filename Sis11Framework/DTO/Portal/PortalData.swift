//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
/**
 Portal Data DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct PortalData:Codable {
    public let ok:Bool
    public let msg:String
    public let outData:[Product]
}
