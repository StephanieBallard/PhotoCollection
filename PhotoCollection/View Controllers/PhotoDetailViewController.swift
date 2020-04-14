//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private var imageView = UIImageView()
    private var titleTextField = UITextField()
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
        updateViews()
        setUpSubviews()
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
    }
    
    // MARK: - Private Methods
    
    private func setUpSubviews() {
        // Add an UIImageView to the view controller's view. You can leave its image empty in this function.
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        self.view.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        // Add a UIButton to the view controller's view. Set its title to "Add Image"
        // Add a target to it that calls the addImage function that already exists in this view controller.
        
        let addImageButton = UIButton(type: .system)
        addImageButton.setTitle("Add Photo", for: .normal)
        addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(addImageButton)
        
        addImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        addImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        addImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        // Add a UITextField to the view controller's view.
        // Set its placeholder to something like "Give this photo a title:". You can leave its text empty.
        let titleTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        titleTextField.placeholder = "Give this photo a title:"
        titleTextField.text = ""
        titleTextField.borderStyle = .line
        titleTextField.backgroundColor = UIColor.white
        titleTextField.textColor = UIColor.black
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleTextField)
        
        titleTextField.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 8).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        let savePhotoButton = UIBarButtonItem(title: "Save Photo", style: .done, target: .none, action: #selector(savePhoto))
        navigationItem.rightBarButtonItem = savePhotoButton
    }
    
    @objc private func addImage() {
        
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
    
        switch authorizationStatus {
        case .authorized:
            presentImagePickerController()
            
        case .notDetermined:
            
            PHPhotoLibrary.requestAuthorization { (status) in
                
                guard status == .authorized else {
                    NSLog("User did not authorize access to the photo library")
                    return
                }
                self.presentImagePickerController()
            }
        default:
            break
        }
    }
    
    @objc private func savePhoto() {
        
        guard let image = imageView.image,
            let imageData = image.pngData(),
            let title = titleTextField.text else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, with: imageData, and: title)
        } else {
            photoController?.createPhoto(with: imageData, title: title)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // TODO: Create an updateViews() function that passes the information from the Photo to the image view and text field. Call this function sometime after the photo variable has been given a value from the cellForItem at method in the PhotosCollectionViewController. Again, there are a couple places you could decide to do this.
    
    private func updateViews() {
        
        guard let photo = photo else {
            title = "Create Photo"
            return
        }
        
        title = photo.title
        
        imageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
    }
    
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .lightGray
        case "Blue":
            backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
    }
}
