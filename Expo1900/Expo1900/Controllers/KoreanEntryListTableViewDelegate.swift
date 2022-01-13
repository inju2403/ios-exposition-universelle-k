//
//  KoreanEntryListTableViewDelegate.swift
//  Expo1900
//
//  Created by 이승주 on 2022/01/12.
//

import UIKit

class KoreanEntryListTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(
            name: NSNotification.Name(Constant.showDetailKoreanEntryNotification),
            object: nil,
            userInfo: [Constant.selectedIndexPathRow : indexPath.row]
        )
    }
}
