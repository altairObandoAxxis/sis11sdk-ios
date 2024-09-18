//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
/** 
    Common repository options
     - Authors:
         Noel Obando
     - Copyright: Axxis-Systems
 */
public class Repository {
    /// Get configuration to call a repository
    private func GetPayload( _ catalog : Catalog, _ page: Int, _ size: Int, _ filter: String  ) -> [ String : Any ]{
        let payload : [ String: Any ] = [
            "cmd": catalog.rawValue,
            "data": [
                "operation":"GET",
                "page": page,
                "size": size,
                "filter": filter.isEmpty ? "1=1" : filter,
            ]
        ]
        return payload;
    }
    /**
      Get all countries
     - Parameters:
        - page: Page Number ( use 0 to get all records)
        - size: Number of records
        - filter: SQL Syntax filter
     */
    public func GetCountries(page: Int, size: Int, filter: String) async throws -> [Country] {
        let payload = GetPayload(Catalog.Country, page, size, filter);
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<[Country]>.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    /**
     Get All States
     - Parameters:
        - page: Page Number ( use 0 to get all records)
        - size: Number of records
        - filter: SQL Syntax filter
     */
    public func GetStates(page: Int, size: Int, filter: String) async throws -> [StateCatalog] {
        let payload = GetPayload(Catalog.State, page, size, filter);
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<[StateCatalog]>.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    /**
     Get All Cities
     - Parameters:
        - page: Page Number ( use 0 to get all records)
        - size: Number of records
        - filter: SQL Syntax filter
     */
    public func GetCities(page: Int, size: Int, filter: String) async throws -> [City] {
        let payload = GetPayload(Catalog.City, page, size, filter);
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<[City]>.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    /**
     Get all currencies
     - Parameters:
        - page: Page Number ( use 0 to get all records)
        - size: Number of records
        - filter: SQL Syntax filter
     */
    public func GetCurrencies(page: Int, size: Int, filter: String) async throws -> [Currency] {
        let payload = GetPayload(Catalog.Currency, page, size, filter);
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<[Currency]>.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    /**
     Get All Insured Events
     - Parameters:
        - page: Page Number ( use 0 to get all records)
        - size: Number of records
        - filter: SQL Syntax filter
     */
    public func GetInsuredEvents(page: Int, size: Int, filter: String) async throws -> [InsuredEvent] {
        let payload = GetPayload(Catalog.InsuredEvent, page, size, filter);
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<[InsuredEvent]>.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    /**
     Get All Event Reasons
     - Parameters:
        - page: Page Number ( use 0 to get all records)
        - size: Number of records
        - filter: SQL Syntax filter
     */
    public func GetEventReasons(page: Int, size: Int, filter: String) async throws -> [EventReason] {
        let payload = GetPayload(Catalog.EventReason, page, size, filter);
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<[EventReason]>.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    /**
     Get All Contact Relationships
     - Parameters:
        - page: Page Number ( use 0 to get all records)
        - size: Number of records
        - filter: SQL Syntax filter
     */
    public func GetRelationships(page: Int, size: Int, filter: String) async throws -> [Relationship] {
        let payload = GetPayload(Catalog.RelationShip, page, size, filter);
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<[Relationship]>.self, from: data);
            if(response.ok){
                return response.outData;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
}
/// Catalog names
public enum Catalog: String{
    case Country = "RepoCountryCatalog";
    case State   = "RepoStateCatalog";
    case City    = "RepoCityCatalog";
    case Currency = "RepoCurrency";
    case InsuredEvent = "RepoInsuredEventCatalog";
    case EventReason = "RepoEventReasonCatalog";
    case RelationShip = "RepoRelationshipCatalog";
}
