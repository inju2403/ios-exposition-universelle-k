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
    var delegate: UITableViewDelegate!
    
    private var api: ExpositionApi?
    private var selectedKoreanEntry: KoreanEntry?
    private var koreanEntryList: [KoreanEntry]? {
        willSet(newKoreanEntryList) {
            if let newKoreanEntryList = newKoreanEntryList,
               let dataSource = dataSource as? KoreanEntryListTableViewDataSoruce {
                dataSource.items = newKoreanEntryList
                koreanEntryListTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpTableView()
        self.fetchData()
        self.setUpNotificationObserver()
    }
    
    private func fetchData() {
        self.api = ExpositionApiInjection.injectExpositionApi()
        self.api?.fetchKoreanEntryList { [weak self] koreanEntryList in
            self?.koreanEntryList = koreanEntryList
        }
    }
    
    private func setUpTableView() {
        self.koreanEntryListTableView.dataSource = self.dataSource
        self.koreanEntryListTableView.delegate = self.delegate
        self.koreanEntryListTableView.register(
            UINib(nibName: Constant.koreanEntryListCellNibName, bundle: nil),
            forCellReuseIdentifier: Constant.koreanEntryTableViewIdentifier
        )
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
        guard let selected = notification.object as? Int else {
            return
        }
        
        self.selectedKoreanEntry = koreanEntryList?[selected]
        self.performSegue(withIdentifier: Constant.KoreanEntryDetailViewControllerIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as? KoreanEntryDetailViewController
        destinationViewController?.koreanEntry = selectedKoreanEntry
    }
}
