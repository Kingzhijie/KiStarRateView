# KiStarRateView

	###项目介绍###	
	五角星评分
	1. KiStarRateView 

	######设置选中和未选中的图片, 和显示的个数
	func setBottomImageName(_ bottomImgName:String,topImgName:String,WJXCount:NSInteger)

	public var hasAnimation:Bool = false  //是否允许动画，默认为false
    public var allowIncompleteStar:Bool = false //评分时是否允许不是整星，默认为NO
    public weak var delegate:KiStarRateViewDelegate?  //代理

    代理方法
    func starRateView(_ starRateView:KiStarRateView,newScorePercent:CGFloat)->Void

    具体使用方法, 请下载demo





