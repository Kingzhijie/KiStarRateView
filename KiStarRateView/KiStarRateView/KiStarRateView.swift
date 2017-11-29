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
    public var scorePercent:CGFloat = 0 //得分值，范围为0--1，默认为1
    public var hasAnimation:Bool = false  //是否允许动画，默认为false
    public var allowIncompleteStar:Bool = false //评分时是否允许不是整星，默认为NO
    public weak var delegate:KiStarRateViewDelegate?  //代理
    public func setBottomImageName(_ bottomImgName:String,topImgName:String,WJXCount:NSInteger) {
        
    }
    
    //MARK : private
    
    private var foregroundStarView = UIView()
    private var backgroundStarView = UIView()
    private var numberOfStars = 0
    private var bottomImageName = ""
    private var topImageName = ""
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
