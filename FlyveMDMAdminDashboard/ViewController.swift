//
//  ViewController.swift
//  FlyveMDMAdminDashboard
//
//  Created by Hector Rondon on 20/07/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        navigationItem.title = NSLocalizedString("title_admin", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

