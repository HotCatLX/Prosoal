//
//  GameController.swift
//  ProposalDaisakusen
//
//  Created by suckerl on 2020/9/3.
//  Copyright © 2020 suckerl. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation



class GameController: UIViewController {

    fileprivate lazy var bgImage: UIImageView = {
        var bgImage = UIImageView(image: UIImage(named:"splash"))
        return bgImage
    }()
    
    fileprivate lazy var noticeLabel: UILabel = {
        var label = UILabel(text: "在15秒内完成头像点击10次", color: ColorText_red, fontSize: 14)
        label.font = UIFont(name: "Zapfino", size: 14)
        label.textAlignment = .center
        return label
    }()
    
    fileprivate lazy var boyBtn: UIButton = {
        var btn = UIButton(frame: CGRect(x: 0, y: 0, width: Width(39), height: Width(39)))
        btn.setImage(UIImage(named:"boy"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick(btn:)), for:.touchUpInside)
        return btn
    }()
    
    
    fileprivate lazy var timer: Timer = {
        var timer = Timer(timeInterval: 15, target: self, selector: #selector(timerChange), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .common)
        return timer
    }()
    
    
    fileprivate lazy var player: AVPlayer = {
        let url = Bundle.main.url(forResource: "Jay.mp3", withExtension: nil)
        let playerItem = AVPlayerItem(url: url!)
        var player = AVPlayer(playerItem: playerItem)
        return player
    }()
    
    var clickCount: NSInteger = 0
    
    var maxCount: NSInteger = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.changeBtnFrame()
        self.timer.fire()
    }
    
}

extension GameController {
    func changeBtnFrame() {
        let xValue = arc4random() % 400 + 78
        let yValue = arc4random() % 1060 + 78
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.boyBtn.frame = CGRect(x: Width(CGFloat(xValue)), y: Height(CGFloat(yValue)), width: Width(78), height: Height(78))
        }
    }
    
    func gameRestart() {
        self.clickCount = 0
        self.changeBtnFrame()
    }
}

// MARK: - Selector
extension GameController {
    @objc func btnClick(btn: UIButton) {
        clickCount += 1
        self.changeBtnFrame()
    }
    
    @objc func timerChange() {
        if clickCount < maxCount {
            ToastView.shared().show(str: "没有完成任务哦,重新计时啦")
            self.gameRestart()
            
        }else {
            noticeLabel.removeFromSuperview()
            boyBtn.removeFromSuperview()
            bgImage.image = UIImage(named:"last")
            player.play()
        }
    }
    
}

// MARK: - Config UI
extension GameController {
    func configUI() {
        view.addSubview(bgImage)
        view.addSubview(noticeLabel)
        view.addSubview(boyBtn)

        bgImage.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        noticeLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(Width(300))
            make.height.equalTo(Height(46))
            make.bottom.equalTo(self.view.snp.bottom).offset(-Height(150))
        }
           
    }
}
