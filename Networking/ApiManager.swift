//
//  ApiManager.swift
//  HomeHealthPro
//
//  Created by Ankit on 13/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

enum MethodType : String {
    case get = "GET"
    case post = "POST"
}

enum ApiError : Error {
    case errorMsg(message:String)
    
    var errorDescription:String {
        switch self {
        case let .errorMsg(message):
            return message
        }
    }
}

class ApiManager {
    
    static let shared = ApiManager()
    
    fileprivate init() {}
    
    let session = URLSession.shared
    
    var baseUrl:URL?
    
    func fetchData<T:Codable,R:Codable>(endpoints:RemoteService,isAuthRequired:Bool = true,methodType:MethodType, param:R? = nil ,completion: @escaping(Result<T,ApiError>)->()) {
            do {
                let url = endpoints.url
                print(url)
                print("Param \(param)")
                
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = methodType.rawValue
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                
                if isAuthRequired{
                    urlRequest.addValue("Bearer \(GeneralUserDefaultsManager.sharedInstance.token)", forHTTPHeaderField:"Authorization")
                }
                
                if methodType == .post, (param != nil) {
                    urlRequest.httpBody = try JSONEncoder().encode(param)
                }
                
                print("urlRequest =\(urlRequest)")
                
                self.session.dataTask(with: urlRequest) { (data, response, error) in
                    if error == nil {
                        
                        //data check
                        guard let data = data else {
                            completion(.failure(.errorMsg(message: ResponseError.noData.errorDescription ?? "data failure")))
                            return
                        }
                        
                        //status code check
                        if let response = response as? HTTPURLResponse {
                            print("status code : \(response.statusCode) ")
                            
                            switch response.statusCode {
                            case 401:
                                //make applogOut
                                completion(.failure(.errorMsg(message: ResponseError.unauthorizedError.errorDescription ?? "Unauthorized error")))
                                break
                            case 404:
                                completion(.failure(.errorMsg(message: ResponseError.notFound.errorDescription ?? "Not Found")))
                                break
                            case 500:
                                completion(.failure(.errorMsg(message: ResponseError.internalServerError.errorDescription ?? "Internal Server Error")))
                                break
                            default:break
                            }
                        }
                        
                        //final data
                        do {
                            let codableData = try JSONDecoder().decode(T.self, from: data)
                            print("codableData = \(codableData)")
                            completion(.success(codableData))
                        }catch (let error) {
                            print("error = \(error.localizedDescription)")
                            completion(.failure(.errorMsg(message: ResponseError.wrongData.errorDescription ?? "Something went wrong")))
                        }
                    }else {
                        completion(.failure(.errorMsg(message: error?.localizedDescription ?? "Unknown Error")))
                    }
                }.resume()
                
                
            }catch (let error){
                completion(.failure(.errorMsg(message: error.localizedDescription)))
                return
            }
        }
    
}

