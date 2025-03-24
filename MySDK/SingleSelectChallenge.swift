//
//  singleselect.swift
//  3DSExemple
//
//  Created by Sinda Arous on 10/03/2025.
//


import SwiftUI

// The reusable view component that represents your form
struct SingleSelectChallengeView: View {
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
    private let navigationCustomization = STDSNavigationBarCustomization.defaultSettings()

    @State private var showMore: Bool = false // State to control the visibility of extra content
    let response: STDSChallengeResponse
    var onClose: () -> Void
    var body: some View {
        
        NavigationView{
            VStack {
                HStack{
                
                  
                    
                    Button(action: {
                        onClose()
                    }) {
                        Text("Close")
                            .padding()
                        
                    }
                    
                    
                } .frame(width: .infinity, alignment: .trailing)
                
                
                
                Divider() // Optional Divider
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(response.challengeInfoHeader ?? "Security Challenge")
                            .bold()
                            .padding(.bottom, 5)
                            .font(Font(textTitleCustomization.headingFont))
                        Text(response.challengeInfoText ?? "")
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)  // Allow the text to wrap and grow vertically
                        
                        
                            .multilineTextAlignment(.leading) // Align to the right for multiline text
                        
                            .padding(.bottom, 5)
                            .font(Font(textBodyCustomization.headingFont))
                        
                        
                        ForEach(response.challengeSelectInfo ?? [], id: \.value) { option in
                            Button(action: {
                                selectedOption = option.value
                            }) {
                                HStack {
                                    Image(systemName: selectedOption == option.value ? "circle.fill" : "circle")
                                        .foregroundColor(.blue)
                                    Text(option.name)
                                        .foregroundColor(.white)
                                    
                                }
                                .padding()
                                
                            }
                            
                        }
                        Button(action: {
                            
                        }) {
                            Text(buttonCustomization.formatTitle(response.oobContinueLabel ?? "Next", style: buttonCustomization.titleStyle))
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
                            HStack{
                                Text(response.whyInfoText ?? "")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .font(Font(textBodyCustomization.headingFont))
                                
                                
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
                                    .foregroundColor( .white)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 5)
                                    .font(Font(textBodyCustomization.headingFont))
                            }
                        }
                        .padding(.all, 10)
                        if showMore1 {
                            Text(response.expandInfoText ?? "")
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .font(Font(textBodyCustomization.headingFont))
                            
                            
                            
                        }
                        
                    }
                    
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
        }}
    
}
