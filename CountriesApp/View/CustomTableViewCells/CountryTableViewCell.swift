//
//  CountryTableViewCell.swift
//  RestCountriesApi
//
//  Created by Shibili Areekara on 17/07/21.
//

import UIKit
import SDWebImageSVGCoder

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagIV: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalNameLabel: UILabel!
    
    var countryViewModel: CountryProtocol? { didSet { updateUI() } }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.flagIV.layer.cornerRadius = self.flagIV.frame.size.width / 2
        self.flagIV.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.flagIV.image = nil
    }
    
    private func updateUI() {
        countryNameLabel.text = countryViewModel?.name
        capitalNameLabel.text = countryViewModel?.capital
        
        if let flagImageURL = URL(string: countryViewModel?.flagImageUrl ?? "") {
            self.flagIV.sd_setImage(with: flagImageURL, completed: nil)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
