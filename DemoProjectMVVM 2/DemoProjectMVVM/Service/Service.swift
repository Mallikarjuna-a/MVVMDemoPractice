//
//  Service.swift
//  DemoProjectMVVM
//
//  Created by Mallikarjuna A on 30/08/24.
//

import Foundation
enum HTTPMehod: String {
    case GET
    case POST
}
enum ServerError: Error {
case errorMessage(String)
}
class Server {
    
//    static let shared = Server()
//    init() {}
    
    func fetchData<T:Decodable>(with method: HTTPMehod, path: String, responseModel: T.Type) async throws -> (T, Data) {
    
        guard let urlpath = URL(string: path) else {
            throw ServerError.errorMessage("Invalid url")
        }
        let request = try buildRequest(method: method, path: urlpath)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            do {
                let jsonObj = try JSONDecoder().decode(responseModel.self, from: data)
                return (jsonObj,data)
            } catch {
                debugPrint("unable to parse data")
                throw ServerError.errorMessage("unable to parse data")
            }
            
        } catch let error {
            
            debugPrint(error)
            throw ServerError.errorMessage(error.localizedDescription)
        }
    }
    
    private func buildRequest(method: HTTPMehod, path: URL) throws -> URLRequest {
        var urlRequestObj = URLRequest(url: path)
        urlRequestObj.httpMethod = method.rawValue
        // can provide params body data here if have any
        return urlRequestObj
    }
}
