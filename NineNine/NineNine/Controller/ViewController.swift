//
//  ViewController.swift
//  NineNine
//
//  Created by Jinyoung Yoo on 2023/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var gameListHeadView
    : UIView!
    @IBOutlet weak var gameContentsTableView: UITableView!
    
    let gameData = GameData()

    override func viewDidLoad() {
        super.viewDidLoad()

        gameContentsTableView.delegate = self
        gameContentsTableView.dataSource = self
        
        self.setViewsRoundShape(cornerRadius: 20)
        gameContentsTableView.backgroundColor = UIColor(hex: "#F4F4F4")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = gameContentsTableView.indexPathForSelectedRow {
            gameContentsTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    /* ----- UITableViewDataSource 프로토콜 필수 구현 메소드 ------ */

    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    // 각 셀의 이미지와 타이틀 레이블 설정하는 부분
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = gameContentsTableView.dequeueReusableCell(withIdentifier: "gameContentCell", for: indexPath) as! GameContentsTableViewCell
        let gameTitleArray: [String] = gameData.gameTitleArray()
        let gameImageArray: [UIImage] = gameData.gameImageArray()
        
        cell.gameTitleLabel.text = gameTitleArray[indexPath.section]
        cell.gameImageView.image = gameImageArray[indexPath.section]
        
        return cell
    }
    
    
    /* ------------------------------------------------------ */
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gameData.gameTitleArray().count
    }
    
    // 각각의 테이블 뷰 셀에 따라 다른 화면으로 이동하는 부분
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: // 탭탭 테이블 뷰 셀
            pushStackNavigation(vc: self, storyBoardID: "TabTabVC")
            break
        case 1: // 쉐킷쉐킷 테이블 뷰 셀
            pushStackNavigation(vc: self, storyBoardID: "TabTabVC")
            break
        case 2: // 부비부비 테이블 뷰 셀
            pushStackNavigation(vc: self, storyBoardID: "BBStartingVC")
            break
        default:
            return
        }
    }

    func setViewsRoundShape(cornerRadius: CGFloat) {
        gameListHeadView
            .layer.cornerRadius = cornerRadius
        gameListHeadView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        gameContentsTableView
            .layer.cornerRadius = cornerRadius
        gameContentsTableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}

