//
//  KoreanEntryTableViewCell.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class KoreanEntryTableViewCell: UITableViewCell {

    @IBOutlet weak var koreanEntryImageView: UIImageView!
    @IBOutlet weak var koreanEntryNameLabel: UILabel!
    @IBOutlet weak var koreanEntryShortDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
