//
//  IssueData.swift
//  sisosmobile
//
//  Created by NOEL OBANDO on 28/2/24.
//

import Foundation
public struct IssueData:Codable{
    public var operation:String="ADD";
    public var entity: Issue;
    public var filter:String?;
    public init(entity: Issue, filter: String? = nil) {
        self.operation = "ADD"
        self.entity = entity
        self.filter = filter
    }
}
