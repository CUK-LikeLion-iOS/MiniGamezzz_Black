//
//  SetViewRoundShape.swift
//  NineNine
//
//  Created by Jinyoung Yoo on 2023/06/23.
//

import UIKit

func makeCornerRoundShape(targetView: UIView, cornerRadius: CGFloat) {
    targetView
        .layer.cornerRadius = cornerRadius
    targetView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
}

func countDownBeforeGame(countDownView view: UIView) {
    let timer: Timer?
    let label = view.subviews.first as! UILabel
    var sec: Int = 0
    
    guard label.text != nil else { return }
    
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
        if (sec == 3) {
            timer.invalidate()
            view.isHidden = true
        }
        label.text = "\(3 - sec)"
        sec += 1
    })
}
