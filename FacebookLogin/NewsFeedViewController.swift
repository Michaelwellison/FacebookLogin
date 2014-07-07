//
//  NewsFeedViewController.swift
//  FacebookLogin
//
//  Created by Michael Ellison on 7/6/14.
//  Copyright (c) 2014 MichaelWEllison. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet var mainFeedImage: UIImageView
    @IBOutlet var loadingView: UIActivityIndicatorView
   
    @IBOutlet var scrollView: UIScrollView
    @IBOutlet var statusButton: UIButton

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNewsFeedMainImage()

        // Do any additional setup after loading the view.
    }
    
    func configureNewsFeedMainImage() {
      
        mainFeedImage.alpha = CGFLOAT_MIN
        loadingView.startAnimating()
        
        delay(3, closure: {
            
            self.mainFeedImage.alpha = CGFLOAT_MAX
            self.loadingView.stopAnimating()
            })
        
    }
    
    func configureScrollView() {
        self.scrollView.contentSize = self.mainFeedImage.image.size
        
    }

    // Function to create a delay method that is easy to re-use
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }


    @IBAction func onComposeButton(sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
