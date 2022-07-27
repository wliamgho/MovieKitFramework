//
//  AlertViewController.swift
//  MovieDB
//
//  Created by William on 20/12/21.
//

import UIKit

protocol Alert: AnyObject {
    func showAlert(_ title: String?, _ message: String, onAction: (() -> Void)?)
}

class AlertViewController {
    static let shared = AlertViewController()

    private init() {}
    
    /// Show Alert with title and body message
    /// - Parameters:
    ///   - title: Title alert
    ///   - message: Body message
    ///   - onAction: Single Action
    private func show(_ title: String?,
                      _ message: String,
                      onAction: (() -> Void)?
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: title, style: .default) { [weak self] (action) in
            self?.dismissAlert()
            onAction?()
        }
        alert.addAction(actionOK)
        alert.preferredAction = actionOK

        show(alert)
    }

    private func dismissAlert() {
        let rootViewController = UIApplication.shared.windows.last?.rootViewController
        rootViewController?.dismiss(animated: true, completion: nil)
    }

    // MARK: - Private methods
    private func show(_ alert: UIAlertController) {
        let rootViewController = UIApplication.shared.windows.last?.rootViewController
        rootViewController?.present(alert, animated: true, completion: nil)
    }
}

extension AlertViewController: Alert {
    func showAlert(_ title: String?, _ message: String, onAction: (() -> Void)?) {
        show(title, message, onAction: onAction)
    }
}
