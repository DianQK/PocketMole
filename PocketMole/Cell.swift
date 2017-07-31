//
//  Cell.swift
//  PocketMole
//
//  Created by DianQK on 2017/7/31.
//  Copyright © 2017年 dianqk. All rights reserved.
//

import UIKit
import RxSwift

class Cell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    private(set) var reuseDisposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView = UIView()//UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        selectedBackgroundView?.backgroundColor = UIColor.lightGray
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reuseDisposeBag = DisposeBag()
    }
    
}
