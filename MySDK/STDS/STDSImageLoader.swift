//
//  STDSImageLoader.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//

import Foundation
import UIKit

/// Typealias for the image download completion block
typealias STDSImageDownloadCompletionBlock = (UIImage?) -> Void

/// `STDSImageLoader` is responsible for loading images from a given URL.
class STDSImageLoader {
    private let session: URLSession

    /// Initializes an `STDSImageLoader` with the given URL session.
    ///
    /// - Parameter session: The session to initialize the loader with. Defaults to `.shared`.
    init(session: URLSession = .shared) {
        self.session = session
    }

    /// Attempts to load an image from the specified URL.
    ///
    /// - Parameters:
    ///   - url: The URL to load an image for.
    ///   - completion: A completion block that is called when the image loading has finished.
    ///                 This will be called on the main queue.
    func loadImage(from url: URL, completion: @escaping STDSImageDownloadCompletionBlock) {
        let task = session.dataTask(with: url) { data, response, error in
            var image: UIImage? = nil
            if let data = data {
                image = UIImage(data: data)
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
}
