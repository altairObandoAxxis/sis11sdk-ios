//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
public struct PayPlan: Codable, Identifiable {
    public var id: Int;
    public var lifePolicyId: Int;
    public var transferId: Int?
    public var numberInYear: Int
    public var contractYear: Int
    public var concept: String?
    public var expected: Double?
    public var minimum: Double?
    public var currency: String
    public var payed: Double?
    public var allocationDate, payedDate: String?
    public var dueDate, coveredUntil: String?
    public var changeId: Int?
    public var created: String?
    public var allocationId: Int?
    public var cancellationDate, compensationDate: String?
    public var dueAmount, pendingAmount: Double?
    public var dueDays: Int?
    public var pending, custom: Bool?
}
