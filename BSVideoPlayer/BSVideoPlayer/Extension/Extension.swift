//
//  Extension.swift
//  BSVideoPlayer
//
//  Created by bs-mac-4 on 07/12/22.
//

import Foundation
import UIKit

/// :nodoc:
public extension UITableView {
    
    /// Register given `UITableViewCell` in tableView.
    /// Cell will be registered with the name of it's class as identifier.
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
    
    /// Register given `UITableViewCell` in tableView.
    /// Cell will be registered with the name of it's class as identifier.
    func registerNib<T: UITableViewCell>(_: T.Type) {
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: T.self))
    }
    
    /// Dequeue cell of given class from tableView.
    func dequeue<T: UITableViewCell>(_: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T ?? T()
    }
}


/// :nodoc:
public extension UICollectionView {
    
    /// Register given `UICollectionViewCell` in collectionView.
    /// Cell will be registered with the name of it's class as identifier.
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    /// Register `UICollectionViewCell` from given nib in collectionView.
    /// Cell will be registered with the name of it's class as identifier.
    func registerNib<T: UICollectionViewCell>(_: T.Type) {
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        register(nib, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    /// Dequeue cell of given class from collectionView.
    func dequeue<T: UICollectionViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
