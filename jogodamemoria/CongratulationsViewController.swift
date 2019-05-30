//
//  CongratulationsViewController.swift
//  jogodamemoria
//
//  Created by Paula Tomasi Andrade on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {
    @IBAction func touchPlayAgain(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
