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
    
    var currentDataIndex = 0
    
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
                                       title: "我们的纪念日是哪一天呢?",
                                       type: .OnlyChoice,
                                       choices: ["6月8日","7月28日","9月8日","5月27日"],
                                       results: [false,false,false,true])
        
        
        let secModel = QuestionModel(index: 2,
                                     title: "我对你的爱称有哪些?",
                                     type: .MultipleChoice,
                                     choices: ["陈🦁","陈🐷","陈阔💖","陈老板"],
                                     results: [true,true,true,true])
        
        let thirdModel = QuestionModel(index: 3,
                                            title: "我在你心目中的形象模板有哪几个?",
                                            type: .MultipleChoice,
                                            choices: ["西湖区吴彦祖","余杭区李嘉诚","闲湖城彭于晏","印象湾巨有钱"],
                                            results: [true,true,false,false])
        
        let forthModel = QuestionModel(index: 4,
                                                 title: "你觉得为什么我们会携手走进爱情的坟墓(婚姻)?",
                                                 type: .OnlyChoice,
                                                 choices: ["真爱的义无反顾无所畏惧","我们比较合适","我们在一起很久了","我们都很互补"],
                                                 results: [true,false,false,false])
        
        dataArray.append(firstModel)
        dataArray.append(secModel)
        dataArray.append(thirdModel)
        dataArray.append(forthModel)

        questionView.bindData(data: firstModel)
        
        questionView.clickCallBackHandler = { (currentmodel, resultsArray) -> Void in
            if currentmodel?.choiceType == nil {
                return
            }
            
            if currentmodel!.choiceType == .OnlyChoice {
                self.changeNextData()
            }else {
                if currentmodel?.resultArray == resultsArray {
                    self.changeNextData()
                }else {
                     ToastView.shared().show(str: "这可是多选题,再想想!!!")
                }
            }
        }
        
    }
    
    
    
    func changeNextData() {
        self.changeProgressRate()
        
        currentDataIndex += 1
        if currentDataIndex >= dataArray.count {
            let gameVC: GameController = GameController()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true, completion: nil)
        }else {
            let newData = dataArray[currentDataIndex]
            questionView.bindData(data: newData)
        }
        
    }
    
    func changeProgressRate()  {
        var progress: CGFloat = self.progressRate.getCurrentProgress()
        progress += 1.0
        progressRate.changeProgressRate(progress: progress)
    }
}
