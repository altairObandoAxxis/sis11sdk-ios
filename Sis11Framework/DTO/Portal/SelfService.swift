//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
public struct SelfServiceConfiguration:Codable{
    public let SelfService:SelfService
}
public struct SelfService:Codable{
    public let Quote:QuoteConfig
    public let MobilePayment:MobilePayment?
}
public struct QuoteConfig:Codable{
    public let Steps:[StepConfig]
    public let mobileForm:String?
}
public struct StepConfig:Codable,Identifiable {
    // Computed property to satisfy the Identifiable protocol
    public var id: String { name }
    public let title:String
    public let text:String
    public let control:String
    public let name:String
}
public struct MobilePayment:Codable{
    public let Options:[Options]?
}
public class Options:Codable,Identifiable{
    public var id: UUID?;
    public var title:   String;
    public var control: String;
    public var chain:   String?;
    public var formId:  Int?;
    public var htmlForm: String?;
}
