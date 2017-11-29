//
//  ViewController.swift
//  KiStarRateView
//
//  Created by mbApple on 2017/11/16.
//  Copyright © 2017年 panda誌. All rights reserved.
//

import UIKit

class ViewController: UIViewController,KiStarRateViewDelegate {
    
    lazy var starView: KiStarRateView = {
        let starView = KiStarRateView(frame: CGRect(x: 0, y: 100, width: 375, height: 50))
        starView.setBottomImageName("b27_icon_star_gray", topImgName: "b27_icon_star_yellow", WJXCount: 5)
        starView.allowIncompleteStar = true  //是否允许, 整颗星
        starView.hasAnimation = true  //动画
        starView.scorePercent = 0.3  //默认评分  (0 - 1)
        starView.delegate = self
        return starView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        self.view.addSubview(self.starView)  //添加....五角星...
        
    }
    
     //MARK ---- KiStarRateViewDelegate
    func starRateView(_ starRateView: KiStarRateView, newScorePercent: CGFloat) {
        print("newScorePercent======\(newScorePercent)")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

