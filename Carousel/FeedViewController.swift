//
//  FeedViewController.swift
//  Carousel
//
//  Created by Jonlin Pei on 2/14/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        feedScrollView.delegate = self
        feedScrollView.contentSize = CGSize(width: 320, height: 1600)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
