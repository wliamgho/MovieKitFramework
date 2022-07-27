//
//  Ext+StackView.swift
//  MovieDB
//
//  Created by William on 06/02/22.
//

import UIKit

extension UIView {
    /// add Multiple subviews using Variadic
    public func addSubviews(_ view: UIView...) -> Void {
        view.forEach { self.addSubview($0) }
    }
}

extension UIStackView {
    public func addMultipleArrangeSubviews(_ view: UIView...) -> Void {
        view.forEach {
            self.addArrangedSubview($0)
        }
    }
}
