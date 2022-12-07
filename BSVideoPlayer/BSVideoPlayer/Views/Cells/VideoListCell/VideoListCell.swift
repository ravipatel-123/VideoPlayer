//
//  VideoListCell.swift
//  VideoPlayerPod
//
//  Created by bs-mac-4 on 29/11/22.
//

import UIKit

class VideoListCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var thumbIma: UIImageView!
    @IBOutlet weak var playPauseImaContainerView: UIView!
    @IBOutlet weak var playPauseIma: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        playPauseImaContainerView.layer.cornerRadius = playPauseImaContainerView.frame.width/2
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        thumbIma.contentMode = .scaleAspectFill
    }

}
