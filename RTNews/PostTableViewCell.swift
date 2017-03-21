//
//  PostTableViewCell.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postImageVIew: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(post : Post) {
        postTitle.text = post.title
        
//        var defaultAvatarImage = #imageLiteral(resourceName: "defaultAvatarImage")
//        let initalsAvatarImage = JSQMessagesAvatarImageFactory.avatarImage(withUserInitials: student.initals, backgroundColor: ClarkConstants.colors.blueColor, textColor:UIColor.white, font: .systemFont(ofSize: 17), diameter: 40).avatarImage
//        if let initalsAvatarImage = initalsAvatarImage { defaultAvatarImage = initalsAvatarImage }
//        
//        if let url = student.imageURL {
//            var placeholderImage : UIImage
//            if let initalsAvatarImage = initalsAvatarImage { defaultAvatarImage = initalsAvatarImage } else { defaultAvatarImage = #imageLiteral(resourceName: "defaultAvatarImage")}
//            if let currentImage = studentImageVIew.image { placeholderImage = currentImage } else { placeholderImage = defaultAvatarImage}
//            studentImageVIew.sd_setImage(with: url, placeholderImage: placeholderImage, options:.highPriority, completed: { (image: UIImage?, error: Error?, cacheType: SDImageCacheType, url: URL?) in
//                //
//            })
//        } else {
//            studentImageVIew.image = defaultAvatarImage
//        }
        
//        RoundingHelper.roundAndBorderImageView(imageView: self.studentImageVIew)
    }

}
