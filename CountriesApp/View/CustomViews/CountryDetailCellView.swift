//
//  CountryDetailCellView.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 19/07/21.
//

import UIKit

class CountryDetailCellView: UIStackView {
    
    @IBOutlet var containerSV: UIStackView!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func commonInit() {
        self.setXib()
    }
    
    private func setXib() {
        Bundle.main.loadNibNamed("CountryDetailCellView", owner: self, options: nil)
        addSubview(containerSV)
        containerSV.frame = self.bounds
        containerSV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
}
