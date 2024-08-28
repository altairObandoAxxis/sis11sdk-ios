//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
public struct RepoLifePolicyDTO: Codable{
    public let ok:Bool
    public let msg:String
    public let outData: [LifePolicy]
}
