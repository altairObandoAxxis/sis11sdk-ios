//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
public struct Claim:Codable,Identifiable {
    public var id:Int
    public var code:String?
    public var notification:String?
    public var claimType:String?
    public var status:String?
    public var created:String?
    public var eventReason:String?;
    public var insuredEvent:String?
    public var elegibleCoverages:String?
    public var contactId:Int
    public var claimerId:Int
    public var lifePolicyId:Int
    public var jCustomForms:String?
    public var EventReason: EventReason?;
    public var InsuredEvent:InsuredEvent?;
}
