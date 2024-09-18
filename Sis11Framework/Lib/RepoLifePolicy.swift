//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
/** 
 Policy Repository
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public class RepoLifePolicy {
    /**
     Get Policy data using id
     - Parameters:
       - id: Life Policy Id
     */
    public func GetPolicyById(id: Int) async throws -> [LifePolicy] {
        return try! await self.GetPoliciesByFilter(filter: "id=\(id)");
    }
    /**
     Get Policy data using holder contact id
     - Parameters:
     - holderId: Holder contact Id
     */
    public func GetPoliciesByHolderId( holderId: Int ) async throws -> [LifePolicy] {
        return try! await self.GetPoliciesByFilter(filter: "holderId=\(holderId)");
    }
    /**
     Get Policy data using a SQLServer syntax
     - Parameters:
        - filter: SQL Server syntax filter
     - Returns:
        - [LifePolicy] Array if the query is ok
     */
    public func GetPoliciesByFilter( filter: String ) async throws -> [LifePolicy]{
        let payload: [String : Any ] = [
            "cmd": "RepoLifePolicy",
            "data": [
                "operation":"GET",
                "noTracking": "true",
                "filter": filter,
                "include": ["Coverages","Insureds","InsuredObjects"]
            ]
        ];
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(RepoLifePolicyDTO.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
            
        }
    }
    /**
     This function allows to execute a quotation with the selfservice format.
     - Parameters:
        - jFormValues: It must be a dictionary that includes the information of the quotation parameters and include the id of the holder (holderId).
        - productCode: Must be the product code e.g. (EDU)
     */
    public func QuotePortalProduct(jFormValues: [ String: Any ], productCode: String ) async throws -> QuotePortalProductResponse {
        if !jFormValues.keys.contains("holderId"){
            throw APIError.missingParameters("Parameter holderId is required for quote a product");
        }
        if productCode.isEmpty {
            throw APIError.missingParameters("Parameter productCode is required for quote a product");
        }
        let payload : [String: Any] = [
            "cmd":"QuotePortalProduct",
            "data": ["jFormValues": jFormValues,"productCode":productCode ]
        ];
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(QuotePortalProductResponse.self, from: data);
            if(response.ok){
                // Generate policy id
                for policy in response.outData {
                    policy.quoteId = UUID();
                }
                return response
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    /**
     Obtains the payment schedule for a specific policy.
     - Parameters:
     - lifePolicyId: Life Policy Id
     */
    public func GetPayPlan( lifePolicyId: Int) async throws -> [PayPlan]{
        let payload: [String: Any ] = [
            "cmd":"RepoPayPlan",
            "data":[
                "operation":"GET",
                "filter":"lifePolicyId=\(lifePolicyId)"
            ]
        ]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) 
            else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<[PayPlan]>.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
}
