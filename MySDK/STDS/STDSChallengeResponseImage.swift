//
//  STDSChallengeResponseImage.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//

import Foundation

class STDSChallengeResponseImage: Identifiable {

    /// A medium density image to display as the issuer image.
    var mediumDensityURL: URL
    
    /// A high density image to display as the issuer image.
    var highDensityURL: URL
    /// An extra-high density image to display as the issuer image.
    var extraHighDensityURL: URL
    init (
        mediumDensityURL: URL,
        highDensityURL:URL,
        extraHighDensityURL:URL
    ){
        self.mediumDensityURL = mediumDensityURL
        self.highDensityURL = highDensityURL
        self.extraHighDensityURL = extraHighDensityURL
        
    }
}
