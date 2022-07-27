//
//  Ext+UITableView.swift
//  MovieDB
//
//  Created by William on 20/12/21.
//

import UIKit
import RxFramework
import RxSwift
import RxCocoa

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
extension UICollectionViewCell: ReusableView { }

extension UITableView {
    public func registerCells(_ cellClasses: UITableViewCell.Type...) {
        for type in cellClasses {
            register(type, forCellReuseIdentifier: type.reuseIdentifier)
        }
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}

extension UICollectionView {
    public func registerCells(_ cellClasses: UICollectionViewCell.Type...) {
        for type in cellClasses {
            register(type, forCellWithReuseIdentifier: type.reuseIdentifier)
        }
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}

extension Reactive where Base: UITableView {
    
    public func items<Sequence: Swift.Sequence, Cell: UITableViewCell, Source: ObservableType>
        (cellType: Cell.Type = Cell.self)
        -> (_ source: Source)
        -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
        -> Disposable where Source.Element == Sequence {
        return { source in
            return { configureCell in
                return self.items(
                    cellIdentifier: cellType.reuseIdentifier,
                    cellType: cellType
                )(source)(configureCell)
            }
        }
    }

}

extension Reactive where Base: UICollectionView {
    
    public func items<Sequence: Swift.Sequence, Cell: UICollectionViewCell, Source: ObservableType>
        (cellType: Cell.Type = Cell.self)
        -> (_ source: Source)
        -> (_ configureCell: @escaping (Int, Sequence.Element, Cell) -> Void)
        -> Disposable where Source.Element == Sequence {
        return { source in
            return { configureCell in
                return self.items(cellIdentifier: cellType.reuseIdentifier, cellType: cellType)(source)(configureCell)
            }
        }
    }

}

// Remove Header
extension UITableView {
    public static var removeTableHeaderView: UIView {
        UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
    }
}
