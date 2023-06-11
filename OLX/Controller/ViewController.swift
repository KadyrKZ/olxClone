//
//  ViewController.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 11.06.2023.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate {

    let searchController = UISearchController(searchResultsController: nil)
    var imageView = UIImageView()
    let source: [Photo] = Source.rundomPhoto(with: 8)
    var myCollectionView: UICollectionView!
    var label = UILabel()
    var header = UILabel()
    var categoryButton = UIButton()
    var line = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createBack()
        self.setupSearchController()
        self.createLogo()
        self.setupCollecTionView()
        self.headerCategory()
        self.createLine()
        
        
            }
        
        //MARK: - Create searchController
        
        private func setupSearchController(){
            self.searchController.searchResultsUpdater = self
            self.searchController.obscuresBackgroundDuringPresentation = false
            self.searchController.hidesNavigationBarDuringPresentation = false
            self.searchController.searchBar.searchTextField.backgroundColor =  UIColor(red: 10, green: 13, blue: 13)
          
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.searchController.searchBar.tintColor = .white
            self.searchController.searchBar.searchTextField.leftView?.tintColor = UIColor(red: 160, green: 160, blue: 150)
            let placeholder = [NSAttributedString.Key.foregroundColor: UIColor(red: 160, green: 160, blue: 150)]
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Что ищете?", attributes: placeholder)
            
            self.navigationItem.searchController = searchController
            
            self.definesPresentationContext = false
            
        }
        
        fileprivate func createLogo() {
            var tabBarItem = UITabBarItem()
            
            // Set the unselected image
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
            let houseIcon = UIImage(systemName: "house", withConfiguration: symbolConfiguration)
            let houseIcon1 = UIImage(systemName: "house.fill", withConfiguration: symbolConfiguration)

            tabBarItem = UITabBarItem(title: "Профиль", image: houseIcon, selectedImage: houseIcon1)
            self.tabBarItem = tabBarItem
            self.tabBarController?.delegate = self
            self.view.backgroundColor = UIColor(red: 31, green: 35 , blue: 41)
            self.tabBarController?.tabBar.tintColor = UIColor.white
            self.tabBarController?.tabBar.unselectedItemTintColor = .white
            tabBarController?.tabBar.backgroundColor = .black

        }

    func setupCollecTionView() {
        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        view.addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        myCollectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        myCollectionView.backgroundColor = UIColor(red: 20, green: 23, blue: 23)
        myCollectionView.dataSource = self
        myCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "\(PhotoCell.self)")
        
        let flow = myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0)
        
        
    }
    
    func createLine(){
        let line = UIView()
        view.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.widthAnchor.constraint(equalToConstant: view.bounds.width - 35).isActive = true
        line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        line.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 70).isActive = true
        line.backgroundColor = .gray
    }
    func createBack(){
        let back = UIView()
        view.addSubview(back)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.heightAnchor.constraint(equalToConstant: 70).isActive = true
        back.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        back.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        back.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        back.backgroundColor = UIColor(red: 20, green: 23, blue: 23)
    }
    
    func headerCategory(){
        
        let header = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
        header.text = "Категории"
        header.textColor = UIColor.white
        header.font = header.font.withSize(20)
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        header.heightAnchor.constraint(equalToConstant: 50).isActive = true
        header.widthAnchor.constraint(equalToConstant: 200).isActive = true
        let categoryButton = UIButton(frame: CGRect(x: 0, y: 0, width:view.bounds.width/2, height: 50))
        categoryButton.setTitleColor(UIColor(red: 160, green: 160 , blue: 150), for: .normal)
        categoryButton.setTitle("Смотреть все", for: .normal)
        categoryButton.titleLabel?.font = .systemFont(ofSize: 14)
        categoryButton.addTarget(self, action: #selector(click), for: .touchUpInside)
     
        self.view.addSubview(categoryButton)
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        categoryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        categoryButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 5).isActive = true
        categoryButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        categoryButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
      
    }
    
    @objc func click(){
        print("Click")
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 90, height: 90)
        layout.scrollDirection = .horizontal
        return layout
    }
    
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCell.self)", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        let text = UILabel(frame: CGRect(x: 0, y: 80, width: cell.bounds.size.width, height: 60))
        text.textAlignment = .center
        cell.imageView.image = UIImage(named: source[indexPath.item].imageName)
        cell.frame.size.height = 140
        text.text = source[indexPath.row].imageName
        text.textColor = UIColor.white
        text.font = .systemFont(ofSize: 14)
        cell.addSubview(text)
        return cell
    }
    
    
}

 
    

//MARK: - UICollectionViewDataSource

    
    
//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate{
    
}

//MARK: - UICollectionViewDelegateFlowLayout


extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText: String = searchController.searchBar.text ?? "nil"
        print("Debug print:", searchText )
    }
    
}

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    let newRed = CGFloat(red)/255
    let newGreen = CGFloat(green)/255
    let newBlue = CGFloat(blue)/255

    self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)


    }
}

