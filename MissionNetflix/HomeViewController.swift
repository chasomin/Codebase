//
//  HomeViewController.swift
//  MissionNetflix
//
//  Created by 차소민 on 12/27/23.
//

import UIKit

class HomeViewController: UIViewController {
    let imageArr = ["노량","밀수","범죄도시3","서울의봄","스즈메의문단속","아바타물의길","육사오"]

    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    
    @IBOutlet var netLogoImageView: UIImageView!
    @IBOutlet var top10ImageView: UIImageView!
    
    @IBOutlet var newEpisodeLabel: UILabel!
    @IBOutlet var top10Label: UILabel!
    @IBOutlet var newSeriesLabel: UILabel!
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var bookmarkContentsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designImageView(mainImageView)
        designImageView(firstImageView)
        designImageView(secondImageView)
        designImageView(thirdImageView)
        
        designButton(playButton)
        designButton(bookmarkContentsButton)
       
    }
    
    func configureHierarchy() {
        
    }
    
    func configureView() {
        
    }
    
    func setupConstraints() {
        
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
