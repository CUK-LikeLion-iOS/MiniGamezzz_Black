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
