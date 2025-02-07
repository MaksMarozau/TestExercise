//
//  ContentCollectionViewCell.swift
//  TestExercise
//
//  Created by Maks on 7.02.25.
//

import UIKit


//MARK: - Final class ContentCollectionViewCell
final class ContentCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties of class
    private let imageView = UIImageView()
    private let priceLabel = UILabel()
    private let petNameLabel = UILabel()
    private let companyNameLabel = UILabel()
    private let locationLabel = UILabel()
    private let favoriteButton = UIButton()
    
    
    //MARK: - Initializators
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubviews()
        setConstraintes()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Add subviews
    private func addSubviews() {
        contentView.addSubviews(imageView, priceLabel, petNameLabel, companyNameLabel, locationLabel, favoriteButton)
    }
    
    
    //MARK: - Setting of constraintes
    private func setConstraintes() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        petNameLabel.translatesAutoresizingMaskIntoConstraints = false
        petNameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5).isActive = true
        petNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        petNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyNameLabel.topAnchor.constraint(equalTo: petNameLabel.bottomAnchor, constant: 5).isActive = true
        companyNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        companyNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 5).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        favoriteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    
    //MARK: - Configuration of UI
    private func configureUI() {
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        priceLabel.font = .systemFont(ofSize: 21, weight: .bold)
        priceLabel.textColor = .blue
        priceLabel.textAlignment = .left
        priceLabel.numberOfLines = 0
        
        petNameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        petNameLabel.textColor = .darkGray
        petNameLabel.textAlignment = .left
        petNameLabel.numberOfLines = 2
        
        companyNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        companyNameLabel.textColor = .black
        companyNameLabel.textAlignment = .left
        companyNameLabel.numberOfLines = 2
        
        locationLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        locationLabel.textColor = .lightGray
        locationLabel.textAlignment = .left
        locationLabel.numberOfLines = 0
        
        favoriteButton.backgroundColor = .systemBlue
        favoriteButton.setTitle("Favorite", for: .normal)
        favoriteButton.setTitleColor(.white, for: .normal)
        favoriteButton.layer.cornerRadius = 8
        favoriteButton.clipsToBounds = true
        favoriteButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        favoriteButton.addTarget(self, action: #selector(favoriteTap), for: .touchUpInside)
    }
    
    
    //MARK: - Buttons API
    @objc private func favoriteTap() {
        print("Added to the Favorites list")
    }
    
    
    //MARK: - Public method add content
    public func addContent(image: UIImage, price: Int, petName: String, companyName: String, loation: String) {
        imageView.image = image
        priceLabel.text = "\(price) BYN"
        petNameLabel.text = petName
        companyNameLabel.text = companyName
        locationLabel.text = loation
    }
}
