//
//  FlagImageTableViewCell.swift
//  CountriesApp
//
//  Created by Shibili Areekara on 18/07/21.
//

import UIKit

class FlagImageTableViewCell: UITableViewCell {
    @IBOutlet weak var flagIV: UIImageView!
    @IBOutlet weak var flagHeightConstraint: NSLayoutConstraint!
    
    var viewModel: CountryDetailCellProtocol? {
        didSet {
            self.loadFlagImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        flagHeightConstraint.constant = (2 / 3) * flagIV.frame.size.width
    }
    
    private func loadFlagImage() {
        let url = URL(string: viewModel?.value ?? "")
        self.flagIV.sd_setImage(with: url, completed: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
