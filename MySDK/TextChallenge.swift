//
//  Text.swift
//  3DSExemple
//
//  Created by Sinda Arous on 10/03/2025.
//

import SwiftUI

// The reusable view component that represents your form
struct TextChallengeView: View {
    private let textFieldCustomization = STDSTextFieldCustomization.defaultSettings()
    private let buttonCustomization = STDSButtonCustomization(backgroundColor: .systemBlue, cornerRadius: 8,titleStyle: .uppercase)
    private let textTitleCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 17))
    private let textBodyCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 12))
    private let selectCustomization = STDSSelectionCustomization.defaultSettings()
    private let footerCustomization = STDSFooterCustomization.defaultSettings()
    private let imageLoader = STDSImageLoader()
    @State private var selectedOptions: Set<String> = []
    @State private var selectedOption: String? = nil  // No option selected initially
    @State private var showMore1: Bool = false // State to control the visibility of extra content
    @State private var code: String = ""  // This will store the input code
    @State private var isToggled = false  // State variable for toggle

    @State private var showMore: Bool = false // State to control the visibility of extra content
    let response: STDSChallengeResponse

    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                   /* HStack (alignment: .center){
                        VStack {
                            Image("logoBank") // Remplacez "imageName" par le nom de votre image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        }   .background(Color.white) // Définir la couleur de fond blanche
                            .cornerRadius(10) // Pour ajouter un coin arrondi
                            .shadow(radius: 5) // Pour ajouter une ombre autour de la boîte
                        Spacer()
                        VStack {
                        Image("logo") // Remplacez "imageName" par le nom de votre image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        }   .background(Color.white) // Définir la couleur de fond blanche
                            .cornerRadius(10) // Pour ajouter un coin arrondi
                            .shadow(radius: 5)*/ // Pour ajouter une ombre autour de la boîte
                       /* if response.issuerImage != nil {
                        IssuerImageView(ImageURL: response.issuerImage?.mediumDensityURL)
                    } else {
                        EmptyView()
                    }
                    if response.paymentSystemImage != nil {
                    IssuerImageView(ImageURL: response.paymentSystemImage?.mediumDensityURL)
                } else {
                    EmptyView()
                }*/
                   // }
                   // .frame(maxWidth: .infinity, alignment: .center) // Centers the HStack content horizontally
                    if let header = response.challengeInfoHeader {
                        
                        
                        Text(header)
                            .bold()
                            .multilineTextAlignment(.leading) // Align to the right for multiline text
                       
                            .padding(.bottom, 5)
                            .font(Font(textTitleCustomization.headingFont))
                      
                    }
                    if let text = response.challengeInfoText {
                        
                        Text(text)
                            .multilineTextAlignment(.leading) // Align to the right for multiline text
                           
                            .padding(.bottom, 5)
                            .font(Font(textBodyCustomization.headingFont))
                      
                    }
                    if let label = response.challengeInfoLabel {
                        Text(label)
                            .multilineTextAlignment(.leading) // Align to the right for multiline text
                           
                            .padding(.bottom, 5)
                            .font(Font(textBodyCustomization.headingFont))
                      
                    }
                    HStack() {
                       
                                    TextField("••••••", text: $code)
                            
                            .font(.system(size: 14))
                                        .multilineTextAlignment(.leading)
                                        .keyboardType(.numberPad)  // Show numeric keypad
                                        .textContentType(.oneTimeCode)  // For autofill of OTP codes on iOS 12+
                                        
                                    
                                    // Clear icon (X) to reset the TextField
                        if !code.isEmpty {
                            Button(action: {
                                code = ""  // Clear the code when the icon is tapped
                            }) {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 22))


                            }
                        }
                                }
                                .frame(width: 250, height: 50)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .onChange(of: code) { newValue in
                                    // Limit to 6 digits
                                    if newValue.count > 6 {
                                        code = String(newValue.prefix(6))
                                    }
                                }
                    
                               
                
                    
                    VStack(alignment: .center){
                        
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
                        
                    
                        if( response.resendInformationLabel != nil)
                        {
                            Button(action: {
                                // Handle submit action
                            }) {
                                Text(response.resendInformationLabel ?? "")
                                    .padding()
                                    .font(.system(size: 12))
                                    .font(Font(textBodyCustomization.headingFont))

                                    .foregroundColor(.blue)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center) // Centers the HStack content horizontally
                    if(response.whitelistingInfoText != nil)
                    {
                        Button(action: {
                            isToggled.toggle()
                        }  ) {
                            HStack {
                                
                                Image(systemName: isToggled ? "checkmark.square.fill" : "square")
                                    .foregroundColor(isToggled ? .blue : .gray) // Checkmark in white when selected, box in blue when not selected
                                    .clipShape(RoundedRectangle(cornerRadius: 5)) // Optional: if you want rounded corners for the box
                                    .font(.system(size: 23)) // Adjust size as needed
                                
                                
                                Text(response.whitelistingInfoText!)
                                    .font(Font(textBodyCustomization.headingFont))
                                    .font(.system(size: 13))
                            }
                            .padding(.bottom, 5)
                        }
                        
                        .buttonStyle(PlainButtonStyle())
                    }
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
                                .foregroundColor(.white )

                                .padding(.bottom, 5)
                                .font(.system(size: 12))
                            
                        }
                        
                        
                    }
                    .padding(.all, 10)
                    if showMore {
                        HStack{
                            Text(response.whyInfoText ?? "")
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(nil)  // Allow unlimited lines
                                .multilineTextAlignment(.leading)  // Align the text to the left
                                .font(.system(size: 12))
                                .padding()
                        }
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
                                .foregroundColor( .white )
                                .padding(.bottom, 5)
                                .font(.system(size: 12))
                            
                        }
                        
                        
                    }
                    .padding(.all, 10)
                    if showMore1 {
                        Text(response.expandInfoText ?? "")
                            .fixedSize(horizontal: false, vertical: true)  // Allow the text to wrap and grow vertically
                            .lineLimit(nil)  // Allow unlimited lines
                            .multilineTextAlignment(.leading)  // Align the text to the left
                            .font(.system(size: 12))
                            .padding()
                    }
                    
                   
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .frame(maxWidth: .infinity, alignment: .leading) // Aligns VStack content to the left
            }
        }
        
    }}
