//
//  KiStarRateView.swift
//  KiStarRateView
//
//  Created by mbApple on 2017/11/16.
//  Copyright © 2017年 panda誌. All rights reserved.
//

import UIKit

@objc protocol KiStarRateViewDelegate {
    
    @objc optional func starRateView(_ starRateView:KiStarRateView,newScorePercent:CGFloat)->Void
    
}

class KiStarRateView: UIView {
    //MARK : public
    public var scorePercent:CGFloat = 1{//得分值，范围为0--1，默认为1
        didSet{
            if self.scorePercent < 0 {
                self.scorePercent = 0
            }else if self.scorePercent > 1{
                self.scorePercent = 1
            }
            
            if self.delegate != nil && delegate?.starRateView != nil {
                self.delegate?.starRateView!(self, newScorePercent: scorePercent)
            }
            
            self.setNeedsLayout()
        }
    }
    public var hasAnimation:Bool = false  //是否允许动画，默认为false
    public var allowIncompleteStar:Bool = false //评分时是否允许不是整星，默认为NO
    public weak var delegate:KiStarRateViewDelegate?  //代理
    public func setBottomImageName(_ bottomImgName:String,topImgName:String,WJXCount:NSInteger) {
        self.bottomImageName = bottomImgName
        self.topImageName = topImgName
        self.numberOfStars = WJXCount
        buildDataAndUI()
    }
    
    //MARK : private
    private let Defalut_Star_Number = 5 //默认星星的个数
    private let Animation_Time_Tnterval = 0.2 //动画时间
    private var foregroundStarView = UIView()
    private var backgroundStarView = UIView()
    private var numberOfStars = 0
    private var bottomImageName = ""
    private var topImageName = ""
    
    private func buildDataAndUI() {
        scorePercent = 1 //默认
        hasAnimation = false
        allowIncompleteStar = false
        self.foregroundStarView = self.createStarViewWithImage(imageName: self.topImageName)
        self.backgroundStarView = self.createStarViewWithImage(imageName: self.bottomImageName)
        self.addSubview(self.foregroundStarView)
        self.addSubview(self.backgroundStarView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userTapRateView(gesture:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func userTapRateView(gesture:UITapGestureRecognizer){
        let tapPoint = gesture.location(in: self)
        let offset = tapPoint.x
        let realStarScore = offset / (self.bounds.size.width / CGFloat(self.numberOfStars))
        let starScore = self.allowIncompleteStar ? Float(realStarScore) : ceilf(Float(realStarScore))
        self.scorePercent = CGFloat(starScore / Float(self.numberOfStars))
    }
    
    private func createStarViewWithImage(imageName:String) -> UIView {
        let view = UIView(frame: self.bounds)
        view.clipsToBounds = true
        view.backgroundColor = .clear
        for index in 0..<self.numberOfStars {
            let imageView = UIImageView(image: UIImage.init(named: imageName))
            imageView.frame = CGRect(x: CGFloat(index) * self.bounds.size.width / CGFloat(self.numberOfStars), y: 0, width: self.bounds.size.width / CGFloat(self.numberOfStars), height: self.bounds.size.height)
            imageView.contentMode = .scaleAspectFit
            view.addSubview(imageView)
        }
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let animationTimeInterval = self.hasAnimation ? self.Animation_Time_Tnterval : 0
        UIView.animate(withDuration: animationTimeInterval) {[weak self] in
            self?.foregroundStarView.frame = CGRect(x: 0, y: 0, width: (self?.bounds.size.width ?? 0)! * (self?.scorePercent ?? 0)!, height: (self?.bounds.size.height ?? 0)!)
        }
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
