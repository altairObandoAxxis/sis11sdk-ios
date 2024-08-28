//
//  Issue.swift
//  sisosmobile
//
//  Created by NOEL OBANDO on 28/2/24.
//

import Foundation
public struct Issue:Codable{
    public var id:Int;
    public var contactId:Int;
    public var title:String?;
    public var description:String?;
    public var issueType:String?
    public var issueReason:String?;
    public var priorityCode:String?;
    public var policyId:Int?;
    public var externalId:String?;
    public var lifeCoverageId:Int?;
    public init(id: Int, contactId: Int, title: String? = nil, description: String? = nil, issueType: String? = nil, issueReason: String? = nil, priorityCode: String? = nil, policyId: Int? = nil, externalId: String? = nil, lifeCoverageId: Int? = nil) {
        self.id = id
        self.contactId = contactId
        self.title = title
        self.description = description
        self.issueType = issueType
        self.issueReason = issueReason
        self.priorityCode = priorityCode
        self.policyId = policyId
        self.externalId = externalId
        self.lifeCoverageId = lifeCoverageId
    }
}
