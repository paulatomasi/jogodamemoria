//
//  CongratulationsViewController.swift
//  jogodamemoria
//
//  Created by Paula Tomasi Andrade on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {
    private let welcomeSegue = "show-welcome"
    
    @IBAction func touchPlayAgain(_ sender: Any) {
        self.performSegue(withIdentifier: welcomeSegue, sender: nil)
    }
}
