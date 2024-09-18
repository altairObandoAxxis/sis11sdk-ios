//
//  File.swift
//  
//
//  Created by NOEL OBANDO on 26/8/24.
//

import Foundation
/**
 DoCmd Action
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public class DoCmd<T: Codable> {
    /**
     Executes a system command chain.
     - Parameters:
        - chain: Command chain name
        - context: Command chain data context JSON string
     - Authors:
         Noel Obando
     - Copyright: Axxis-Systems
     */
    public func ExeChain(chain:String, context: String ) async throws -> DoCmdDto<T> {
        let payload: [String : Any ] = [
            "cmd": "ExeChain",
            "data": [
                "chain": chain,
                "context": context
            ]
        ];
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<T>.self, from: data);
            if(response.ok){
                return response;
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    /**
     Executes a native system command.
     - Parameters:
       - cmd: Command name
       - data: Command arguments.
     - Authors:
         Noel Obando
     - Copyright: Axxis-Systems
     */
    public func DoCmd( cmd: String, data: [String: String]) async throws -> DoCmdDto<T> {
        let payload: [String : Any ] = [
            "cmd": cmd,
            "data": data
        ];
        guard let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []) else { throw APIError.encodingError }
        do{
            let data = try await Sis11SDK.shared.doRequest(jsonContent: jsonData);
            let response = try JSONDecoder().decode(DoCmdDto<T>.self, from: data);
            if(response.ok){
                return response
            }
            throw APIError.requestFailed(response.msg);
        }
    }
    
}
