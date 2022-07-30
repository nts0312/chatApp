//
//  UserTableViewCell.swift
//  chatApp
//
//  Created by Nitin Singh on 30/07/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tapGestureRecognizer.addTarget(self, action: #selector(self.avatarTapped))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func generateCellWith(fUser: FUser, indexPath: IndexPath) {
        
        self.fullNameLabel.text = fUser.fullname
        
        
        if fUser.avatar != " " {
            imageFromData(pictureData: fUser.avatar) { (avatarImage) in
                avatarImageView.image = avatarImage?.circleMasked
            }
        }
    }
    
    @objc func avatarTapped() {
        
    }
    
}
