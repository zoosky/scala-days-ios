/*
* Copyright (C) 2015 47 Degrees, LLC http://47deg.com hello@47deg.com
*
* Licensed under the Apache License, Version 2.0 (the "License"); you may
* not use this file except in compliance with the License. You may obtain
* a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import UIKit

class SDSpeakersTableViewCell: SDSocialTableViewCell {
    override func awakeFromNib() {
        self.imgView.circularImage()
        self.lblContent.numberOfLines = 0
        self.lblContent.setCustomFont(UIFont.fontHelveticaNeueLight(15), colorFont: UIColor.appColor())
        self.lblFullName.setCustomFont(UIFont.fontHelveticaNeueMedium(15), colorFont: UIColor.appColor())
        self.lblUsername.setCustomFont(UIFont.fontHelveticaNeue(15), colorFont: UIColor.appRedColor())
    }
    
    func drawSpeakerData(speaker: Speaker) {
        lblFullName.text = speaker.name
        if let twitterUsername = speaker.twitter {
            if contains(twitterUsername, "@") {
                lblUsername.text = twitterUsername
            } else {
                lblUsername.text = "@\(twitterUsername)"
            }            
        } else {
            lblUsername.text = ""
        }
        lblContent.text = speaker.bio.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if let pictureUrlString = speaker.picture {
            if let pictureUrl = NSURL(string: pictureUrlString) {
                imgView.sd_setImageWithURL(pictureUrl, placeholderImage: UIImage(named: "avatar")!)
            }
        }
        layoutSubviews()
    }
}
