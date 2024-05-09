//
//  UniversitiesListTC.swift
//  Assestment Test
//
//  Created by Admin on 07/05/24.
//

import UIKit

class UniversitiesListTC: UITableViewCell {
    // MARK: - All Outlet
    @IBOutlet weak var lblUniversityName: UILabel!
    @IBOutlet weak var lblUniversityState: UILabel!
    @IBOutlet weak var btnDetails: UIButton!
    // MARK: - Intilize Cell
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
