//
//  IGViewController.swift
//  IGViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit
import Firebase

class IGViewController: UIViewController {

    private var collectionView: UICollectionView?
    
    private var viewModels = [[IGHomeFeedCellType]]()
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        for _ in 0..<5 {
            posts.append(Post(id: "", caption: "", postedDate: "", postUrlString: "", likers: []))
        }
        posts.compactMap({
            let postData: [IGHomeFeedCellType] = [
                .poster(viewModel: PosterCollecitonViewCellViewModel(userPhotoUrl: $0.id, username: $0.id)),
                .post(viewModel: PostCollectionViewCellViewModel(postPhotoUrl: $0.id)),
                .postButton(viewModel: PostButtonCollectionViewModel(isLiked: true)),
                .postLikeNumber(viewModel: PostLikeNumberCollectionViewModel(likers: []))
            ]
            self.viewModels.append(postData)
            
        })

        configureCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
}

extension IGViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = viewModels[indexPath.section][indexPath.row]
        
        switch cellType {
        case .poster(viewModel: let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case .post(viewModel: let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case .postButton(viewModel: let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostButtonCollectionViewCell.identifier, for: indexPath) as? PostButtonCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        case .postLikeNumber(viewModel: let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostLikeNumberCollectionViewCell.identifier, for: indexPath) as? PostLikeNumberCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
}

extension IGViewController {
    func configureCollectionView() {
        
        let sectionheight: CGFloat = 140 + view.frame.width
        
        let collenctionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { index, _ -> NSCollectionLayoutSection? in
                
                // Item
                // Cell for poster
                let posterItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(60)
                    )
                )
                
                // Bigger cell for the post
                let postItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalWidth(1)
                    )
                )
                
                // Actions cell
                let actionsItems = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(40)
                    )
                )
                
                // Like count cell
                let likeCountItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(40)
                    )
                )

                // Group
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(sectionheight)
                    ),
                    subitems: [
                        posterItem,
                        postItem,
                        actionsItems,
                        likeCountItem
                    ]
                )

                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 0, bottom: 10, trailing: 0)
                return section
            })
        )
        
        view.addSubview(collenctionView)
        collenctionView.backgroundColor = .systemBackground
        collenctionView.dataSource = self
        collenctionView.delegate = self
        
        collenctionView.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        collenctionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        collenctionView.register(PostButtonCollectionViewCell.self, forCellWithReuseIdentifier: PostButtonCollectionViewCell.identifier)
        collenctionView.register(PostLikeNumberCollectionViewCell.self, forCellWithReuseIdentifier: PostLikeNumberCollectionViewCell.identifier)
        self.collectionView = collenctionView
    }
    
}
