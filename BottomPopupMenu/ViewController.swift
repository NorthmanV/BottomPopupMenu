//
//  ViewController.swift
//  BottomPopupMenu
//
//  Created by Руслан Акберов on 03/10/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

private enum State {
    case opened, closed
    var opposite: State {
        switch self {
        case .opened: return .closed
        case .closed: return .opened
        }
    }
}

class ViewController: UIViewController {
    
    private lazy var popupView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.addGestureRecognizer(tapRecognizer)
        return view
    }()
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(popupViewTapped))
        return recognizer
    }()
    
    private var bottomConstraint = NSLayoutConstraint()
    private var currentState: State = .closed

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    func layout() {
        view.addSubview(popupView)
        popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        popupView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        bottomConstraint = popupView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 440)
        bottomConstraint.isActive = true
    }

    @objc func popupViewTapped(recognizer: UITapGestureRecognizer) {
        currentState = currentState.opposite
        let transitionAnimator = UIViewPropertyAnimator(duration: 1, dampingRatio: 1) {
            switch self.currentState {
            case .opened: self.bottomConstraint.constant = 0
            case .closed: self.bottomConstraint.constant = 440
            }
            self.view.layoutIfNeeded()
        }
        transitionAnimator.startAnimation()
    }

}
