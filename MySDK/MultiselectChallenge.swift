
import SwiftUI

// The reusable view component that represents your form
struct MultiSelectChallengeView: View {
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
    let response: STDSChallengeResponse
    var onClose: () -> Void
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                   
                    Text("Multi Select Challenge")
                        .padding()
                    
                    Button(action: {
                        onClose()
                    }) {
                        Text("Close")
                            .padding()
                        
                    }
                    
                    
                } .frame(width: .infinity, alignment: .trailing)
                
                
                
                Divider() // Optional Divider
                ScrollView {
                    VStack {
                        VStack(alignment: .leading) {
                            
                            Text(response.challengeInfoHeader ?? "Security Challenge")
                                .bold()
                                .padding(.bottom, 5)
                                .font(Font(textTitleCustomization.headingFont))
                            
                            Text(response.challengeInfoText ?? "")
                                .padding(.bottom, 10)
                                .font(Font(textBodyCustomization.headingFont))
                            
                            Text(response.challengeInfoLabel ?? "")
                                .font(Font(textBodyCustomization.headingFont))
                                .padding(.bottom, 2)
                            
                            // Iterate through the options
                            ForEach(response.challengeSelectInfo ?? [], id: \.value) { option in
                                MultiSelectRow(option: option,
                                               selectCustomization: selectCustomization,
                                               textBodyCustomization: textBodyCustomization,
                                               isSelected: selectedOptions.contains(option.value)) {
                                    toggleSelection(option.value)
                                }
                            }
                            
                            // Submit Button
                            Button(action: submitSelection) {
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
                        }
                        .padding(.trailing, 20)
                        .padding(.leading, 20)
                        
                        // Footer Section with expandable content
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
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
                                    
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 5)
                                        .font(Font(textBodyCustomization.headingFont))
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            
                            if showMore {
                                Text(response.whyInfoText ?? "")
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .font(Font(textBodyCustomization.headingFont))
                                
                            }
                        }
                        .background(Color(footerCustomization.backgroundColor))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    
                    
                    
                }
                
            }
            
        }
    }
    func toggleSelection(_ value: String) {
           if selectedOptions.contains(value) {
               selectedOptions.remove(value)
           } else {
               selectedOptions.insert(value)
           }
       }
    func submitSelection() {
       print("Selected options: \(selectedOptions.joined(separator: ", "))")
   }
}
struct MultiSelectRow: View {
    let option: STDSChallengeResponseSelectionInfo
    
   
    let selectCustomization : STDSSelectionCustomization
    let textBodyCustomization : STDSLabelCustomization
    let isSelected: Bool
    let onToggle: () -> Void
    var body: some View {
        Button(action: onToggle) {
            HStack {
              
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                    .foregroundColor(isSelected ? Color(selectCustomization.primarySelectedColor) : Color(selectCustomization.unselectedBackgroundColor) )// Checkmark in white when selected, box in blue when not selected
                    .clipShape(RoundedRectangle(cornerRadius: 5)) // Optional: if you want rounded corners for the box
                        .font(.system(size: 23))
                    
                Text(option.name)
                     .font(Font(textBodyCustomization.headingFont))
                    .padding(.bottom, 2)
               
            }
            .padding(.bottom, 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
