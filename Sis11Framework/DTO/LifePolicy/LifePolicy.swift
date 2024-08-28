//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
public class LifePolicy:Codable,Identifiable {
    public var quoteId: UUID?;
    public let id:Int
    public let code:String?
    public let lob:String
    public let active:Bool
    public let productCode:String?
    public let insuredSum:Decimal
    public let currency:String?
    public let start:String?
    public var end:String?=String()
    public var annualTotal:Decimal = 0
    public let Coverages:[Coverage]?
    public let Insureds:[Insured]?
    public let sellerId:Int?;
    public let holderId:Int;
    public let payerId:Int;
    public let segment:String?;
    public let channel:String?;
    public let InsuredObjects: [InsuredObject]?;
    public let plan: String?;
    public let periodicity: String?;
    public let policyType: String?;
}
