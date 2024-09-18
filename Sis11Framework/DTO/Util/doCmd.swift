import Foundation
/**
 doCmd Dto
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct doCmd:Codable{
    let cmd:String;
    let data: doCmdData;
}
/**
 Generic data to doCmd parameters
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct doCmdData: Codable {
    var operation:String?
    var filter:String?
    var page:Int?
    var size:Int?
    var noTracking:Bool? = true;
    var include:[String]?
    var context:String?
}
/**
 Get Ping DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public struct GetPingDTO: Codable{
    public let user: String;
    public let environment: String;
}
/**
 DoCmd  Generic full DTO
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public class DoCmdDto<T: Codable> : Codable{
    public let cmd: String;
    public let ok: Bool;
    public let msg:String
    public let outData: T
    
}
