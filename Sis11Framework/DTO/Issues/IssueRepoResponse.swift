//
//  IssueRepoResponse.swift
//  sisosmobile
//
//  Created by NOEL OBANDO on 28/2/24.
//

import Foundation
public struct IssueResponse:Codable{
    public var cmd:String="RepoIssue";
    public var data: IssueData;
    public var msg:String;
    public var ok:Bool;
    public var outData: [Issue];
}
