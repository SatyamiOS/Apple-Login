//
//  MainViewController.swift
//  AppleLogin
//
//  Created by Satyam Kumar on 12/12/19.
//  Copyright © 2019 Satyam Kumar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var lblDetail:UILabel!
    
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblDetail.text = user.id
        
        print("user",user)
    }
    

    

}
