//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
public struct Credentials:Codable{
    public let email:String
    public let clave:String
    // Inicializador público
    public init(email: String, clave: String) {
       self.email = email
       self.clave = clave
   }
}
