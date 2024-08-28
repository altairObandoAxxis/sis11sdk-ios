//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
public struct ContactData: Codable {
    public let ok:Bool
    public let msg:String
    public let outData:ContactDataOutData?
}
public struct ContactDataOutData:Codable {
    public var PoliciesAsHolder:[LifePolicy]
    public var Claims:[Claim]
    public var Premiums:[Premium]
    public var Contact:Contact
}

public struct Contact:Codable,Identifiable {
    public let id:Int
    public var name:String?
    public var surname1:String?
    public var surname2:String?
    public var FullName:String?
    public var email:String?
    public var birth:String?
}

