//
//  HomeViewController.swift
//  MissionNetflix
//
//  Created by 차소민 on 12/27/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let imageArr = ["노량","밀수","범죄도시3","서울의봄","스즈메의문단속","아바타물의길","육사오"]

    let mainImageView = UIImageView()
    
    let contentsLabel = UILabel()
    
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdImageView = UIImageView()
    
    let netLogoImageView = UIImageView()
    let top10ImageView = UIImageView()
    
    let newEpisodeLabel = UILabel()
    let top10Label = UILabel()
    let newSeriesLabel = UILabel()
    
    let playButton = UIButton()
    let bookmarkContentsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        title = "초코칩쿠키 님"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        configureHierarchy()
        configureView()
        setupConstraints()

//        designButton(playButton)
//        designButton(bookmarkContentsButton)
       
    }
    
    func configureHierarchy() {
        view.addSubview(mainImageView)
        view.addSubview(contentsLabel)
        view.addSubview(firstImageView)
        view.addSubview(secondImageView)
        view.addSubview(thirdImageView)
    }
    
    func configureView() {
        designImageView(mainImageView)
        mainImageView.image = UIImage(named: "더퍼스트슬램덩크")
        
        contentsLabel.text = "지금 뜨는 콘텐츠"
        contentsLabel.font = .boldSystemFont(ofSize: 20)
        contentsLabel.textColor = .white
        contentsLabel.textAlignment = .left
        
        designImageView(firstImageView)
        firstImageView.image = UIImage(named: "스즈메의문단속")
        
        designImageView(secondImageView)
        secondImageView.image = UIImage(named: "스즈메의문단속")

        designImageView(thirdImageView)
        thirdImageView.image = UIImage(named: "스즈메의문단속")

    }
    
    func setupConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(mainImageView.snp.width).multipliedBy(1.3)
        }
        contentsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        firstImageView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(contentsLabel.snp.bottom).offset(5)
            make.width.equalTo((UIScreen.main.bounds.width - 50) / 3)
            make.height.equalTo(firstImageView.snp.width).multipliedBy(1.3)
            
        }
        secondImageView.snp.makeConstraints { make in
            make.leading.equalTo(firstImageView.snp.trailing).offset(5)
            make.top.equalTo(contentsLabel.snp.bottom).offset(5)
            make.width.equalTo((UIScreen.main.bounds.width - 50) / 3)
            make.height.equalTo(secondImageView.snp.width).multipliedBy(1.3)
        }
        thirdImageView.snp.makeConstraints { make in
            make.leading.equalTo(secondImageView.snp.trailing).offset(5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(contentsLabel.snp.bottom).offset(5)
            make.width.equalTo((UIScreen.main.bounds.width - 50) / 3)
            make.height.equalTo(thirdImageView.snp.width).multipliedBy(1.3)
        }
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        randomImage(mainImageView)
        randomImage(firstImageView)
        randomImage(secondImageView)
        randomImage(thirdImageView)

        imageHiddenToggle(netLogoImageView)
        imageHiddenToggle(top10ImageView)
       
        labelHiddenToggle(newEpisodeLabel)
        labelHiddenToggle(top10Label)
        labelHiddenToggle(newSeriesLabel)
       
    }
    
    
    
    func designImageView(_ imageView: UIImageView) {
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
    }

    func designButton(_ button: UIButton) {
        button.layer.cornerRadius = 5
    }
    
    func randomImage(_ image: UIImageView) {
        image.image = UIImage(named: imageArr.randomElement()!)
    }
    
    func imageHiddenToggle(_ image: UIImageView) {
        image.isHidden.toggle()
    }
    
    func labelHiddenToggle(_ label: UILabel) {
        label.isHidden.toggle()
    }
}

#Preview {
    HomeViewController()
}
