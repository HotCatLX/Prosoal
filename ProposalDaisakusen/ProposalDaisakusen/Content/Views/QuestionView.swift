//
//  QuestionView.swift
//  ProposalDaisakusen
//
//  Created by suckerl on 2020/8/29.
//  Copyright © 2020 suckerl. All rights reserved.
//

import UIKit
import Foundation


class QuestionModel: NSObject {
    
    enum QuestionModelType {
        case OnlyChoice
        case MultipleChoice
    }
    
    var choiceType: QuestionModelType?
    
    var currentIndex: NSInteger?
    
    var titleStr: String?
    
    var choiceArray: [String]?
    
    var resultArray: [Bool]?
    
    public convenience init(index: NSInteger,
                            title: String,
                            type: QuestionModelType,
                            choices: [String],
                            results: [Bool]
                            ) {
        self.init()
        self.currentIndex = index
        self.titleStr = title
        self.choiceArray = choices
        self.resultArray = results
        self.choiceType = type
    }

}

typealias callBackHandler = (_ model: QuestionModel?, _ results: [Bool]) -> Void

class QusetionView: UIView {
    
    //subviews
    fileprivate lazy var titleLabel: UILabel  = {
        var titleLabel = UILabel(text: "第 1 题", color: ColorTitle_Question, fontSize: 32)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    fileprivate lazy var seperateLine: UIImageView = {
        let seperateLine = UIImageView(image: UIImage(named: "line"))
        return seperateLine
    }()
    
    fileprivate lazy var infoLabel: UILabel = {
        let info = UILabel(text: "题干在这里，比如陈老板最喜欢吃什么？题干在这里选出陈老板最喜欢吃的那个？题干这里最长三行应该够吧", color: ColorInfo_Question, fontSize: 21)
        info.numberOfLines = 3
        return info
    }()
      
    fileprivate lazy var firstBtn: UIButton = {
        let first = UIButton(title: "first", textColor: ColorInfo_Question, backColor: UIColor.clear, fontSize: 21, corner: 17)
        first.setTitleColor(UIColor.white, for: .selected)
        first.layer.borderColor = UIColor(hexStr: "#EEB5AD").cgColor
        first.layer.borderWidth = 1
        first.tag = 0
        first.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        return first
    }()
    
    fileprivate lazy var secBtn: UIButton = {
        let sec = UIButton(title: "sec", textColor: ColorInfo_Question, backColor: UIColor.clear, fontSize: 21, corner: 17)
        sec.setTitleColor(UIColor.white, for: .selected)
        sec.layer.borderColor = UIColor(hexStr: "#EEB5AD").cgColor
        sec.layer.borderWidth = 1
        sec.tag = 1
        sec.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        return sec
    }()
    
    fileprivate lazy var thirdBtn: UIButton = {
        let third = UIButton(title: "third", textColor: ColorInfo_Question, backColor: UIColor.clear, fontSize: 21, corner: 17)
        third.setTitleColor(UIColor.white, for: .selected)
        third.layer.borderColor = UIColor(hexStr: "#EEB5AD").cgColor
        third.layer.borderWidth = 1
        third.tag = 2
        third.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        return third
    }()
    
    fileprivate lazy var forthBtn: UIButton = {
        let forth = UIButton(title: "forth", textColor: ColorInfo_Question, backColor: UIColor.clear, fontSize: 21, corner: 17)
        forth.setTitleColor(UIColor.white, for: .selected)
        forth.layer.borderColor = UIColor(hexStr: "#EEB5AD").cgColor
        forth.layer.borderWidth = 1
        forth.tag = 3
        forth.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        return forth
    }()
    
    fileprivate lazy var errorImage: UIImageView = {
        var errorImage = UIImageView(image: UIImage(named:"qipao"))
        errorImage.isHidden = true
        return errorImage
    }()
    
    //data
    var defaultResults: [Bool] = [false,false,false,false]
    
    var currentModel: QuestionModel?
    
    //status
    var selectBtn: UIButton?
    
    //回调handler
    public var clickCallBackHandler: callBackHandler!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        self.addSubview(seperateLine)
        self.addSubview(infoLabel)
        self.addSubview(firstBtn)
        self.addSubview(secBtn)
        self.addSubview(thirdBtn)
        self.addSubview(forthBtn)
        self.addSubview(errorImage)
        self.connstructLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



// MARK: - UI
extension QusetionView {
    
    func clearData() {
        self.errorImage.isHidden = true
        self.titleLabel.text = ""
        self.infoLabel.text = ""
        self.firstBtn .setTitle("", for: .normal)
        self.secBtn .setTitle("", for: .normal)
        self.thirdBtn .setTitle("", for: .normal)
        self.secBtn .setTitle("", for: .normal)
        self.defaultResults = [false,false,false,false]
    }
    
    
    func connstructLayout() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(Height(45))
        }
        
        seperateLine.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(Height(3.5))
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(Width(262.5))
            make.height.equalTo(Height(16))
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(seperateLine.snp.bottom).offset(Height(36))
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(Width(340))
            make.height.equalTo(Height(89))
        }
        
