//
//  TOEView.swift
//  TokyoOlympicEmblem
//
//  Created by Shuichi Tsutsumi on 2015/08/06.
//  Copyright (c) 2015年 Shuichi Tsutsumi. All rights reserved.
//

import UIKit

class TOEView: UIView {

    enum EmblemType: Int {
        case Olympic = 0
        case Paralympic
    }
    
    var l: CGFloat!
    var r: CGFloat!
    var type = EmblemType.Olympic
    
    override func awakeFromNib() {
        super.awakeFromNib()

        l = frame.size.width / 3
        r = sqrt(1.5 * 1.5 + 0.5 * 0.5) * l
    }
    
    override func drawRect(rect: CGRect) {

        self.fillBackground()
        
        self.drawYellowArc()
        self.drawBlackRect()
        self.drawRedOval()
        self.drawGreyArc()
    }

    
    // =========================================================================
    // MARK: - Private
    
    private func fillBackground() {
        
        switch type {
        case .Olympic:
            UIColor.whiteColor().setFill()
        case .Paralympic:
            UIColor.blackColor().setFill()
        }
        CGContextFillRect(UIGraphicsGetCurrentContext(), self.bounds)
    }
    
    private func drawYellowArc() {
        let path = UIBezierPath(
            arcCenter: CGPointMake(l * 1.5, l * 1.5),
            radius: r,
            startAngle: CGFloat(-M_PI_2),
            endAngle: CGFloat(-M_PI),
            clockwise: false)
        path.addLineToPoint(CGPointZero)
        
        UIColor(red: 1.0, green: 0.84, blue: 0.0, alpha: 1.0).setFill()
        path.fill()
    }

    private func drawBlackRect() {
        
        let rect = CGRectMake(l, 0, l, l * 3)
        let path = UIBezierPath(rect: rect)
        
        switch type {
        case .Olympic:
            UIColor.blackColor().setFill()
        case .Paralympic:
            UIColor.whiteColor().setFill()
        }
        path.fill()
    }

    private func drawRedOval() {

        let rect = CGRectMake(l * 2, 0, l, l)
        let path = UIBezierPath(ovalInRect: rect)
        
        UIColor.redColor().setFill()
        path.fill()
    }
    
    private func drawGreyArc() {
        
        let path = UIBezierPath(
            arcCenter: CGPointMake(l * 1.5, l * 1.5),
            radius: r,
            startAngle: 0,
            endAngle: CGFloat(M_PI_2),
            clockwise: true)
        path.addLineToPoint(CGPointMake(l * 3, l * 3))
        
        UIColor(white: 0.5, alpha: 1.0).setFill()
        path.fill()
    }
}
