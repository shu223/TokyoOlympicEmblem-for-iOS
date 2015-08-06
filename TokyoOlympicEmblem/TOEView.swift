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
    let black = UIColor(white: 0.21, alpha: 1)
    var type = EmblemType.Olympic
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        l = frame.size.width / 3
        r = sqrt(1.5 * 1.5 + 0.5 * 0.5) * l
    }
    
    override func drawRect(rect: CGRect) {

        self.fillBackground()
        
        self.drawGoldArc()
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
            black.setFill()
        }
        CGContextFillRect(UIGraphicsGetCurrentContext(), self.bounds)
    }
    
    private func drawGoldArc() {
        let path = UIBezierPath(
            arcCenter: CGPointMake(l * 1.5, l * 1.5),
            radius: r,
            startAngle: CGFloat(-M_PI_2),
            endAngle: CGFloat(-M_PI),
            clockwise: false)
        path.addLineToPoint(CGPointZero)
        
        UIColor(red: 0.7, green: 0.57, blue: 0.27, alpha: 1).setFill()
        path.fill()
    }

    private func drawBlackRect() {
        
        let rect = CGRectMake(l, 0, l, l * 3)
        let path = UIBezierPath(rect: rect)
        
        switch type {
        case .Olympic:
            black.setFill()
        case .Paralympic:
            UIColor.whiteColor().setFill()
        }
        path.fill()
    }

    private func drawRedOval() {

        let rect = CGRectMake(l * 2, 0, l, l)
        let path = UIBezierPath(ovalInRect: rect)
        
        UIColor(red: 0.9, green: 0, blue: 0.08, alpha: 1).setFill()
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
        
        UIColor(white: 0.7, alpha: 1.0).setFill()
        path.fill()
    }
}
