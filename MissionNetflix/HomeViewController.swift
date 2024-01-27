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
    let genreLabel = UILabel()
    
    let contentsLabel = UILabel()
    
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdImageView = UIImageView()
    
    let netLogoImageView = UIImageView()
    let top10ImageView = UIImageView()
    
    let newEpisodeLabel = UILabel()
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
        

    }
    
    func configureHierarchy() {
        view.addSubview(mainImageView)
        view.addSubview(contentsLabel)
        view.addSubview(firstImageView)
        view.addSubview(secondImageView)
        view.addSubview(thirdImageView)
        mainImageView.addSubview(genreLabel)
        mainImageView.addSubview(playButton)
        mainImageView.addSubview(bookmarkContentsButton)
        
        firstImageView.addSubview(newEpisodeLabel)
        firstImageView.addSubview(newSeriesLabel)
        secondImageView.addSubview(top10ImageView)
        
        thirdImageView.addSubview(netLogoImageView)

    }
    
    func configureView() {
        designImageView(mainImageView)
        mainImageView.image = UIImage(named: imageArr.randomElement()!)
//        mainImageView.alpha = 0.8
        
        contentsLabel.text = "지금 뜨는 콘텐츠"
        contentsLabel.font = .boldSystemFont(ofSize: 20)
        contentsLabel.textColor = .white
        contentsLabel.textAlignment = .left
        
        designImageView(firstImageView)
        firstImageView.image = UIImage(named: imageArr.randomElement()!)
        
        designImageView(secondImageView)
        secondImageView.image = UIImage(named: imageArr.randomElement()!)

        designImageView(thirdImageView)
        thirdImageView.image = UIImage(named: imageArr.randomElement()!)
        
        genreLabel.text = "응원하고픈 ∙ 흥미진진 ∙ 사극 ∙ 전투 ∙ 한국 작품"
        genreLabel.font = .systemFont(ofSize: 12)
        genreLabel.textColor = .white
        genreLabel.textAlignment = .center
        
        playButton.configuration = .rectangleWhiteButton(title: "재생", image: "play.fill", backgroundColor: .white, foregroundColor: .black)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)    //왜안돼

        bookmarkContentsButton.configuration = .rectangleWhiteButton(title: "내가 찜한 리스트", image: "plus", backgroundColor: .darkGray, foregroundColor: .white)
        
        
        newEpisodeLabel.text = "새로운 에피소드"
        newEpisodeLabel.textAlignment = .center
        newEpisodeLabel.textColor = .white
        newEpisodeLabel.backgroundColor = .systemRed
        newEpisodeLabel.font = .systemFont(ofSize: 13)
        
        newSeriesLabel.text = "새로운 시리즈"
        newSeriesLabel.textAlignment = .center
        newSeriesLabel.textColor = .black
        newSeriesLabel.backgroundColor = .white
        newSeriesLabel.font = .systemFont(ofSize: 13)

        top10ImageView.image = .top10Badge
        netLogoImageView.image = .singleBadge

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
        
        genreLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.bottom.equalTo(playButton.snp.top).offset(-10)

        }
        
        playButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(40)
    
        }
        
        bookmarkContentsButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(40)

        }
        
        newEpisodeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        newSeriesLabel.snp.makeConstraints { make in
            make.bottom.equalTo(newEpisodeLabel.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalTo(newEpisodeLabel)
        }
        
        top10ImageView.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
        }
        
        netLogoImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(5)
        }
    }
    
    @objc func playButtonTapped() {
        print("==r")
        randomImage(mainImageView)
        randomImage(firstImageView)
        randomImage(secondImageView)
        randomImage(thirdImageView)

        imageHiddenToggle(netLogoImageView)
        imageHiddenToggle(top10ImageView)
       
        labelHiddenToggle(newEpisodeLabel)
        labelHiddenToggle(newSeriesLabel)
       
    }
    
}

extension HomeViewController {
    
    func designImageView(_ imageView: UIImageView) {
        imageView.layer.cornerRadius = 10
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

extension UIButton.Configuration {
    
    static func rectangleWhiteButton(title: String, image: String, backgroundColor: UIColor, foregroundColor: UIColor) -> UIButton.Configuration {

        var config = UIButton.Configuration.filled()
        config.title = title
        config.titleAlignment = .center
        
        config.image = UIImage(systemName: image)
        config.imagePlacement = .leading
        config.imagePadding = 10
        
        config.cornerStyle = .medium
        
        config.baseBackgroundColor = backgroundColor
        config.baseForegroundColor = foregroundColor
        
        return config
    }
    
}
