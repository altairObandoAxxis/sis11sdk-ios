//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
public struct Insured:Codable,Identifiable{
    public let id:Int
    public let lifePolicyId:Int
    public let contactId:Int
    public let relationship:Int
    public let role:Int
}
