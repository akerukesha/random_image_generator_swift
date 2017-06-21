//
//  ViewController.swift
//  ImageDownloader
//
//  Created by Akerke Okapova on 6/21/17.
//  Copyright © 2017 Akerke Okapova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var imageViewInstance: UIImageView!
    
    override func viewDidLoad() {
        self.spinner.stopAnimating()
    }
    @IBAction func loadNewImage(_ sender: UIButton) {
        let url = "https://unsplash.it/1080/1920/?random"
        
        imageViewInstance.image = nil
        spinner.startAnimating()
        
        ImageDownloader.fetchImage(with: url) {image in
            
            self.spinner.stopAnimating()
            self.imageViewInstance.image = image
        }
    }
}
