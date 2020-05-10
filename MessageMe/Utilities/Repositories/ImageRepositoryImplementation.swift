//
//  ImageRepositoryImplementation.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/07.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit
import Foundation

class ImageRepositoryImplementation:ImageRepository {
    
    let imageCache = NSCache<NSString, UIImage>()
    let imageFailureCount = NSCache<NSString, NSNumber>()
    
    func fetchImage(with url: String, completionHandler: @escaping () -> ()) -> UIImage? {
        
        let imageServerUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        if hasReachedErrorCount(for:imageServerUrl) {
            return nil
        }
            
        if let cachedImage = imageCache.object(forKey: NSString(string: imageServerUrl)) {
            return cachedImage
        }

        guard let url = URL(string: imageServerUrl) else {
            handleErrorCountIncrement(for: imageServerUrl)
            completionHandler()
            return nil
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if error != nil {
                self.handleErrorCountIncrement(for: url.absoluteString)
                DispatchQueue.main.async {
                    completionHandler()
                    return
                }
            }
            
            if let data = data, let downloadedImage = UIImage(data: data) {
                self.imageCache.setObject(downloadedImage, forKey: NSString(string: imageServerUrl))
                DispatchQueue.main.async {
                    completionHandler()
                    return
                }
            } else {
                self.handleErrorCountIncrement(for: url.absoluteString)
                DispatchQueue.main.async {
                    completionHandler()
                }
            }

        }).resume()
        
        return nil
    }
    
    private func handleErrorCountIncrement(for url:String) {
        
        guard let imageFailureCount = imageFailureCount.object(forKey: NSString(string: url)) else {
            self.imageFailureCount.setObject(NSNumber(integerLiteral: 0), forKey: NSString(string: url))
            return
        }
        
        var imageFailureIntCount = imageFailureCount.intValue
        imageFailureIntCount += 1
        self.imageFailureCount.setObject(NSNumber(integerLiteral: imageFailureIntCount), forKey: NSString(string: url))
    }
    
    private func hasReachedErrorCount(for url:String) -> Bool {
        guard let imageFailureCount = imageFailureCount.object(forKey: NSString(string: url)) else {
            return false
        }
        
        return imageFailureCount.intValue >= 3
    }
}
    
    

