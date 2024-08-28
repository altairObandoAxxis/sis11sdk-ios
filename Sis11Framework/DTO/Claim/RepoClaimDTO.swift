//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
public struct RepoClaimDTO:Codable{
    public let ok:Bool
    public let msg:String
    public let outData: [Claim]
}
