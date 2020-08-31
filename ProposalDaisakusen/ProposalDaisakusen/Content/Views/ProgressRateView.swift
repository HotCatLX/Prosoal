//
//  ProgressRateView.swift
//  ProposalDaisakusen
//
//  Created by suckerl on 2020/8/29.
//  Copyright © 2020 suckerl. All rights reserved.
//

import UIKit
import SnapKit

class ProgressRateView: UIView {
    
    fileprivate lazy var girlImage: UIImageView  = {
        var girlImage = UIImageView(image: UIImage(named:"girl"))
        return girlImage
    }()
    
    fileprivate lazy var boyImage: UIImageView = {
        var boyImage = UIImageView(image: UIImage(named:"boy"))
        return boyImage
    }()
    
    fileprivate lazy var middleLine: UIImageView = {
        var middleLine = UIImageView(image:UIImage(named: "progressbar"))
        return middleLine
    }()
    
    let maxProgress: CGFloat = 5.0
    
    let selfWidth = Width(400)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(girlImage)
        self.addSubview(boyImage)
        self.addSubview(middleLine)
    
        self.connstructLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension ProgressRateView {
    
    func connstructLayout() {
        
        girlImage.snp.makeConstraints { (make) in
            make.height.equalTo(Width(75))
            make.right.equalTo(self.snp.right)
            make.width.equalTo(Width(75))
            make.top.equalTo(self)
        }
        
        middleLine.snp.makeConstraints { (make) in
            make.top.equalTo(girlImage.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(Height(46))
        }
        
        boyImage.snp.makeConstraints { (make) in
            make.top.equalTo(middleLine.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.width.height.equalTo(Width(75))
        }
        
    }
    
}

// MARK: - Progress
extension ProgressRateView {

    public func changeProgressRate(progress: CGFloat) {
        var rate = progress
        if rate < 1.0 { rate = 1.0}
        if rate >= 4.0 { rate = 4.0}
        
        let changeXValue = selfWidth * ( rate / maxProgress )
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.boyImage.snp.updateConstraints { (make) in
                make.left.equalTo(changeXValue)
            }
        }
        
    }
    
}
