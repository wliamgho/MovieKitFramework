//
//  ParentViewController.swift
//  MovieDB
//
//  Created by William on 02/02/22.
//

import UIKit
import RxFramework

open class ParentViewController: UIViewController, HasDisposeBag {
    public enum ViewState {
        case loading
        case loaded
        case idle
        case error(Error)

        mutating func isLoading() {
            switch self {
            case .loading:
                print("IS LOADING")
            default:
                self = .loading
            }
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .colorMode(
            light: .white,
            dark: .black
        )

        loadUI()
    }

    private func loadUI() {
        setupUI()
        setupConstraint()
    }
    
    open func setupUI() {}
    open func setupConstraint() {}
}

extension ParentViewController {
    public func render(state: ViewState) {
        switch state {
        case .loading:
            print("view state loading")
        case .loaded:
            print("view state loaded")
        case .error(let error):
            print("view state error")
        case .idle:
            print("view state idle")
        }
    }
}
