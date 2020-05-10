//
//  Loading.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit

protocol Loadable:class {
    var loading:Loading { get }
    func showLoader()
    func hideLoader()
}

class Loading: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var panel: UIView!
    @IBOutlet weak var spinnerContainer: UIView!
    @IBOutlet weak var loadingTitle: MMTitleLabel!
    private let loader = MMSpinnerView()
    private let nibName = "Loading"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        styleView()
        stylePanel()
        styleTitle()
    }
    
    private func styleView() {
        self.contentView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    private func styleTitle() {
        self.loadingTitle.text = "loading.title.loading".localized()
        self.loadingTitle.textColor = StyleKit.Colours.white()
    }
    
    private func stylePanel() {
        self.panel.layer.cornerRadius = StyleKit.Dimensions.cornerRadius()
        self.panel.backgroundColor = StyleKit.Colours.secondaryColour()
    }

}
