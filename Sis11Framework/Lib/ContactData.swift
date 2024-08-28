//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 25/8/24.
//

import Foundation
public class ContactActions {
    public func GetContactData() async throws -> ContactDataOutData? {
        let sdk = Sis11SDK.shared;
        let payload: [String : Any ] = [
            "cmd": "GetContactData",
            "data": ["token": sdk.token]
        ];
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await sdk.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(ContactData.self, from: data);
            if(response.ok){
                return response.outData ?? nil;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    public func GetContactDataByContactId( contactId: Int) async throws -> ContactDataOutData {
        let sdk = Sis11SDK.shared;
        let payload: [String : Any ] = [
            "cmd": "GetContactData",
            "data": ["contactId": contactId ]
        ];
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await sdk.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(ContactData.self, from: data);            
            if(response.ok){
                return response.outData!;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    public func GetPoliciesByContactId( contactId: Int) async throws -> [LifePolicy] {
        let sdk = Sis11SDK.shared;
        let payload: [String: Any]=[
            "cmd":"RepoLifePolicy",
            "data": [ "operation":"GET","noTracking":true, "filter": "holderId=\(contactId)" ]
        ]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await sdk.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(RepoLifePolicyDTO.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    public func GetIssuesByContactId( contactId: Int ) async throws -> [ Issue ]{
        let sdk = Sis11SDK.shared;
        let payload: [String : Any ] = [
            "cmd": "RepoIssue",
            "data": ["operation":"GET", "filter": "contactId=\(contactId)"]
        ];
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await sdk.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(IssueResponse.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    public func CreateNewIssue( newIssue: Issue ) async throws -> [ Issue ]{
        let jsonData = try! JSONEncoder().encode(IssueRequest(data: IssueData(entity: newIssue )));
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(IssueResponse.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
}
