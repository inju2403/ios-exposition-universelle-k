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
    
    private var api: ExpositionRepository?
    private var universalExposition: UniversalExposition? {
        didSet {
            configureUI()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func fetchData() {
        self.api = ExpositionRepositoryInjection.injectExpositionRepository()
        self.api?.fetchExposition { [weak self] universalExposition in
            self?.universalExposition = universalExposition
        }
    }
    
    private func configureUI() {
        self.titleLabel.text = self.universalExposition?.title
        self.visitorsLabel.text = "\(self.universalExposition?.visitors ?? 0) 명"
        self.locationLabel.text = self.universalExposition?.location
        self.durationLabel.text = self.universalExposition?.duration
        self.descriptionLabel.text = self.universalExposition?.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as? KoreanEntryListViewController
        destinationViewController?.dataSource = KoreanEntryListTableViewDataSoruce()
        destinationViewController?.delegate = KoreanEntryListTableViewDelegate()
    }
}

