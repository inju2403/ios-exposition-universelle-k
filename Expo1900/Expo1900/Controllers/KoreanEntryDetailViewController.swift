//
//  KoreanEntryDetailViewController.swift
//  Expo1900
//
//  Created by 이승주 on 2022/01/12.
//

import UIKit

class KoreanEntryDetailViewController: UIViewController {

    @IBOutlet weak var koreanEntryDetailSuperStackView: UIStackView!
    @IBOutlet weak var koreanEntryDeatilScrollView: UIScrollView!
    @IBOutlet weak var koreanEntryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var koreanEntryDetailInnerStackView: UIStackView!
    
    var koreanEntry: KoreanEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let koreanEntry = koreanEntry else {
            return
        }
        
        self.navigationItem.title = koreanEntry.name
        koreanEntryImageView.image = UIImage(named: koreanEntry.imageName)
        descriptionLabel.text = koreanEntry.description
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.detectOrientation),
            name: NSNotification.Name("UIDeviceOrientationDidChangeNotification"),
            object: nil
        )
    }
    
    @objc private func detectOrientation() {
        switch UIDevice.current.orientation {
        case .landscapeLeft,.landscapeRight:
            koreanEntryImageView.removeFromSuperview()
            koreanEntryDetailSuperStackView.insertArrangedSubview(koreanEntryImageView, at: 0)
            
            koreanEntryImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ).isActive = true
            koreanEntryImageView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -20
            ).isActive = true
            koreanEntryImageView.widthAnchor.constraint(
                lessThanOrEqualTo: koreanEntryDetailSuperStackView.widthAnchor,
                multiplier: 0.3
            ).isActive = true
        case .portrait:
            koreanEntryImageView.removeFromSuperview()
            koreanEntryDetailInnerStackView.insertArrangedSubview(koreanEntryImageView, at: 0)
            
            koreanEntryImageView.topAnchor.constraint(
                equalTo: koreanEntryDetailInnerStackView.topAnchor,
                constant: 30
            ).isActive = true
            koreanEntryImageView.centerXAnchor.constraint(
                equalTo: koreanEntryDetailInnerStackView.centerXAnchor
            ).isActive = true
            koreanEntryImageView.heightAnchor.constraint(
                lessThanOrEqualTo: koreanEntryDeatilScrollView.frameLayoutGuide.heightAnchor,
                multiplier: 0.3
            ).isActive = true
            
            descriptionLabel.topAnchor.constraint(
                equalTo: koreanEntryImageView.bottomAnchor,
                constant: 30
            ).isActive = true
        default:
            break
        }
    }
}
