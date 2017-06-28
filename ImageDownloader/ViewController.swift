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
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBAction func loadNewImage(_ sender: UIBarButtonItem) {
        let url = "https://unsplash.it/1080/1920/?random"
        
        imageViewInstance.image = nil
        spinner.startAnimating()
        
        if Storage.image != nil {
            Storage.delete()
        }
        
        ImageDownloader.fetchImage(with: url) {image in
            self.spinner.stopAnimating()
            Storage.insert(image: image)
            self.imageViewInstance.image = image
        }
    }
    
    @IBAction func clearCache(_ sender: UIBarButtonItem) {
        imageViewInstance.image = nil
        Storage.delete()
    }
    
    private func setImage() {
        print("START")
        spinner.startAnimating()
        
        Storage.retrieve() { image in
            print("END")
            self.spinner.stopAnimating()
            Storage.image = image
            self.imageViewInstance.image = image
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setImage()
    }
}
