//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
public struct Premium:Codable,Identifiable {
    public var id:Int
    public var policyCode:String?
    public var currency: String?
    public var amount:Decimal
    public var amountPaid:Decimal
    public var concept:String?
    public var contractYear:Int
    public var numberInYear:Int
    public var dueDate:String?
    public var lifePolicyId: Int
    public var payDate:String?
}
