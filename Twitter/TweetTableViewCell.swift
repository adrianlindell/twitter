//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Adrian Lindell on 4/23/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBAction func likeTweet(_ sender: Any) {
        if(!isLiked) {
            //like tweet
            TwitterAPICaller.client?.likeTweet(tweetId: tweetId, success: {
                self.setLike(true)
            }, failure: { (error) in
                print("Unable to like tweet: \(error)")
            })
        }
        else {
            //unlike tweet
            TwitterAPICaller.client?.unlikeTweet(tweetId: tweetId, success: {
                self.setLike(false)
            }, failure: { (error) in
                print("Unable to unlike tweet: \(error)")
            })
        }
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
        if(!isRetweeted) {
            //retweet tweet
            TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success: {
                self.setRetweet(true)
            }, failure: { (error) in
                print("Unable to retweet tweet: \(error)")
            })
        }
        else {
            //unretweet tweet
            TwitterAPICaller.client?.unretweetTweet(tweetId: tweetId, success: {
                self.setRetweet(false)
            }, failure: { (error) in
                print("Unable to unretweet tweet: \(error)")
            })
        }
    }
    
    var isLiked:Bool = false
    var isRetweeted:Bool = false
    var tweetId:Int = -1
    
    func setLike(_ liked:Bool){
        isLiked = liked
        if(isLiked) {
            //set image to red if liked
            likeButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            //set image to gray if not liked
            likeButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweet(_ retweet:Bool) {
        isRetweeted = retweet
        if(isRetweeted) {
            //set image to green if retweeted
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else {
            //set image to gray if not retweeted
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
