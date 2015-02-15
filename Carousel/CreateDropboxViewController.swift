//
//  CreateDropboxViewController.swift
//  Carousel
//
//  Created by Jonlin Pei on 2/14/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class CreateDropboxViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var agreeTermsCheckbox: UIButton!
    @IBOutlet weak var createAccountContainer: UIView!
    @IBOutlet weak var createAccountButtonsContainer: UIView!
    @IBOutlet var createAccountView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountContainerScrollView: UIScrollView!
    
    var originalCreateAccountYCenter: CGFloat!
    var originalCreateAccountButtonsYCenter: CGFloat!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        agreeTermsCheckbox.selected = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        originalCreateAccountYCenter = createAccountContainerScrollView.center.y
        originalCreateAccountButtonsYCenter = createAccountButtonsContainer.center.y
        
        //Looks for single or multiple taps.
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        createAccountView.addGestureRecognizer(tap)
        
        createAccountContainerScrollView.delegate = self
        createAccountContainerScrollView.contentSize = CGSize(width: 320, height: 250)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressCreateAccountButton(sender: AnyObject) {
        
        var alertViewCreatingAccount = UIAlertView(title: "Creating account...", message: "", delegate: nil, cancelButtonTitle: nil)
        
        loadingIndicator.startAnimating()
        alertViewCreatingAccount.show()
        
        delay(2, { () -> () in
            if (self.emailTextField.text != "" && self.passwordTextField.text != "" && self.firstNameTextField.text != "" && self.lastNameTextField.text != "" && self.agreeTermsCheckbox.selected != false) {
                self.performSegueWithIdentifier("createAccountSegue", sender: self)
            } else {
                var alertViewBadCombo = UIAlertView(title: "Oops", message: "Please fill in all fields and agree to the Dropbox Terms of Service", delegate: nil, cancelButtonTitle: "OK")
                alertViewBadCombo.show()
            }
            self.loadingIndicator.stopAnimating()
            alertViewCreatingAccount.dismissWithClickedButtonIndex(0, animated: true)
            
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
            self.createAccountContainerScrollView.center.y = 162
            self.createAccountButtonsContainer.center.y = 250
            
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
            self.createAccountContainerScrollView.center.y = self.originalCreateAccountYCenter
            self.createAccountButtonsContainer.center.y = self.originalCreateAccountButtonsYCenter
            }, completion: nil)
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //        println(scrollView.contentOffset.x)
        //        var page = Int(scrollView.contentOffset.x / 320)
        //        pageControl.currentPage = page
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        firstNameTextField.endEditing(true)
        lastNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        emailTextField.endEditing(true)
    }
    
    
    
    
    
    @IBAction func backButtonDidPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    @IBAction func termsButtonDidPress(sender: AnyObject) {
        if let url = NSURL(string: "https://www.dropbox.com/terms") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    @IBAction func agreeTermsButtonDidPress(sender: AnyObject) {
        agreeTermsCheckbox.selected = !agreeTermsCheckbox.selected
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
