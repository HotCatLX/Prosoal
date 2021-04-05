//
//  StartController.swift
//  ProposalDaisakusen
//
//  Created by suckerl on 2020/8/26.
//  Copyright © 2020 suckerl. All rights reserved.
//

import UIKit
import SnapKit

class StartController: UIViewController {
    
    fileprivate lazy var bgImage: UIImageView = {
        var bgImage = UIImageView(image: UIImage(named:"splash"))
        return bgImage
    }()
    
    fileprivate lazy var jumpBtn: UIButton = {
        var jumpBtn = UIButton()
        jumpBtn.setTitle("Start", for: .normal)
        jumpBtn.titleLabel?.font = UIFont(name: "Zapfino", size: 25)
        jumpBtn.setTitleColor(ColorText_red, for: .normal)
        jumpBtn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        return jumpBtn
    }()
    
    let noticeStrAry: Array = ["准备好了么?","确定准备好了么?","那么开始喽!"]

    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }
}


// MARK: - Action
extension StartController {

    @objc func btnClick(btn: UIButton) {
        if currentIndex >= noticeStrAry.count  {
            let questionVC: QuestionController = QuestionController()
            questionVC.modalPresentationStyle = .fullScreen
            self.present(questionVC, animated: true, completion: nil)
        }else {
            let noticeStr: String = noticeStrAry[currentIndex]
                   currentIndex += 1
            ToastView.shared().show(str: noticeStr)
        }
    }
}

// MARK: - Config UI
extension StartController {
    func configUI() {
        view.addSubview(bgImage)
        view.addSubview(jumpBtn)

        bgImage.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        jumpBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(Width(300))
            make.height.equalTo(Height(46))
            make.bottom.equalTo(self.view.snp.bottom).offset(-Height(150))
        }

        
    }
}
