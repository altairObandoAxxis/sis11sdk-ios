//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
public struct Coverage:Codable,Identifiable {
    public let id:Int
    public let code:String
    public let name:String
    public let limit:Decimal
    public let premium:Decimal?
    public let extraPremium: Decimal?
    public let start:String?
    public let end:String?
    public let description:String?
}
