//
//  NoteCell.swift
//  MVVMDemo
//
//  Created by javad Arji on 8/24/22.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var noteLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func set(text: String) {
        noteLabel.text = text
    }
}
