import Foundation
public struct doCmd:Codable{
    let cmd:String;
    let data: doCmdData;
}
public struct doCmdData: Codable {
    var operation:String?
    var filter:String?
    var page:Int?
    var size:Int?
    var noTracking:Bool? = true;
    var include:[String]?
    var context:String?
}
public struct GetPingDTO: Codable{
    public let user: String;
    public let environment: String;
}
public class DoCmdDto<T: Codable> : Codable{
    public let cmd: String;
    public let ok: Bool;
    public let msg:String
    public let outData: T
    
}
