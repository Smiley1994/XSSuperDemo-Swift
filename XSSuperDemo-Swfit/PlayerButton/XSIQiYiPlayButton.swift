//
//  XSIQiYiPlayButton.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/10.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

enum IQiYiPlayStatus : Int {
    case IQiYiPlayStatusPause = 0
    case IQiYiPlayStatusPlay
}

//其它动画时长
let AnimationDuration : CGFloat = 0.5
//位移动画时长
let PositionDuration : CGFloat = 0.3

let LineColor = UIColor.red

let TriangleAnimation = "TriangleAnimation"
let RightLineAnimation = "RightLineAnimation"


class XSIQiYiPlayButton: UIButton,CAAnimationDelegate {

    var buttonStatus : IQiYiPlayStatus! {
        didSet {
            
        }
    }
    var isAnimation : Bool!
    
    var leftLineLayer : CAShapeLayer!
    var triangleLayer : CAShapeLayer!
    var rightLineLayer : CAShapeLayer!
    var circleLayer : CAShapeLayer!
    
    
    init(frame : CGRect, status : IQiYiPlayStatus) {
        super.init(frame: frame)
        createUI()
        if status == IQiYiPlayStatus.IQiYiPlayStatusPlay {
            self.buttonStatus = status
        }
    }
    
    
    
    func createUI() {
        buttonStatus = IQiYiPlayStatus.IQiYiPlayStatusPause
        addTriangleLayer()
        addLeftLineLayer()
        addRightLineLayer()
    }
    
    func addTriangleLayer() {
        let a = self.bounds.size.width
        let path = UIBezierPath()
        path.move(to: CGPoint(x: a * 0.2, y: a * 0.2))
        path.addLine(to: CGPoint(x: a * 0.2, y: 0))
        path.addLine(to: CGPoint(x: a, y: a * 0.5))
        path.addLine(to: CGPoint(x: a * 0.2, y: a))
        path.addLine(to: CGPoint(x: a * 0.2, y: a * 0.2))
        
        triangleLayer = CAShapeLayer()
        triangleLayer.path = path.cgPath
        triangleLayer.fillColor = UIColor.clear.cgColor
        triangleLayer.strokeColor = LineColor.cgColor
        triangleLayer.lineWidth = LineWidth()
        triangleLayer.lineCap = kCALineCapButt
        triangleLayer.lineJoin = kCALineJoinRound
        triangleLayer.strokeEnd = 0
        self.layer .addSublayer(triangleLayer)
        
    }
    
    func addLeftLineLayer () {
        let a = self.bounds.size.width
        let path = UIBezierPath()
        path.move(to: CGPoint(x: a * 0.2, y: 0))
        path.addLine(to: CGPoint(x: a * 0.2, y: a))
        
        leftLineLayer = CAShapeLayer()
        leftLineLayer.path = path.cgPath
        leftLineLayer.fillColor = UIColor.clear.cgColor
        leftLineLayer.strokeColor = LineColor.cgColor
        leftLineLayer.lineWidth = LineWidth()
        leftLineLayer.lineCap = kCALineCapRound
        leftLineLayer.lineJoin = kCALineJoinRound
        self.layer.addSublayer(leftLineLayer)
        
    }
    
    func addRightLineLayer() {
        let a = self.bounds.size.width
        let path = UIBezierPath()
        path.move(to: CGPoint(x: a * 0.8, y: 0))
        path.addLine(to: CGPoint(x: a * 0.8, y: a))
        
        rightLineLayer = CAShapeLayer()
        rightLineLayer.path = path.cgPath
        rightLineLayer.fillColor = UIColor.clear.cgColor
        rightLineLayer.strokeColor = LineColor.cgColor
        rightLineLayer.lineWidth = LineWidth()
        rightLineLayer.lineCap = kCALineCapRound
        rightLineLayer.lineJoin = kCALineJoinRound
        self.layer.addSublayer(rightLineLayer)
    }
    
    
    //MARK: 执行动画 暂停->播放
    func actionPositionAnimation() {
        
    }
    
    func LineWidth() -> CGFloat {
        return self.bounds.width * 0.2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
