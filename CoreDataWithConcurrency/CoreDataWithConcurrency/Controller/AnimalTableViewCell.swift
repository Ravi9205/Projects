//
//  AnimalTableViewCell.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 27/07/23.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    static let identifier = "AnimalTableViewCell"
    
    @IBOutlet weak var lbl_animalName:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
