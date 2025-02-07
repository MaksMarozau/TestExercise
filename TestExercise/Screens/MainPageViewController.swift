//
//  MainPageViewController.swift
//  TestExercise
//
//  Created by Maks on 7.02.25.
//

import UIKit


//MARK: - Final class MainPageViewController
final class MainPageViewController: UIViewController {

    //MARK: - Properties of class
    private let pageTitle: String = "Recomendations"
    private let bannerImageView = UIImageView()
    private let contentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let pageControl = UIPageControl()
    
    private var banners = [UIImage]()
    private var contentModelsArray: [ContentModel] = []
    private var currentBannerIndex: Int = 0
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        addSubviews()
        setConstraintes()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewRegister()
        setupContentCollectionViewLayout()
    }
    
    
    //MARK: - Add subviews
    private func addSubviews() {
        view.addSubviews(bannerImageView, pageControl, contentCollectionView)
    }
    
    
    //MARK: - Constraintes setup
    private func setConstraintes() {
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        bannerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22).isActive = true
        bannerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bannerImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        bannerImageView.heightAnchor.constraint(equalTo: bannerImageView.widthAnchor, multiplier: 0.4).isActive = true
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 8).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        contentCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentCollectionView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 16).isActive = true
        contentCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentCollectionView.widthAnchor.constraint(equalTo: bannerImageView.widthAnchor, multiplier: 1).isActive = true
        contentCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 22).isActive = true
    }
    
    
    //MARK: - User Interface setup
    private func setupUI() {
        setupNavigationBarAppearance()
        view.backgroundColor = .white
        
        bannerImageView.image = banners[currentBannerIndex]
        bannerImageView.contentMode = .scaleAspectFit
        bannerImageView.layer.cornerRadius = 10
        bannerImageView.layer.borderColor = UIColor.gray.cgColor
        bannerImageView.layer.borderWidth = 1
        bannerImageView.isUserInteractionEnabled = true
        bannerImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bannerTap)))
        
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.hidesForSinglePage = true
    }
    
    private func setupNavigationBarAppearance() {
        navigationItem.title = pageTitle
        
        if let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 28, weight: .bold)]
            appearance.titlePositionAdjustment = UIOffset(horizontal: -65, vertical: 10)
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    
    //MARK: - CollectionView setup
    private func collectionViewRegister() {
        contentCollectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "ContentCollectionViewCell")
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
    }

    
    private func setupContentCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width * 0.38, height: view.frame.width * 0.8 )
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 30
        contentCollectionView.collectionViewLayout = layout
    }
    
    
    //MARK: - Fetch data
    private func fetchData() {
        let contentStorage = ContentStorage()
        contentModelsArray = contentStorage.createContentModels()
        banners = contentStorage.createBanners()
        
        pageControl.numberOfPages = banners.count
        pageControl.currentPage = 0
    }
    
    
    //MARK: - Tap processing
    @objc private func bannerTap() {
        nextBanner()
    }
    
    
    //MARK: Animations
    private func nextBanner() {
        UIView.animate(withDuration: 0.3) {
            self.bannerImageView.alpha = 0
            if self.currentBannerIndex < (self.banners.count - 1) {
                self.currentBannerIndex += 1
            } else {
                self.currentBannerIndex = 0
            }
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0.3) {
                self.bannerImageView.image = self.banners[self.currentBannerIndex]
                self.pageControl.currentPage = self.currentBannerIndex
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.bannerImageView.alpha = 1
                }
            }
        }
    }
}


//MARK: - Extension for MainPageViewController with CollectionView's protocols
extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentModelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let contentModel = contentModelsArray[indexPath.row]
        let image = contentModel.image
        let prise = contentModel.prise
        let petName = contentModel.petName
        let companyName = contentModel.companyName
        let location = contentModel.location
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewCell", for: indexPath) as? ContentCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.addContent(image: image, price: prise, petName: petName, companyName: companyName, loation: location)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contentModel = contentModelsArray[indexPath.row]
        
        let detailViewController = DetailsInfoViewController()
        detailViewController.image = contentModel.image
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
