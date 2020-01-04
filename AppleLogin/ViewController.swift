//
//  ViewController.swift
//  AppleLogin
//
//  Created by Satyam Kumar on 11/12/19.
//  Copyright © 2019 Satyam Kumar. All rights reserved.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {
    
    @IBOutlet weak var appleButton:UIButton!
    @IBOutlet weak var vwView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vwView.layer.cornerRadius = 10
        self.vwView.clipsToBounds = true
        
    }
    @IBAction func btnAppleLoginAction(_ sender:UIButton){
        
        let provider = ASAuthorizationAppleIDProvider()
        let reuest = provider.createRequest()
        reuest.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [reuest])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
}

extension ViewController: ASAuthorizationControllerDelegate{
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            
            let user = User(credentials: credentials)
            
            print("user.email",user.email)
            print("user.firstName",user.firstName)
            print("user.secondName",user.secondName)
            print("user.id",user.id)
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController")as! MainViewController
            vc.user = user
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        default:
            break
        }
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("something bad happing",error)
    }
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
