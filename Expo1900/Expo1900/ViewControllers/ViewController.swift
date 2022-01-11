//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let repository = Repository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let universalExpoistion = repository.getUniversalExposition() else {
            return
        }
        print(universalExpoistion)
    }


}

