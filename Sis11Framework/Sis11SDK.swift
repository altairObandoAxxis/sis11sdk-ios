import Foundation

public let SDK = Sis11SDK.shared;
/**
    Singleton instance for sis11sdk
 - Returns Sis11SDK unique instance.
 - Authors:
     Noel Obando
 - Copyright: Axxis-Systems
 */
public class Sis11SDK{
    private init(){}
    public static let shared = Sis11SDK();
    public let contact: ContactActions = ContactActions();
    public let policy: RepoLifePolicy = RepoLifePolicy();
    public let claim: RepoClaim = RepoClaim();
    public let portal: Portal = Portal();
    public let repo: Repository = Repository();
    private var isBackup: Bool = false;
    private var API_CMD : String = "https://sisos-eu.azurewebsites.net/api/cmd";
    private var API_LOGIN: String = "https://sisos-eu.azurewebsites.net/api/pub/authenticate";
    private var BACKUP_CMD: String = "https://sisos-eu.azurewebsites.net/api/cmd";
    public var token: String = "";
    public var user: ReturnedUserOutData? = nil;
    /**
     This functions allows to change to backup instance(server)
     - Parameter newValue: True, switch to backup environment, False, switch to common server
     */
    public func changeToBackUp( newValue : Bool ){
        isBackup = newValue;
    }
    /**
     This function allows to set the url of the api to be used to communicate with sis11.
     - Parameter newApiUrl: API URL
     */
    public func changeApiUrl(newApiUrl : String){
        API_CMD = newApiUrl;
    }
    /**
     Get the api url
     - Returns String of api url
     */
    public func getApiUrl() -> String{
        return isBackup ? API_CMD : BACKUP_CMD;
    }
    /**
     Generate a new http api request using instance parameters.
     - Returns URLRequest
     */
    func getApiRequest()-> URLRequest{
        var request = URLRequest(url: URL(string: self.getApiUrl())!);
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type");
        request.addValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization");
        return request;
    }
    /**
     Generate a new http api request using instance auth parameters.
     - Returns URLRequest
     */
    func getApiLoginRequest()-> URLRequest{
        var request = URLRequest(url: URL(string: self.API_LOGIN)!);
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type");
        request.addValue("Bearer \(self.user?.token ?? "")", forHTTPHeaderField: "Authorization");
        return request;
    }
    /**
     Make an API request
     - Returns Data
     */
    public func doRequest( jsonContent: Data) async throws -> Data{
        let request: URLRequest = self.getApiRequest();
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: jsonContent);
            return data;
        }catch{
            print(error.localizedDescription)
            throw APIError.invalidHTTPResponse
        }
    }
    /**
     Performs an authentication request to sis11
     - Parameters credentials: User Data credentials intance (email, password)
     - Returns ReturnedUserOutData
     */
    public func doAuth(credentials: Credentials) async throws -> ReturnedUserOutData {
        let request = self.getApiLoginRequest();
        let jsonData =  try! JSONEncoder().encode(credentials)
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: jsonData);
            let response = try JSONDecoder().decode(ReturnedUser.self, from: data);
            if(!response.ok){
                throw APIError.requestFailed(response.msg);
            }
            guard let userOutData = response.outData else {
                throw APIError.requestFailed(response.msg)
            }
            self.user = userOutData;
            self.token = userOutData.token;
            return userOutData;
            
        }catch{
            print(error)
            throw APIError.requestFailed(error.localizedDescription)
        }
        
    }
}
