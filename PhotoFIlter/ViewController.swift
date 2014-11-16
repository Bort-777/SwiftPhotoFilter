//
//  ViewController.swift
//  PhotoFIlter
//
//  Created by Carlos Calderon on 11/16/14.
//  Copyright (c) 2014 Calderware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    let context = CIContext(options: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func applyFIlterButtonPressed(sender: UIBarButtonItem) {
        //Create an Image to Filter
        let inputImage = CIImage(image: photoImageView.image)
        // Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        
        //Apply a filter to the image
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        //render the filtered image
        let renderedImge = context.createCGImage(filteredImage, fromRect: filteredImage.extent())
        
        //Reflect the change back in the interface
        photoImageView.image = UIImage(CGImage: renderedImge)
    }

}

