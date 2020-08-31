//
//  QuestionController.swift
//  ProposalDaisakusen
//
//  Created by suckerl on 2020/8/27.
//  Copyright © 2020 suckerl. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {

    fileprivate lazy var bgImage: UIImageView = {
        var  bgImage = UIImageView(image: UIImage(named: "bg"))
        bgImage.isUserInteractionEnabled = true
        return bgImage
    }()
    
    fileprivate lazy var progressRate: ProgressRateView = {
        var progressRate = ProgressRateView()
        return progressRate
    }()
    
    fileprivate lazy var questionView: QusetionView = {
        var questionView = QusetionView()
        return questionView
    }()
    
    var dataArray: Array = Array<QuestionModel>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.configData()
    }
     
    
}

// MARK: - Config UI
extension QuestionController {
    func configUI() {
        self.view.addSubview(bgImage)
        self.view.addSubview(progressRate)
        self.view.addSubview(questionView)


        bgImage.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        progressRate.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom).offset(-Height(183))
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(Height(196))
            make.width.equalTo(Width(400))
        }
        
        questionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(Height(223.5))
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(Height(550))
            make.width.equalTo(Width(400))
        }
        
    }
}

// MARK: - Config Data
extension QuestionController {
    func configData() {
        
        let firstModel = QuestionModel(index: 1,
                                       title: "这里是第一题的内容",
                                       type: .OnlyChoice,
                                       choices: ["1","2","3","4"],
                                       results: [false,true,false,false])
        
        
        let secModel = QuestionModel(index: 2,
                                     title: "这是第二题的内容",
                                     type: .MultipleChoice,
                                     choices: ["1","2","3","4"],
                                     results: [true,true,true,true])
        

        dataArray.append(firstModel)
        dataArray.append(secModel)
        
        questionView.bindData(data: firstModel)
    }
}
