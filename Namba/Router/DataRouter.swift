//
//  datarouter.swift
//  Namba
//
//  Created by Mac on 16/6/23.
//

import Foundation
import Moya
import RxSwift

enum DataRouter: GithubRouterProtocol {
    var tokenStorage: TokenStorage {
        UserDefaultsHelper()
    }
    case userData
    
    var path: String {
        switch self {
        case .userData:
            return "user"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .userData:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .userData:
            return .requestPlain
        }
    }
}