        firstBtn.snp.makeConstraints { (make) in
            make.top.equalTo(infoLabel.snp.bottom).offset(Height(32))
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(Width(340))
            make.height.equalTo(Height(50))
        }
        
        secBtn.snp.makeConstraints { (make) in
            make.top.equalTo(firstBtn.snp.bottom).offset(Height(32))
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(Width(340))
            make.height.equalTo(Height(50))
        }
        
        thirdBtn.snp.makeConstraints { (make) in
            make.top.equalTo(secBtn.snp.bottom).offset(Height(32))
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(Width(340))
            make.height.equalTo(Height(50))
        }
        
        forthBtn.snp.makeConstraints { (make) in
            make.top.equalTo(thirdBtn.snp.bottom).offset(Height(32))
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(Width(340))
            make.height.equalTo(Height(50))
        }
        

        
    }
    
}

// MARK: - Bind Data
extension QusetionView {
    
    public func bindData(data: QuestionModel) {
       
        self.currentModel = data
        
        self.clearData()
        
        self.titleLabel.text = "第 \(data.currentIndex ?? 1) 题"
        self.infoLabel.text = data.titleStr
        
        if data.choiceArray?.first != nil {
            firstBtn.setTitle(data.choiceArray?.first, for: .normal)
        }
        
        if data.choiceArray?[1] != nil {
            secBtn.setTitle(data.choiceArray?[1], for: .normal)
        }
        
        if data.choiceArray?[2] != nil {
            thirdBtn.setTitle(data.choiceArray?[2], for: .normal)
        }
        
        if data.choiceArray?[3] != nil {
            forthBtn.setTitle(data.choiceArray?[3], for: .normal)
        }
    }
    
}

extension QusetionView {
    @objc func btnClick(btn: UIButton) {
        
        guard currentModel != nil else {
           return
        }
           
        //status
        if self.currentModel!.choiceType == .OnlyChoice {
            self.selectBtn?.isSelected = false
            self.selectBtn?.backgroundColor = UIColor.clear
            btn.isSelected = true
            btn.backgroundColor = ColorSelectBG_Question
            self.selectBtn = btn
        }else {
            btn.isSelected = !btn.isSelected
            btn.backgroundColor = btn.isSelected ? ColorSelectBG_Question : UIColor.clear
        }
        
        //toast show and result deal
        if self.currentModel!.choiceType == .OnlyChoice {
            let currentResult: Bool = (self.currentModel?.resultArray![btn.tag])!
            if !currentResult {
                self.errorImage.isHidden = false
                
                let yValue = (btn.frame.origin.y) - Height(18)
                errorImage.snp.updateConstraints { (make) in
                    make.left.equalTo(self.snp.left).offset(Width(285))
                    make.width.equalTo(Width(114))
                    make.height.equalTo(Height(43))
                    make.top.equalTo(self.snp.top).offset(yValue)
                }
            }else {
                self.errorImage.isHidden = true
         
                if clickCallBackHandler != nil {
                    clickCallBackHandler(currentModel, defaultResults)
                }
                
            }
        }else {
            self.defaultResults[btn.tag] = btn.isSelected
            if clickCallBackHandler != nil {
                clickCallBackHandler(currentModel, defaultResults)
            }
            
        }

    }
}
