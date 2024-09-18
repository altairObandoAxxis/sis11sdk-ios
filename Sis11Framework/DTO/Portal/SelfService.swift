//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
/**
 Self Service Response Config DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct SelfServiceConfiguration:Codable{
    public let SelfService:SelfService
}
/**
 Self Service DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct SelfService:Codable{
    public let Quote:QuoteConfig
    public let MobilePayment:MobilePayment?
}
/**
 Self Service Quote configuration.
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct QuoteConfig:Codable{
    public let Steps:[StepConfig]
    public let mobileForm:String?
}
/**
 Steps configuration controls
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct StepConfig:Codable,Identifiable {
    /// Computed property to satisfy the Identifiable protocol
    public var id: String { name }
    public let title:String
    public let text:String
    public let control:String
    public let name:String
}
/**
 Mobile Payment DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct MobilePayment:Codable{
    public let Options:[Options]?
}
/**
 
 Quotation options DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct Options:Codable,Identifiable{
    public var id: UUID?;
    public var title:   String;
    public var control: String;
    public var chain:   String?;
    public var formId:  Int?;
    public var htmlForm: String?;
}
