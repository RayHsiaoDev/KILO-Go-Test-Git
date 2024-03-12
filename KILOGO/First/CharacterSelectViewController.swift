//
//  CharacterSelectViewController.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/2/23.
//

import UIKit

class CharacterSelectViewController: UIViewController, UICollectionViewDataSource {
    
    let characterPic = [UIImage(named: "bearMain"), UIImage(named: "boyMain"), UIImage(named: "girlMain")]
    let layout = CustomLaytout()
    var characterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureCharacterCollectionView()
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterPic", for: indexPath) as! CharacterCell
//        cell.contentView.backgroundColor = .orange
        for image in characterPic {
            cell.characterImage.image = image
            print("角色是\(image)")
        }
        return cell
    }
    
    
    func configureCharacterCollectionView() {
        layout.itemSize = CGSize(width: 200, height: 400)
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: -30)
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 50
        layout.scrollDirection = .horizontal
        print(layout.currentPage)
        
        characterCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        characterCollectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "characterPic")
    
        characterCollectionView.delegate = self
        characterCollectionView.dataSource = self
        characterCollectionView.backgroundColor = .red
        characterCollectionView.decelerationRate = .fast
        view.addSubview(characterCollectionView)
        
        characterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            characterCollectionView.widthAnchor.constraint(equalToConstant: 700),
            characterCollectionView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
}


extension CharacterSelectViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            let indexPath = IndexPath(item: layout.currentPage, section: 0)
            let cell = characterCollectionView.cellForItem(at: indexPath)
            print("indexPath\(indexPath)")
            guard let cell = cell else { return }
            
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
            
            for otherCell in characterCollectionView.visibleCells {
                if let indexPath = characterCollectionView.indexPath(for: otherCell) {
                    if indexPath.item != layout.currentPage {
                        UIView.animate(withDuration: 0.2) {
                            otherCell.transform = .identity
                        }
                    }
                }
            }
        }
    }
}
