//
//  SignInOption.swift
//  SwiftfulAuthenticating
//
//  Created by Nick Sarno on 9/28/24.
//

import Foundation

public enum SignInOption: Sendable {
    case apple, anonymous
    case google(GIDClientID: String)
    case emailLink(email: String, signInLinkURL: String)
    case emailLinkVerify(url: URL)
    case emailPassword(email: String, password: String)
    
    public var stringValue: String {
        switch self {
        case .apple:
            return "apple"
        case .anonymous:
            return "anonymous"
        case .google:
            return "google"
        case .emailLink:
            return "emailLink"
        case .emailLinkVerify:
            return "emailLinkVerify"
        case .emailPassword:
            return "emailPassword"
        }
    }
    
    var eventParameters: [String: Any] {
        var params = ["sign_in_option": stringValue]
        
        switch self {
        case .emailLink(let email, _), .emailPassword(let email, _):
            params["email"] = email
        default:
            break
        }
        
        return params
    }
}
