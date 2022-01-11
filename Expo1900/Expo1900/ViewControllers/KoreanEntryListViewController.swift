//
//  KoreanEntryListViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class KoreanEntryListViewController: UIViewController {

    @IBOutlet weak var koreanEntryListTableView: UITableView!
    
    var dataSource: KoreanEntryListTableViewDataSoruce!
    private var api: ExpositionApi!
    private var koreanEntryList: [KoreanEntry]? {
        willSet(newKoreanEntryList) {
            if let newKoreanEntryList = newKoreanEntryList {
                dataSource.items = newKoreanEntryList
                koreanEntryListTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.fetchData()
    }
    
    private func fetchData() {
        self.api = ExpositionApiInjection.injectExpositionApi()
        self.api.fetchKoreanEntryList { [weak self] koreanEntryList in
            guard let self = self, let koreanEntryList = koreanEntryList else {
                return
            }
            self.koreanEntryList = koreanEntryList
        }
    }
    
    private func setUpTableView() {
        koreanEntryListTableView.dataSource = self.dataSource
        koreanEntryListTableView.register(
            UINib(nibName: Constant.koreanEntryListCellNibName, bundle: nil),
            forCellReuseIdentifier: Constant.koreanEntryTableViewIdentifier
        )
    }
}

class KoreanEntryListTableViewDataSoruce: NSObject, UITableViewDataSource {
    
    var items: [KoreanEntry]
    
    init(items: [KoreanEntry]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constant.koreanEntryTableViewIdentifier,
            for: indexPath
        ) as? KoreanEntryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.koreanEntryNameLabel.text = items[indexPath.row].name
        cell.koreanEntryShortDescriptionLabel.text = items[indexPath.row].shortDescription
        cell.koreanEntryImageView.image = UIImage(named: items[indexPath.row].imageName)
        
        return cell
    }
}
