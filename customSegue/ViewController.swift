//
//  ViewController.swift
//  customSegue
//
//  Created by Sam Yoeun on 8/29/19.
//  Copyright © 2019 Sam Yoeun. All rights reserved.
//

import UIKit
import ViewAnimator

class ViewController: UIViewController {
    
    @IBOutlet private var button: UIView! {
        didSet {
            
        }
    }
    
    enum AnimationType {
        case show
        case hide
    }
    
@IBOutlet private var dismissButton: UIButton!
    @IBOutlet private var buttonHeight: NSLayoutConstraint!
    @IBOutlet private var buttonLeading: NSLayoutConstraint!
    @IBOutlet private var buttonTrailing: NSLayoutConstraint!
    @IBOutlet private var buttonbottomContraint: NSLayoutConstraint!
    @IBOutlet private var topConstant: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 20
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
          animateVC(type: .show)
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
       
    }
    
    @IBAction func dismiss(_ sender: Any) {
        animateVC(type: .hide)
       
}
    
    func animateVC(type: AnimationType) {
        switch type {
        case .show:
            self.dismissButton.isEnabled = false
            buttonLeading.constant = -(UIScreen.main.bounds.width)/2
            buttonTrailing.constant = -(UIScreen.main.bounds.width)/2
            buttonbottomContraint.constant = 100

//            buttonLeading.constant = -100
//            buttonTrailing.constant = -100
//            buttonbottomContraint.constant = 100
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.2, options: [.curveEaseOut], animations: {
                self.button.layer.cornerRadius = UIScreen.main.bounds.width*0.5
//                self.button.layer.cornerRadius = 150
                self.view.layoutIfNeeded()
            }, completion: nil )
            
            
            self.buttonbottomContraint.constant = -(UIScreen.main.bounds.width)
            self.topConstant.constant = -30
            UIView.animate(withDuration: 0.4, delay: 0.15, usingSpringWithDamping: 1, initialSpringVelocity: 0.2, options: [.curveEaseOut], animations: {
                self.view.layoutIfNeeded()
            }, completion: {bool in
                self.dismissButton.isEnabled = true
            })
//
            
        case .hide:
//
            
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 0.2, options: [.curveEaseIn], animations: {
                
                self.buttonLeading.constant  = 100
                self.buttonTrailing.constant  = 100
                self.buttonbottomContraint.constant = UIScreen.main.bounds.height + 20 - 40
                self.topConstant.constant = 20
                self.button.layer.cornerRadius = 20
                self.button.alpha = 0

                self.view.layoutIfNeeded()
//                self.view.needsUpdateConstraints()
            }, completion: {bool in
                // self.dismiss(animated: true, completion: nil)
            })
        }
        
    }
        
        
}

