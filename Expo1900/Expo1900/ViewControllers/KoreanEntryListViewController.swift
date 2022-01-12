//
//  KoreanEntryListViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class KoreanEntryListViewController: UIViewController {

    @IBOutlet weak var koreanEntryListTableView: UITableView!
    
    var dataSource: UITableViewDataSource!
    var delegate: KoreanEntryListTableViewDelegate!
    private var api: ExpositionApi!
    private var koreanEntryList: [KoreanEntry]? {
        willSet(newKoreanEntryList) {
            if let newKoreanEntryList = newKoreanEntryList,
               let dataSource = dataSource as? KoreanEntryListTableViewDataSoruce {
                dataSource.items = newKoreanEntryList
                delegate.items = newKoreanEntryList
                koreanEntryListTableView.reloadData()
            }
        }
    }
    private var selectedKoreanEntry: KoreanEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.fetchData()
        self.setUpNotificationObserver()
    }
    
    private func setUpNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showDetailKoreanEntry),
            name: NSNotification.Name(Constant.showDetailKoreanEntryNotification),
            object: nil
        )
    }
    
    @objc func showDetailKoreanEntry(_ notification: Notification) {
        print(1)
        guard let koreanEntry = notification.object as? KoreanEntry else {
            return
        }
        print(2)
        selectedKoreanEntry = koreanEntry
        self.performSegue(withIdentifier: Constant.KoreanEntryDetailViewControllerIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as? KoreanEntryDetailViewController
        destinationViewController?.koreanEntry = selectedKoreanEntry
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
        delegate = KoreanEntryListTableViewDelegate(items: [])
        koreanEntryListTableView.delegate = self.delegate
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

class KoreanEntryListTableViewDelegate: NSObject, UITableViewDelegate {
    
    var items: [KoreanEntry]
    
    init(items: [KoreanEntry]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(
            name: NSNotification.Name(Constant.showDetailKoreanEntryNotification),
            object: items[indexPath.row]
        )
        print("ok")
    }
}
