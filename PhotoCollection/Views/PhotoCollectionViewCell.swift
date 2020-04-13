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
            updateViews()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubviews() {
        // create/configure subview
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        // add subview to view hierachy
        addSubview(imageView)
        // create constraints
        let imageViewYConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .top,
                                                      multiplier: 1,
                                                      constant: 4)
        let imageViewXConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 4)
        let imageViewWidthConstraint = NSLayoutConstraint(item: imageView,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: self,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: -4)
        let imageViewHeightConstraint = NSLayoutConstraint(item: imageView,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: imageView,
                                                           attribute: .width,
                                                           multiplier: 1.0,
                                                           constant: 0)
        // activate constraints
        NSLayoutConstraint.activate([imageViewYConstraint, imageViewXConstraint, imageViewWidthConstraint, imageViewHeightConstraint])
        
        
        // create/configure the photoTitleLabel
        photoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        photoTitleLabel.textAlignment = .center
        // add subview to view hierachry
        addSubview(photoTitleLabel)
        // create constraints
        let photoTitleLabelYConstraint = NSLayoutConstraint(item: photoTitleLabel,
                                                            attribute: .top,
                                                            relatedBy: .equal,
                                                            toItem: imageView,
                                                            attribute: .bottom,
                                                            multiplier: 1.0,
                                                            constant: 4)
        
        let photoTitleLabelXConstraint = NSLayoutConstraint(item: photoTitleLabel,
                                                            attribute: .leading,
                                                            relatedBy: .equal,
                                                            toItem: self,
                                                            attribute: .leading,
                                                            multiplier: 1.0,
                                                            constant: 2)
        
        let photoTitleLabelWidthConstraint = NSLayoutConstraint(item: photoTitleLabel,
                                                                attribute: .trailing,
                                                                relatedBy: .equal,
                                                                toItem: self,
                                                                attribute: .trailing,
                                                                multiplier: 1.0,
                                                                constant: -2)
        // activate constraints
        NSLayoutConstraint.activate([photoTitleLabelYConstraint, photoTitleLabelXConstraint, photoTitleLabelWidthConstraint])
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        photoTitleLabel.text = photo.title
        
        // TODO: Create an updateViews() function that passes the information from the Photo to the image view and label. (If you need help turning Data into a UIImage look at UIImage's initializers in the documentation. Call this function sometime after the photo variable has been given a value from the cellForItem at method in the PhotosCollectionViewController. There are a couple places you could decide to do this.
        //imageView.image = photo.imageData(UIImage)
        
    }
}
