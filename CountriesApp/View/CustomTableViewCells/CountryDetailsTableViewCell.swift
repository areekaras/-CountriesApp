//
//  CountryDetailsTableViewCell.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 19/07/21.
//

import UIKit

class CountryDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var detailStackView: CountryDetailCellView!
    
    var viewModel: CountryDetailCellProtocol? {
        didSet {
            detailStackView.keyLabel.text = viewModel?.label ?? ""
            detailStackView.valueLabel.text = viewModel?.value ?? ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
