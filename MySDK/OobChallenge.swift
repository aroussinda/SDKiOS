//
//  oob.swift
//  3DSExemple
//
//  Created by Sinda Arous on 10/03/2025.
//


import SwiftUI

// The reusable view component that represents your form
struct oobChallengeView: View {
    private let textFieldCustomization = STDSTextFieldCustomization.defaultSettings()
    private let buttonCustomization = STDSButtonCustomization(backgroundColor: .systemBlue, cornerRadius: 8,titleStyle: .uppercase)
    private let textTitleCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 17))
    private let textBodyCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 12))
    private let selectCustomization = STDSSelectionCustomization.defaultSettings()
    private let footerCustomization = STDSFooterCustomization.defaultSettings()
    private let imageLoader = STDSImageLoader()
    private let navigationCustomization = STDSNavigationBarCustomization.defaultSettings()

    
    
    @State private var selectedOptions: Set<String> = []
    @State private var showMore: Bool = false // State to control the visibility of extra content
    @State private var showMore1: Bool = false // State to control the visibility of extra content
    
    let response: STDSChallengeResponse
    var onClose: () -> Void
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    
                    //  HStack (alignment: .center){
                    
                    VStack {
                        if let bundle = Bundle(identifier: "com.exemple.MySDK.MySDK"),
                           let image = UIImage(named: "logoMSS", in: bundle, with: nil) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        } else {
                            Text("Image not found")
                        }
                        Spacer()
                    }
                     //VStack {
                    /* Image("logo") // Remplacez "imageName" par le nom de votre image
                     .resizable()
                     .scaledToFit()
                     .frame(width: 100, height: 100)
                     .cornerRadius(10)
                     }   .background(Color.white) // Définir la couleur de fond blanche
                     .cornerRadius(10) // Pour ajouter un coin arrondi
                     .shadow(radius: 5)*/ // Pour ajouter une ombre autour de la boîte
                    /*if response.issuerImage != nil {
                     IssuerImageView(ImageURL: response.issuerImage?.mediumDensityURL)
                     } else {
                     EmptyView()
                     }
                     if response.paymentSystemImage != nil {
                     IssuerImageView(ImageURL: response.paymentSystemImage?.mediumDensityURL)
                     } else {
                     EmptyView()
                     }
                     */
                    
                    // }
                    // .frame(maxWidth: .infinity, alignment: .center) // Centers the HStack content horizontally
                    
                    Text(response.challengeInfoHeader ?? "Security Challenge")
                        .bold()
                        .padding(.bottom, 5)
                        .font(Font(textTitleCustomization.headingFont))
                    
                    
                    
                    
                    HStack(alignment: .top){
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 18))
                        Text(response.challengeInfoText ?? "")
                            .bold()
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 5)
                            .font(Font(textBodyCustomization.headingFont))
                    }
                    .padding()
                    Button(action: {
                        
                    }) {
                        Text(buttonCustomization.formatTitle(response.submitAuthenticationLabel ?? "Next", style: buttonCustomization.titleStyle))
                            .font(.system(size: 16, weight: .bold))
                            .padding()
                            .frame(maxWidth: .infinity)
                        
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(buttonCustomization.cornerRadius)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .frame(width: .infinity, height: 50)
                    
                    Divider().frame(height: 4) // Optional Divider
                    HStack (alignment: .top){
                        Image(systemName: showMore ? "chevron.up" : "chevron.down")
                            .foregroundColor(.gray)
                            .font(.system(size: 15)) // Adjust the size of the arrow
                        Button(action: {
                            withAnimation {
                                showMore.toggle() // Toggle the state when the button is tapped
                            }
                        }) {
                            Text(response.whyInfoLabel ?? "")
                                .foregroundColor( .white )
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 5)
                                .font(Font(textBodyCustomization.headingFont))
                            
                        }
                        
                        
                    }
                    .padding(.all, 10)
                    if showMore {
                        Text(response.whyInfoText ?? "")
                        
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 5)
                            .font(Font(textBodyCustomization.headingFont))
                        
                    }
                    HStack (alignment: .top) {
                        
                        Image(systemName: showMore1 ? "chevron.up" : "chevron.down")
                            .foregroundColor(.gray)
                            .font(.system(size: 15)) // Adjust the size of the arrow
                        Button(action: {
                            withAnimation {
                                showMore1.toggle() // Toggle the state when the button is tapped
                            }
                        }) {
                            Text(response.expandInfoLabel ?? "")
                                .foregroundColor( .white)
                            
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 5)
                                .font(Font(textBodyCustomization.headingFont))
                            
                            
                            
                        }
                        
                        
                    }
                    .padding(.all, 10)
                    if showMore1 {
                        Text(response.expandInfoText ?? "")
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 5)
                            .font(Font(textBodyCustomization.headingFont))
                        
                        
                    }
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .frame(maxWidth: .infinity, alignment: .leading) // Aligns VStack content to the left
                
            }
        }
        
    }
    
}
struct IssuerImageView: View {
    var ImageURL: URL? // URL to the issuer's image
    @State private var downloadedImage: UIImage? = nil // The downloaded image
    private let imageLoader = STDSImageLoader()

    var body: some View {
        VStack {
            if let issuerImage = downloadedImage {
                // Display the downloaded image
                Image(uiImage: issuerImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding()
            } else if ImageURL != nil {
                // Load the image if it's not downloaded
               
            } else {
                // Fallback if no URL is provided
                Text("Issuer image is unavailable.")
                    .padding()
            }
        }
        .background(Color.white) // Définir la couleur de fond blanche
        .cornerRadius(10) // Pour ajouter un coin arrondi
        .shadow(radius: 5) // Pour ajouter une ombre autour de la boîte
    }

    private func loadImage(from url: URL) {
        imageLoader.loadImage(from: url) { image in
            self.downloadedImage = image
        }
    }
}
