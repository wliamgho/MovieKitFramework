//
//  Bindable.swift
//  MovieDB
//
//  Created by William on 20/12/21.
//

import UIKit

public protocol Bindable: AnyObject {
    associatedtype ViewModel

    var viewModel: ViewModel! { get set }
    func bindViewModel()
}

extension Bindable where Self: UIViewController {
    public func bind(to viewmodel: Self.ViewModel) {
        viewModel = viewmodel
        loadViewIfNeeded()
        bindViewModel()
    }
}
