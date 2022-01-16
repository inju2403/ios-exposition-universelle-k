//
//  KoreanEntryDetailViewController.swift
//  Expo1900
//
//  Created by 이승주 on 2022/01/12.
//

import UIKit

class KoreanEntryDetailViewController: UIViewController {

    @IBOutlet weak var koreanEntryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var koreanEntry: KoreanEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let koreanEntry = koreanEntry else {
            return
        }
        
        koreanEntryImageView.image = UIImage(named: koreanEntry.imageName)
        descriptionLabel.text = koreanEntry.description
    }
}
