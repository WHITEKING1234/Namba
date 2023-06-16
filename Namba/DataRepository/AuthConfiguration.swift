//
//  AuthConfiguration.swift
//  Namba
//
//  Created by Mac on 16/6/23.
//

import Foundation
struct AuthConfiguration {
    static let baseUrl = "https://github.com/"
    static let authUri = "login/oauth/authorize"
    static let tokenUri = "login/oauth/access_token"
    static let endSessionUri = "logout"
    static let scopes = ["user", "repo"]
    static let clientId = "11cc2f0622ffb9631dff"
    static let clientSecret = "4d2fbe508dd869b748008d7c02e9cb94e87a6afd"
    static let callbackUrl = "http://GithubClient:9090/callback"
    static let logoutCallbackUrl = "http://GithubClient:9090/logout_callback"
}
