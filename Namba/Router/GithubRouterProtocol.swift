//
//  githubrouter.swift
//  Namba
//
//  Created by Mac on 16/6/23.
//

import Foundation
import Moya

protocol GithubRouterProtocol: TargetType {
    
    var tokenStorage: TokenStorage { get }
    
    var baseURL: URL { get }
    var headers: [String : String]? { get }
    var sampleData: Data { get }
}

extension GithubRouterProtocol {
    
    var baseURL: URL {
        return URL(string: "https://api.github.com/")!
    }
    
    var headers: [String : String]? {
        guard let token = tokenStorage.getToken()?.access else {
            return nil
        }
        return ["Authorization": "token \(token)"]
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
}
