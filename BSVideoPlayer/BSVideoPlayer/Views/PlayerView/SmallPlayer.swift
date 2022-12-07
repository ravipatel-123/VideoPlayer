//
//  SmallPlayer.swift
//  Radio
//
//  Created by RAVI PATEL on 15/07/22.
//  Copyright © 2022 Ravi Patel. All rights reserved.
//

import UIKit


class SmallPlayer: UIView {
    
    

    //MARK: - OUTLETS
    
    
    //MARK: - LIFE CYCLE
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func instanceFromNib() -> SmallPlayer {
        return UINib(nibName: "SmallPlayer", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SmallPlayer
    }
    
    //MARK: - FUNCTIONS
    
    func setupUI() {
       
    }
    
    
    //MARK: - BTNS ACTIONS
    
    
}
