//
//  InstantPanGestureRecognizer.swift
//  BottomPopupMenu
//
//  Created by Руслан Акберов on 06/10/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

// A pan gesture that enters into the `began` state on touch down instead of waiting for a touches moved event
class InstantPanGestureRecognizer: UIPanGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if self.state == .began { return }
        super.touchesBegan(touches, with: event)
        self.state = .began
    }
}
