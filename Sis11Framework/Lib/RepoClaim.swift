//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
public class RepoClaim{
    public func GetClaimsByFilter( filter: String) async throws -> [Claim] {
        let payload: [String : Any ] = [
            "cmd": "RepoClaim",
            "data": [
                "operation":"GET",
                "noTracking": "true",
                "filter": filter,
                "include": ["EventReason","InsuredEvent"]
            ]
        ];
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(RepoClaimDTO.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    public func GetClaimById(id: Int) async throws -> Claim? {
        return try? await GetClaimsByFilter(filter: "id=\(id)").first
    }
    public func GetClaimsByPolicyId (lifePolicyId: Int) async throws -> [Claim] {
        return try await GetClaimsByFilter(filter: "lifePolicyId=\(lifePolicyId)")
    }
    public func GetClaimsByAffectedId(lifePolicyId: Int, contactId: Int) async throws -> [Claim]{
        return try await GetClaimsByFilter(filter: "lifePolicyId=\(lifePolicyId) AND contactId=\(contactId)")
    }
}
