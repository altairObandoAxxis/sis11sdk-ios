import Foundation

public let SDK = Sis11SDK.shared;

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
    
    public func changeToBackUp( newValue : Bool ){
        isBackup = newValue;
    }
    public func changeApiUrl(newApiUrl : String){
        API_CMD = newApiUrl;
    }
    public func getApiUrl() -> String{
        return isBackup ? API_CMD : BACKUP_CMD;
    }
    func getApiRequest()-> URLRequest{
        var request = URLRequest(url: URL(string: self.getApiUrl())!);
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type");
        request.addValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization");
        return request;
    }
    func getApiLoginRequest()-> URLRequest{
        var request = URLRequest(url: URL(string: self.API_LOGIN)!);
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type");
        request.addValue("Bearer \(self.user?.token ?? "")", forHTTPHeaderField: "Authorization");
        return request;
    }    
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
