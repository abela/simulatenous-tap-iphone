//
//  DoubleTapScreen.swift
//  Button Multiple Touch
//
//  Created by Sandro Janjghava on 5/22/19.
//  Copyright © 2019 Sandro Janjghava. All rights reserved.
//

import UIKit

class DoubleTapScreen: UIViewController {

    @IBOutlet private weak var doubleTapLabel: UILabel!
    
    private var touchCount: Int = 0
    private var touchInterval: TimeInterval = 0.0
    private var touchTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //
        // touch count set to zero
        touchCount = 0
        
        // desired touch tap interval - we will detect the intera
        touchInterval = 0.1
    }
    
    // expire touch time - if delay between touches is bigger than touchInterval, reset the timer and tpuch count
    @objc func expireTouchTime(_ timer: Timer?) {
        //
        touchTimer.invalidate()
        touchTimer = nil
        touchCount = 0
        //
    }
    
    @IBAction func buttonTouchDown(_ sender: Any) {
        // increase touch count
        touchCount += 1
        
        switch touchCount {
        // if touch count is 1, lets run timer and wait to another touch in some time interval - touchInterval
        case 1:
            touchTimer = Timer.scheduledTimer(timeInterval: touchInterval, target: self, selector: #selector(self.expireTouchTime(_:)), userInfo: nil, repeats: false)
        // if we already touched in given interval - count this is the double touch, reset the timer
        case 2:
            
            
            self.doubleTapLabel.text = "double touch !!!"
            touchTimer.invalidate()
            touchTimer = nil
        default:
            break
        }
    }
    
    // touch up - lets return touch count to 0 and set default text to label
    @IBAction func buttonTouchUp(_ sender: Any) {
        touchCount = 0
        self.doubleTapLabel.text = "..."
    }

}
