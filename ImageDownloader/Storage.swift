//
//  Storage.swift
//  ImageDownloader
//
//  Created by Akerke Okapova on 6/27/17.
//  Copyright © 2017 Akerke Okapova. All rights reserved.
//

import Cache

private struct Caches {
    static let imageCache = SpecializedCache<UIImage>(name: "Image Cache")
}

private struct Keys {
    static let image = "Image"
}

struct Storage {
    
    static var image: UIImage?
    
    static func retrieve(completion: @escaping (UIImage?) -> Void) {
        Caches.imageCache.async.object(forKey: Keys.image) { image in
            completion(image)
        }
    }
    
    static func insert(image: UIImage) {

        Storage.image = image
        Caches.imageCache.async.addObject(image, forKey: Keys.image) { error in
            print(error ?? "insert ok")
        }
    }
    
    static func delete() {
        
        Storage.image = nil
        Caches.imageCache.async.removeObject(forKey: Keys.image) { error in
            print(error ?? "delete ok")
        }
    }
}
