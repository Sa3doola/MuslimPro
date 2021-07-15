//
//  Protocols.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/15/21.
//

import Foundation
import UIKit

/**
 Protocols to swipe bettween collectionView with SegmentedButtonView
 Two Delegates : - CollectionDidScroll, DidChangeIndex
 */

protocol CollectionViewDidScrollDelegate: class {
    func collectionViewDidScroll(for x: CGFloat)
}

protocol SegmentedControlDelegate: class {
    func didIndexChanged(at index: Int)
}
