//
//  OnboardingCollectionViewCell.swift
//  OnboardingFinalProject
//
//  Created by Rajeev on 27/10/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var sliderImageView:UIImageView!
    @IBOutlet weak var slideTitle:UILabel!
    @IBOutlet weak var slideDes:UILabel!
    
    
    func setup(_ slide:OnboardingSlide)
    {
        sliderImageView.image = UIImage(named: slide.image)
        slideTitle.text = slide.title
        slideDes.text = slide.description
    }
}
