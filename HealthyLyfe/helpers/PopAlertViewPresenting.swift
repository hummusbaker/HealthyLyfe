//
//  PopAlertViewPresenting.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/3/20.
//

import UIKit

protocol PopAlertViewPresenting {
    func errorPopViewAlert(with message: String, dismissAction: @escaping () -> Void)
}

extension PopAlertViewPresenting where Self: UIViewController {

    func errorPopViewAlert(with message: String, dismissAction: @escaping () -> Void) {
        let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            dismissAction()
        }
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true)
    }
}
