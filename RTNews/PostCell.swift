//
//  PostCell
//  RTNews
//
//  Created by Ryan Phillip Thomas on 3/21/17.
//  Copyright © 2017 ryanphillipthomas. All rights reserved.
//

import Foundation
import RTCoreData
import CoreData

protocol PostCell {
    func configureWith(post: Post, moc: NSManagedObjectContext, buttonCallback:((ButtonCallbackType)->Void)?)
}

enum ButtonCallbackType {
    case share
    case like
}
