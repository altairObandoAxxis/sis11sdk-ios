//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
/** 
 Portal Product operations.
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public class Portal{
    /// Gets all products configured as external or self-service.
    public func GetPortalProducts() async throws -> [Product] {
        let payload : [ String: String ] = ["cmd":"GetPortalProducts"];
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(PortalData.self, from: data);
            if(!response.ok){
                throw APIError.requestFailed(response.msg);
            }
            return response.outData;
        }
    }
    /**
     allows to obtain the selfservice configuration on the product portal
     - Parameters:
        - product: SelfService Product
     */
    public func ParseProductConfig( product: Product ) throws -> SelfServiceConfiguration {
        do{
            let cnf: SelfServiceConfiguration = try JSONDecoder().decode(SelfServiceConfiguration.self,from: product.configJson.data(using: .utf8)!);
            return cnf;
        }catch{
            throw APIError.decodingError(error.localizedDescription as! Error);
        }
    }
}
