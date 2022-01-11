//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expositionImageView: UIImageView!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let repository = Repository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let universalExpoistion = repository.getUniversalExposition() else {
            return
        }
        print(universalExpoistion)
    }


}

