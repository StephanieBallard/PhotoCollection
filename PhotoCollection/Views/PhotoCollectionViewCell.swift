//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private var photoTitleLabel = UILabel()

    var photo: Photo? {
        didSet {
            
        }
    }

    func setUpSubviews() {
        // create/configure subview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        // add subview to view hierachy
        addSubview(imageView)
        // create constraints
        let imageViewYConstraint = NSLayoutConstraint(item: <#T##Any#>,
                                                      attribute: <#T##NSLayoutConstraint.Attribute#>,
                                                      relatedBy: <#T##NSLayoutConstraint.Relation#>,
                                                      toItem: <#T##Any?#>,
                                                      attribute: <#T##NSLayoutConstraint.Attribute#>,
                                                      multiplier: <#T##CGFloat#>,
                                                      constant: <#T##CGFloat#>)
        let imageViewXConstraint = NSLayoutConstraint(item: <#T##Any#>,
                                                      attribute: <#T##NSLayoutConstraint.Attribute#>,
                                                      relatedBy: <#T##NSLayoutConstraint.Relation#>,
                                                      toItem: <#T##Any?#>,
                                                      attribute: <#T##NSLayoutConstraint.Attribute#>,
                                                      multiplier: <#T##CGFloat#>,
                                                      constant: <#T##CGFloat#>)
        let imageViewWidthConstraint = NSLayoutConstraint(item: <#T##Any#>,
                                                          attribute: <#T##NSLayoutConstraint.Attribute#>,
                                                          relatedBy: <#T##NSLayoutConstraint.Relation#>,
                                                          toItem: <#T##Any?#>,
                                                          attribute: <#T##NSLayoutConstraint.Attribute#>,
                                                          multiplier: <#T##CGFloat#>,
                                                          constant: <#T##CGFloat#>)
        let imageViewHeightConstraint = NSLayoutConstraint(item: <#T##Any#>,
                                                           attribute: <#T##NSLayoutConstraint.Attribute#>,
                                                           relatedBy: <#T##NSLayoutConstraint.Relation#>,
                                                           toItem: <#T##Any?#>,
                                                           attribute: <#T##NSLayoutConstraint.Attribute#>,
                                                           multiplier: <#T##CGFloat#>,
                                                           constant: <#T##CGFloat#>)
        // activate constraints
        NSLayoutConstraint.activate([imageViewYConstraint, imageViewXConstraint, imageViewWidthConstraint, imageViewHeightConstraint])
        
        
        // create/configure the photoTitleLabel
        photoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        photoTitleLabel.textAlignment = .center
        // add subview to view hierachry
        addSubview(photoTitleLabel)
        // create constraints
    }
}
