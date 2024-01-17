//
//  ViewController.swift
//  Singleton
//
//  Created by white4ocolate on 15.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let safe = Safe.shared
        print(safe.money)
        
    }


}

