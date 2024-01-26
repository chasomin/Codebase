//
//  SaveContentsViewController.swift
//  MissionNetflix
//
//  Created by 차소민 on 12/27/23.
//

import UIKit

class SaveContentsViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var smallLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var setButton: UIButton!
    @IBOutlet var lookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designLabel(mainLabel, text: "'나만의 자동 저장' 기능")
        designLabel(smallLabel, text: "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요.")
        
        mainImageView.image = .dummy
        mainImageView.contentMode = .scaleAspectFit
        
        designButton(setButton, title: "설정하기")
        designButton(lookButton, title: "저장 가능한 콘텐츠 살펴보기")
    }
    

    func designLabel(_ label: UILabel, text: String) {
        label.textAlignment = .center
        label.text = text
        if label == mainLabel {
            label.font = .boldSystemFont(ofSize: 25)
        }else {
            label.font = .systemFont(ofSize: 15)
            label.textColor = .darkGray
            label.numberOfLines = 3

        }
    }

    func designButton(_ button: UIButton, title: String) {
        button.layer.cornerRadius = 10
        button.setTitle(title, for: .normal)
        if button == setButton {
            button.backgroundColor = .blue
            button.setTitleColor(.white, for: .normal)
        } else {
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        }
        
    }

}
