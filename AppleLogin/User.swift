//
//  User.swift
//  AppleLogin
//
//  Created by Satyam Kumar on 12/12/19.
//  Copyright © 2019 Satyam Kumar. All rights reserved.
//

import Foundation
import AuthenticationServices

struct User {
    let id:String
    let firstName:String
    let secondName:String
    let email:String
    
    
    init(credentials:ASAuthorizationAppleIDCredential) {
        self.id = credentials.user
        self.firstName =  credentials.fullName?.givenName ?? ""
        self.secondName = credentials.fullName?.familyName ?? ""
        self.email = credentials.email ?? ""
    }
    
    
}
extension User: CustomDebugStringConvertible{
    var debugDescription: String{
        return """
        ID:\(id)
        FirstName:\(firstName)
        SecondName:\(secondName)
        Email:\(email)
        """
    }
    
}
