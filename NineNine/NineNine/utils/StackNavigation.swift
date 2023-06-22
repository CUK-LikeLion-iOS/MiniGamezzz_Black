//
//  StackNavigation.swift
//  NineNine
//
//  Created by Jinyoung Yoo on 2023/06/23.
//

import UIKit

func pushStackNavigation(vc: UIViewController, storyBoardID: String) {
    guard let uvc = vc.storyboard?.instantiateViewController(identifier: "\(storyBoardID)") else {
         return
     }
    
    vc.navigationController?.pushViewController(uvc, animated: true)
}

func popStackNavigation(vc: UIViewController) {
    vc.navigationController?.popViewController(animated: true)
}
