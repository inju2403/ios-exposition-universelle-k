//
//  KoreanEntryListTableViewDataSoruce.swift
//  Expo1900
//
//  Created by 이승주 on 2022/01/12.
//

import UIKit

class KoreanEntryListTableViewDataSoruce: NSObject, UITableViewDataSource {
    var items: [KoreanEntry]
    
    init(items: [KoreanEntry] = []) {
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
