//
//  IntroViewController.swift
//  Carousel
//
//  Created by Jonlin Pei on 2/10/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var bunnyEarsPeople: UIImageView!
    @IBOutlet weak var fishPerson: UIImageView!
    @IBOutlet weak var deerPicture: UIImageView!
    @IBOutlet weak var cabinPicture: UIImageView!
    @IBOutlet weak var doggyPicture: UIImageView!
    @IBOutlet weak var riverPicture: UIImageView!
    
    

    
    
    //
//    var scale: CGFloat! = 1.0
//    var rotate: CGFloat! = 0
    

    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func transformView(view : UIView!, atIndex index : Int, offset : Float){
        
    }
    
    func updateViewTransformsWithOffset(offset : Float) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
//        scrollView.contentSize = CGSize(width: 320, height: 1136)
        scrollView.contentSize = introImageView.frame.size
        scrollViewDidScroll(scrollView)

        
//         Initial image placement
//        bunnyEarsPeople.transform = CGAffineTransformConcat(CGAffineTransformMakeDegreeRotation(350), CGAffineTransformMakeScale(1, 1))
//        fishPerson.transform = CGAffineTransformConcat(CGAffineTransformMakeDegreeRotation(10), CGAffineTransformMakeScale(1.8, 1.8))
//        deerPicture.transform = CGAffineTransformConcat(CGAffineTransformMakeDegreeRotation(350), CGAffineTransformMakeScale(1.8, 1.8))
//        cabinPicture.transform = CGAffineTransformConcat(CGAffineTransformMakeDegreeRotation(10), CGAffineTransformMakeScale(1.8, 1.8))
//        doggyPicture.transform = CGAffineTransformConcat(CGAffineTransformMakeDegreeRotation(350), CGAffineTransformMakeScale(1.8, 1.8))
//        riverPicture.transform = CGAffineTransformConcat(CGAffineTransformMakeDegreeRotation(10), CGAffineTransformMakeScale(1.8, 1.8))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)
        
        // content offset: 0 -> 568
        // x offset: -30 -> 0
        // y offset: -285 -> 0
        
//        bunnyEarsPeople
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -70, r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -270, r2Max: 0)
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        bunnyEarsPeople.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        bunnyEarsPeople.transform = CGAffineTransformScale(bunnyEarsPeople.transform, CGFloat(scale), CGFloat(scale))
        bunnyEarsPeople.transform = CGAffineTransformRotate(bunnyEarsPeople.transform, CGFloat(Double(rotation) * M_PI / 180))
        
//        deerPicture
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 37, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -243, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        deerPicture.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        deerPicture.transform = CGAffineTransformScale(deerPicture.transform, CGFloat(scale), CGFloat(scale))
        deerPicture.transform = CGAffineTransformRotate(deerPicture.transform, CGFloat(Double(rotation) * M_PI / 180))
        
//        riverPicture
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 95, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -396, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        riverPicture.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        riverPicture.transform = CGAffineTransformScale(riverPicture.transform, CGFloat(scale), CGFloat(scale))
        riverPicture.transform = CGAffineTransformRotate(riverPicture.transform, CGFloat(Double(rotation) * M_PI / 180))
        
//        fishPerson
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 15, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        fishPerson.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        fishPerson.transform = CGAffineTransformScale(fishPerson.transform, CGFloat(scale), CGFloat(scale))
        fishPerson.transform = CGAffineTransformRotate(fishPerson.transform, CGFloat(Double(rotation) * M_PI / 180))

        
//        cabinPicture
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -110, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        cabinPicture.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        cabinPicture.transform = CGAffineTransformScale(cabinPicture.transform, CGFloat(scale), CGFloat(scale))
        cabinPicture.transform = CGAffineTransformRotate(cabinPicture.transform, CGFloat(Double(rotation) * M_PI / 180))


//        doggyPicture
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -90, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -490, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        doggyPicture.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        doggyPicture.transform = CGAffineTransformScale(doggyPicture.transform, CGFloat(scale), CGFloat(scale))
        doggyPicture.transform = CGAffineTransformRotate(doggyPicture.transform, CGFloat(Double(rotation) * M_PI / 180))
    
        
    }
        
        
//    func {}
    
        
        
        
        
        
        
        
        
        
//        println("testing")
//        UIView.animateWithDuration(50, delay: 0.0, options: UIViewAnimationOptions(UInt(50 << 16)), animations: {
//
//            // Brings the login back to where it was when we started
////            self.loginContainer.center.y = self.originalLoginYCenter
//            
//                    self.riverPicture.transform = CGAffineTransformConcat(CGAffineTransformMakeDegreeRotation(180), CGAffineTransformMakeScale(3, 3))
//            
//            }, completion: nil)
//
//    func rotateAndScale(var image: UIImageView!){
//        UIView.animateWithDuration(1.0, animations: { () -> Void in
//            var scaleTransform = CGAffineTransformMakeScale(self.scale, self.scale)
//            var rotateTransform = CGAffineTransformMakeDegreeRotation(self.rotate)
//            var combinedTransform = CGAffineTransformConcat(scaleTransform, rotateTransform)
//            self.image.transform = combinedTransform
//        })
//    }
//
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
