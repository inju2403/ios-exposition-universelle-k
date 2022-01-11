//
//  ListViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class KoreanEntryListViewController: UIViewController {

    @IBOutlet weak var koreanEntryListTableView: UITableView!
    private let dataSource: KoreanEntryListTableViewDataSoruce = KoreanEntryListTableViewDataSoruce(items: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        koreanEntryListTableView.dataSource = dataSource
        
        koreanEntryListTableView.register(
            UINib(nibName: Constant.koreanEntryListCellNibName, bundle: nil),
            forCellReuseIdentifier: Constant.koreanEntryTableViewIdentifier
        )
    }

}

class KoreanEntryListTableViewDataSoruce: NSObject, UITableViewDataSource {
    
    private var items: [KoreanEntry]
    
    init(items: [KoreanEntry]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.koreanEntryTableViewIdentifier, for: indexPath)
        
        return cell
    }
}
