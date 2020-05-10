//
//  ErrorViewController.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

protocol ErrorPresentable {
    func presentError(with message:String)
}

class ErrorViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imageBackDrop: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: MMTitleLabel!
    @IBOutlet weak var messageLabel: MMLabel!
    @IBOutlet weak var dismissButton: MMButton!
    
    var message:String?
    
    private var errorImageName = "error"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        styleContainer()
        styleErrorTitle()
        styleErrorImage()
        styleErrorMessage()
        styleImageBackDrop()
        styleDismissButton()
    }
    
    private func styleDismissButton() {
        self.dismissButton.setTitle("button.title.dismiss".localized(), for: .normal)
    }
    
    private func styleErrorMessage() {
        self.messageLabel.text = message
    }
    
    private func styleErrorTitle() {
        self.titleLabel.text = "errorView.title".localized()

    }
    
    private func styleView() {
        let alphaComponent = StyleKit.Dimensions.backgroundAlphaComponent()
        self.view.backgroundColor = StyleKit.Colours.black().withAlphaComponent(alphaComponent)
    }
    
    private func styleErrorImage() {
        self.image.image = UIImage(named:errorImageName)
        self.image.layer.cornerRadius = self.image.frame.width / 2
        self.image.clipsToBounds = true
    }
    
    private func styleContainer() {
        self.container.backgroundColor = StyleKit.Colours.white().withAlphaComponent(0.2)
        self.container.layer.cornerRadius = StyleKit.Dimensions.cornerRadius()
        self.container.backgroundColor = StyleKit.Colours.secondaryColour()
    }
    
    private func styleImageBackDrop() {
        self.imageBackDrop.layer.cornerRadius = self.imageBackDrop.frame.width / 2
        self.imageBackDrop.clipsToBounds = true
    }
    
    
    @IBAction func dimissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
