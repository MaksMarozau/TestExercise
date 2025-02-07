//
//  DetailsInfoViewController.swift
//  TestExercise
//
//  Created by Maks on 7.02.25.
//

import UIKit


final class DetailsInfoViewController: UIViewController {
    
    private let imageView = UIImageView()
    var image: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        
        setConstraintes()
        setupUI()
    }
    
    
    private func setConstraintes() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    }
    
    
    private func setupUI() {
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.clipsToBounds = true
    }
}
