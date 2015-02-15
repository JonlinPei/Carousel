//
//  SignInViewController.swift
//  Carousel
//
//  Created by Jonlin Pei on 2/13/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var signInButtonsContainer: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var signInView: UIView!
    
    var originalLoginYCenter: CGFloat!
    var originalSignInButtonsYCenter: CGFloat!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalLoginYCenter = loginContainer.center.y
        originalSignInButtonsYCenter = signInButtonsContainer.center.y
        
        //Looks for single or multiple taps.
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        signInView.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressSignInButton(sender: AnyObject) {

        var alertViewSigningIn = UIAlertView(title: "Signing in...", message: "", delegate: nil, cancelButtonTitle: nil)
        
        loadingIndicator.startAnimating()
        alertViewSigningIn.show()
        
        delay(2, { () -> () in
            if (self.emailTextField.text == "jonlinpei@gmail.com" && self.passwordTextField.text == "password") {
                self.performSegueWithIdentifier("signInSegue", sender: self)
            } else {
                var alertViewBadCombo = UIAlertView(title: "Oops", message: "email/password is incorrect", delegate: nil, cancelButtonTitle: "OK")
                alertViewBadCombo.show()
            }
            self.loadingIndicator.stopAnimating()
            alertViewSigningIn.dismissWithClickedButtonIndex(0, animated: true)

        })
        
        
    }
    

    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            //Moving the login and buttons up so the keyboard doesn't overlap the view
            self.loginContainer.center.y = 123
            self.signInButtonsContainer.center.y = 232

// ------ replaced with the above code so containers don't keep moving up
//            self.loginContainer.center.y = self.loginContainer.center.y - 70
//            self.signInButtonsContainer.center.y = self.signInButtonsContainer.center.y - 284
//-----------
        
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Brings the login and buttons back to where it was when we started
            self.loginContainer.center.y = self.originalLoginYCenter
            self.signInButtonsContainer.center.y = self.originalSignInButtonsYCenter
            }, completion: nil)
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
//        println(scrollView.contentOffset.x)
//        var page = Int(scrollView.contentOffset.x / 320)
//        pageControl.currentPage = page
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        passwordTextField.endEditing(true)
        emailTextField.endEditing(true)
    }
    
    
    
    @IBAction func backButtonDidPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
