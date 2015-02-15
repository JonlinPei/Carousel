//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Jonlin Pei on 2/14/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var welcome1ImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backUpButton: UIImageView!
    @IBOutlet weak var backUpSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomeScrollView.delegate = self
        welcomeScrollView.contentSize = CGSize(width: 1280, height: 568)
        
        backUpButton.alpha = 0
        backUpSwitch.alpha = 0
        pageControl.alpha = 1
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
        
    }

    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println(scrollView.contentOffset.x)
        var page = Int(scrollView.contentOffset.x / 320)
        pageControl.currentPage = page
//        var page = Int(scrollView.contentOffset.x / 320)
//        pageControl.currentPage = page
//        backUpButton.hidden = true
//        delay(1, { () -> () in
//            if(page == 3) {
////                self.pageControl.hidden = true
////                self.backUpButton.hidden = false
//                self.backUpButton.alpha = 1
//                self.pageControl.alpha = 0
//            } else {
//                self.pageControl.hidden = false
//                self.backUpButton.alpha = 0
//            }
//        
//        })
        
        if (page == 3) {
            UIView.animateWithDuration(0.5, animations: {
                self.backUpButton.alpha = 1
                self.backUpSwitch.alpha = 1
                self.pageControl.alpha = 0
            })} else {
            UIView.animateWithDuration(0.5, animations: {
                self.backUpButton.alpha = 0
                self.backUpSwitch.alpha = 0
                self.pageControl.alpha = 1
            })}
    
    }
//
//    @IBAction func didPressLoginButton(sender: AnyObject) {
//        loadingIndicator.startAnimating()
//        delay(2, { () -> () in
//            if (self.emailTextField.text == "email" && self.passwordTextField.text == "password") {
//                self.performSegueWithIdentifier("loginSegue", sender: self)
//            } else {
//                var alertView = UIAlertView(title: "Oops", message: "email/password is incorrect", delegate: nil, cancelButtonTitle: "OK")
//                alertView.show()
//            }
//            self.loadingIndicator.stopAnimating()
//        })
//        
//        
//    }

    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
