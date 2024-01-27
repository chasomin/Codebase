//
//  NewHotViewController.swift
//  MissionNetflix
//
//  Created by 차소민 on 12/27/23.
//

import UIKit

class NewHotViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var toBeReleasedButton: UIButton!
    @IBOutlet var hotContentsButton: UIButton!
    @IBOutlet var top10Button: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        title = "NEW & HOT 검색"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

    }
    
    @IBAction func toBeReleasedButtonTapped(_ sender: UIButton) {
        designMainLabel(text: "이런! 공개 예정 작품이 없습니다.")
        
        designButton(toBeReleasedButton, active: true)
        designButton(hotContentsButton, active: false)
        designButton(top10Button, active: false)
    }
    
    @IBAction func hotContentsButtonTapped(_ sender: UIButton) {
        designMainLabel(text: "이런! 인기 콘텐츠가 없습니다.")

        designButton(toBeReleasedButton, active: false)
        designButton(hotContentsButton, active: true)
        designButton(top10Button, active: false)
    }
    
    @IBAction func top10ButtonTapped(_ sender: UIButton) {
        designMainLabel(text: "이런! TOP 10 시리즈가 없습니다.")

        designButton(toBeReleasedButton, active: false)
        designButton(hotContentsButton, active: false)
        designButton(top10Button, active: true)
    }
    
    func designButton(_ button: UIButton, active: Bool) {
        
        if active {
            button.tintColor = .black
            button.backgroundColor = .white
        } else {
            button.tintColor = .white
            button.backgroundColor = .black
        }
        button.layer.cornerRadius = 10
    }
    
    func designMainLabel(text: String) {
        mainLabel.text = text
        mainLabel.numberOfLines = 0
    }
}
