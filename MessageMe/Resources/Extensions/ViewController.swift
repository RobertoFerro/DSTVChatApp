//
//  ViewController.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController: Loadable {
    
    var loading: Loading {
        return Loading(frame: UIScreen.main.bounds)
    }
    
    func showLoader() {
        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            window.addSubview(loading)
        }
    }
    
    func hideLoader() {
        
        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            if let loader = window.subviews.compactMap({$0 as? Loading}).first {
                loader.removeFromSuperview()
            }
        }
        
    }
   
}

extension UIViewController: ErrorPresentable {
    
    func presentError(with message: String) {
        
        guard let storyboard = self.storyboard else { return }
               
               guard let errorViewController = storyboard.instantiateViewController(withIdentifier: "ErrorViewController") as? ErrorViewController else {
                   return
               }

               errorViewController.message = message
               errorViewController.modalPresentationStyle = .overCurrentContext
               errorViewController.modalTransitionStyle = .crossDissolve
               self.present(errorViewController, animated: true, completion: nil)

    }

}
