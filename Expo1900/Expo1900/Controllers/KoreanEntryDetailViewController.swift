//
//  KoreanEntryDetailViewController.swift
//  Expo1900
//
//  Created by 이승주 on 2022/01/12.
//

import UIKit

class KoreanEntryDetailViewController: UIViewController {
    
    @IBOutlet weak var koreanEntryStackView: UIStackView!
    @IBOutlet weak var koreanEntryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var landscapeImageContainerView: UIView!
    @IBOutlet weak var landsacpeContainerWidthConstraint: NSLayoutConstraint!
    
    private lazy var imageViewHeightConstraint: NSLayoutConstraint = {
        self.koreanEntryImageView.heightAnchor.constraint(
            lessThanOrEqualTo: view.safeAreaLayoutGuide.heightAnchor,
            multiplier: 0.3
        )
    }()
    
    private lazy var imageViewConstraints: [NSLayoutConstraint?] = {
        
        self.koreanEntryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            self.koreanEntryImageView.leadingAnchor.constraint(
                equalTo: self.landscapeImageContainerView.leadingAnchor,
                constant: 10
            ),
            self.koreanEntryImageView.trailingAnchor.constraint(
                equalTo: self.landscapeImageContainerView.trailingAnchor,
                constant: 10
            ),
            self.koreanEntryImageView.centerYAnchor.constraint(
                equalTo: self.landscapeImageContainerView.centerYAnchor
            ),
            self.koreanEntryImageView.widthAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.widthAnchor,
                multiplier: 0.3
            )
        ]
        return constraints
    }()
    
    var koreanEntry: KoreanEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNotificationObserver()
        self.configureUI()
    }
    
    private func setUpNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.detectOrientation),
            name: NSNotification.Name(Constant.screenRotatingNotification),
            object: nil
        )
    }
    
    private func configureUI() {
        guard let koreanEntry = self.koreanEntry else {
            return
        }
        
        self.navigationItem.title = koreanEntry.name
        self.koreanEntryImageView.image = UIImage(named: koreanEntry.imageName)
        self.descriptionLabel.text = koreanEntry.description
    }
    
    @objc func detectOrientation() {
        switch UIDevice.current.orientation {
        case .landscapeLeft, .landscapeRight:
            self.configureLandscapeLayout()
        case .portrait:
            self.configurePortraitLayout()
        default:
            break
        }
    }
    
    private func configureLandscapeLayout() {
        self.koreanEntryImageView.removeFromSuperview()
        self.landscapeImageContainerView.addSubview(self.koreanEntryImageView)
        self.imageViewConstraints.forEach { $0?.isActive = true }
        self.imageViewHeightConstraint.isActive = false
        self.landsacpeContainerWidthConstraint.priority = .defaultLow
    }
    
    private func configurePortraitLayout() {
        self.imageViewConstraints.forEach { $0?.isActive = false }
        self.koreanEntryImageView.removeFromSuperview()
        self.landscapeImageContainerView.setNeedsLayout()
        self.koreanEntryStackView.insertArrangedSubview(self.koreanEntryImageView, at: 0)
        self.imageViewHeightConstraint.isActive = true
        self.landsacpeContainerWidthConstraint.priority = .defaultHigh
    }
}
