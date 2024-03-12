//
//  HomeFeedCellType.swift
//  HomeFeedCellType
//
//  Created by 陳韋綸 on 2021/11/10.
//

import Foundation

enum IGHomeFeedCellType {
    case poster(viewModel: PosterCollecitonViewCellViewModel)
    case post(viewModel: PostCollectionViewCellViewModel)
    case postButton(viewModel: PostButtonCollectionViewModel)
    case postLikeNumber(viewModel: PostLikeNumberCollectionViewModel)
}

