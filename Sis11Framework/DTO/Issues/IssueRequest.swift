//
//  IssueRequest.swift
//  sisosmobile
//
//  Created by NOEL OBANDO on 28/2/24.
//

import Foundation
public struct IssueRequest:Codable{
    public var cmd:String="RepoIssue";
    public var data: IssueData;
    public init(data: IssueData) {
        self.cmd = "RepoIssue"
        self.data = data
    }
}
