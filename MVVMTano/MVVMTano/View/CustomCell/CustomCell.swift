//
//  CustomCell.swift
//  MVVMTano
//
//  Created by admin on 2/2/21.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextBody: UITextView!
    
    func setup(object: List) {
        myLabel.text = object.title
        myTextBody.text = object.body
        myImage.backgroundColor = .red
    }
    
    override func prepareForReuse() {
        myImage.image = nil
        myTextBody.text = ""
        myImage.backgroundColor = .white
    }
    
}
