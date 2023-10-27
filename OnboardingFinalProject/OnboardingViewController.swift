//
//  OnboardingViewController.swift
//  OnboardingFinalProject
//
//  Created by Rajeev on 27/10/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var onBoardinCollection:UICollectionView!
    @IBOutlet weak var nextBtnn:UIButton!
    @IBOutlet weak var page:UIPageControl!
    
    @IBOutlet weak var skipBtn:UIButton!
    
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            page.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtnn.setTitle("Get Started", for: .normal)
            } else {
                nextBtnn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image:"on1"),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image:"on22"),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: "on3"),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: "on4"),
            
            
        ]
        
        page.numberOfPages = slides.count
    }
    
    @IBAction func skipBtn(_ sender :UIButton)
    {
        
        let controller = storyboard?.instantiateViewController(identifier: "mainVc") as! ViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
       // UserDefaults.standard.hasOnboarded = true
        present(controller, animated: true, completion: nil)
        
        
    }
    @IBAction func nextBtn(_ sender:UIButton)
    {
        
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "mainVc") as! ViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
           // UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onBoardinCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
        
    }


extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Onb.identifier, for: indexPath) as! OnboardingCollectionViewCelll
        let cell = onBoardinCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}



struct OnboardingSlide {
    let title: String
    let description: String
    let image: String
}
