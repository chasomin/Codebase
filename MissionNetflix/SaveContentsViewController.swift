//
//  SaveContentsViewController.swift
//  MissionNetflix
//
//  Created by 차소민 on 12/27/23.
//

import UIKit

class SaveContentsViewController: UIViewController {

    let mainLabel = UILabel()
    let smallLabel = UILabel()
    let mainImageView = UIImageView()
    let setButton = UIButton()
    let lookButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        title = "저장한 콘텐츠 목록"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        configureHierarchy()
        configureView()
        setupConstraints()

    }
    
    func configureHierarchy() {
        view.addSubview(mainLabel)
        view.addSubview(smallLabel)
        view.addSubview(mainImageView)
        view.addSubview(setButton)
        view.addSubview(lookButton)
    }
    
    func configureView() {
        designLabel(mainLabel, text: "'나만의 자동 저장' 기능")
        designLabel(smallLabel, text: "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다.\n디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요.")

        mainImageView.image = .dummy
        mainImageView.contentMode = .scaleAspectFit
        
        setButton.configuration = .rectangleButton(title: "설정하기", image: "", backgroundColor: .systemIndigo, foregroundColor: .white)
        
        lookButton.configuration = .rectangleButton(title: "저장 가능한 콘텐츠 살펴보기", image: "", backgroundColor: .white, foregroundColor: .black)
    }
    
    func setupConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.centerX.equalToSuperview()
        }
        
        smallLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(smallLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(400)
        }
        setButton.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
        }
        lookButton.snp.makeConstraints { make in
            make.top.equalTo(setButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }
    
    

    func designLabel(_ label: UILabel, text: String) {
        label.textAlignment = .center
        label.text = text
        if label == mainLabel {
            label.font = .boldSystemFont(ofSize: 25)
            label.textColor = .white

        } else {
            label.font = .systemFont(ofSize: 15)
            label.textColor = .systemGray2
            label.numberOfLines = 0
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

#Preview {
    SaveContentsViewController()
}
