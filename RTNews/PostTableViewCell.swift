//
//  PostTableViewCell.swift
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.
//

import UIKit
import CoreData

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postCategoryLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var sinceDateLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    var buttonCallback:((ButtonCallbackType)->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cornerPostImageView()
    }
    
    // MARK: - Top Header View
    func cornerPostImageView() {
        postImageView.layer.cornerRadius = 5.0
        postImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didSelectShareAction(_ sender: Any) {
        buttonCallback?(ButtonCallbackType.share)
    }
    
    @IBAction func didSelectClose(_ sender: Any) {
    }
}

extension PostTableViewCell : PostCell {
    func configureWith(post: Post, moc: NSManagedObjectContext, buttonCallback: ((ButtonCallbackType) -> Void)?) {
        self.postTitleLabel.text = post.title
        self.buttonCallback = buttonCallback
        
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
