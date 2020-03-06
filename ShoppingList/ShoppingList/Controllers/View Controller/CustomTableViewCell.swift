//
//  ButtonTableViewCell.swift
//  ShoppingList
//
//  Created by Kelsey Sparkman on 3/6/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit
import CoreData

protocol CustomTableViewCellDeligate: class{
    func buttonTapped(_ sender: CustomTableViewCell)
    func updateButton(_ sender: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {
    
    weak var deligate: CustomTableViewCellDeligate?
    
    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var listNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        deligate?.buttonTapped(self)
    }
    
    
    //Update Views
    func updateViews(list: List) {
        listNameLabel.text = list.title
        completeButton.setImage(list.isComplete ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete"), for: .normal)
    }
    

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }

}

