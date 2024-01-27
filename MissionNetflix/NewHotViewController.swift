//
//  NewHotViewController.swift
//  MissionNetflix
//
//  Created by 차소민 on 12/27/23.
//

import UIKit

class NewHotViewController: UIViewController {
    
    let mainLabel = UILabel()
    let subLabel = UILabel()
    
    let toBeReleasedButton = UIButton()
    let hotContentsButton = UIButton()
    let top10Button = UIButton()
    let searchBar = UISearchBar()
    
    let buttonImage = ["blue", "turquoise", "pink"]
    let buttonTitle  = ["공개 예정", "모두의 인기 콘텐츠", "TOP 10 시리즈"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        title = "NEW & HOT 검색"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        configureHierarchy()
        configureView()
        setupConstraints()
    }
    
//    @IBAction func toBeReleasedButtonTapped(_ sender: UIButton) {
//        designMainLabel(text: "이런! 공개 예정 작품이 없습니다.")
//        
//        designButton(toBeReleasedButton, active: true)
//        designButton(hotContentsButton, active: false)
//        designButton(top10Button, active: false)
//    }
//    
//    @IBAction func hotContentsButtonTapped(_ sender: UIButton) {
//        designMainLabel(text: "이런! 인기 콘텐츠가 없습니다.")
//
//        designButton(toBeReleasedButton, active: false)
//        designButton(hotContentsButton, active: true)
//        designButton(top10Button, active: false)
//    }
//    
//    @IBAction func top10ButtonTapped(_ sender: UIButton) {
//        designMainLabel(text: "이런! TOP 10 시리즈가 없습니다.")
//
//        designButton(toBeReleasedButton, active: false)
//        designButton(hotContentsButton, active: false)
//        designButton(top10Button, active: true)
//    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(toBeReleasedButton)
        view.addSubview(hotContentsButton)
        view.addSubview(top10Button)
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
    }
    
    func configureView() {
        searchBar.placeholder = "게임, 시리즈, 영화를 검색하세요..."
        
        designButton(toBeReleasedButton, active: true, title: "공개 예정", image: "blue")
        toBeReleasedButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        toBeReleasedButton.tag = 0
        
        designButton(hotContentsButton, active: false, title: "모두의 인기 콘텐츠", image: "turquoise")
        hotContentsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        hotContentsButton.tag = 1
        
        designButton(top10Button, active: false, title: "TOP 10 시리즈", image: "pink")
        top10Button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        top10Button.tag = 2
        
        mainLabel.text = "이런! 찾으시는 작품이 없습니다."
        mainLabel.font = .boldSystemFont(ofSize: 25)
        mainLabel.textAlignment = .center
        mainLabel.textColor  = .white
        
        subLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        subLabel.font = .systemFont(ofSize: 15)
        subLabel.textAlignment = .center
        subLabel.textColor  = .white

        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        buttonInactive()
        designButton(sender, active: true, title: buttonTitle[sender.tag], image: buttonImage[sender.tag])
    }
    
    func buttonInactive() {
        let buttons = [toBeReleasedButton, hotContentsButton, top10Button]
        
        for i in 0 ..< buttons.count {
            designButton(buttons[i], active: false, title: buttonTitle[i], image: buttonImage[i])
        }

    }
    
    
    
    func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        toBeReleasedButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        hotContentsButton.snp.makeConstraints { make in
            make.leading.equalTo(toBeReleasedButton.snp.trailing)
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.bottom.equalTo(toBeReleasedButton)
            make.height.equalTo(40)

        }
        top10Button.snp.makeConstraints { make in
            make.leading.equalTo(hotContentsButton.snp.trailing)
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(toBeReleasedButton)
            make.height.equalTo(40)

        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(toBeReleasedButton.snp.bottom).offset(150)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(30)
        }
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(24)
        }
    }
    
    
    
    func designButton(_ button: UIButton, active: Bool, title: String, image: String) {
        
        if active {
            button.configuration = .capsuleButton(title: title, image: image, backgroundColor: .white, foregroundColor: .black)
        } else {
            button.configuration = .capsuleButton(title: title, image: image, backgroundColor: .black, foregroundColor: .white)
        }
    }
    
}

#Preview {
    NewHotViewController()
}
