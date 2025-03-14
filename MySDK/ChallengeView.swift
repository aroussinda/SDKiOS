import SwiftUI
import WebKit

// MARK: - ViewModel for Challenge Responses





struct ChallengeResponseView: View {
    private let textFieldCustomization = STDSTextFieldCustomization.defaultSettings()
    private let buttonCustomization = STDSButtonCustomization(backgroundColor: .systemBlue, cornerRadius: 8,titleStyle: .uppercase)
    private let textTitleCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 17))
    private let textBodyCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 12))
    private let selectCustomization = STDSSelectionCustomization.defaultSettings()
    
    private let footerCustomization = STDSFooterCustomization.defaultSettings()
    private let imageLoader = STDSImageLoader()

    
    let response: STDSChallengeResponse
    @Environment(\.presentationMode) var presentationMode  // Pour fermer la sheet
  

    var body: some View {
        switch response.acsUIType {
        case .html:
            if let html = response.acsHTML {
                
            }
       // case .multiSelect:
            /*MultiSelectChallengeView(selectCustomization: selectCustomization, textBodyCustomization: textBodyCustomization, response: response, textTitleCustomization: textTitleCustomization, buttonCustomization: buttonCustomization, footerCustomization: footerCustomization)*/
       // case .oob:
            /*oobChallengeView(selectCustomization: selectCustomization, textBodyCustomization: textBodyCustomization, response: response, textTitleCustomization: textTitleCustomization, buttonCustomization: buttonCustomization, footerCustomization: footerCustomization )*/
       // case .singleSelect:
          /*  SingleSelectChallengeView(selectCustomization: selectCustomization, textBodyCustomization: textBodyCustomization, response: response, textTitleCustomization: textTitleCustomization, buttonCustomization: buttonCustomization, footerCustomization: footerCustomization)*/
       // case .text:
          /*  TextChallengeView(selectCustomization: selectCustomization, textBodyCustomization: textBodyCustomization, response: response, textTitleCustomization: textTitleCustomization, buttonCustomization: buttonCustomization, footerCustomization: footerCustomization)*/
        default:
            // Handle any unexpected cases
            Text("Unhandled STDSACSUIType case")
                .foregroundColor(.red)
    
        
        }
        
    }
      
}



// MARK: - WebView for HTML Challenges
/*struct WebView: UIViewRepresentable {
    let htmlContent: String
    let buttonColor: String  // Hex color as a string (e.g., "#FF5733")
    let logoImageName: String // Nom du fichier image local
 
    func makeUIView(context: Context) -> WKWebView {
       
        let webView = WKWebView()
        webView.loadHTMLString(htmlContent, baseURL: nil)
        
      /*  if let base64String = convertImageToBase64(named: "logo") , let base64String2 = convertImageToBase64(named: "logo") {
          
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let jsCode = """
                              document.querySelector('.button.primary').style.backgroundColor = '\(buttonColor)';
                              document.querySelector('.logo-ul').style.backgroundImage = 'url(data:image/png;base64,\(base64String))';
                              document.querySelector('.logo-bank').style.backgroundImage = 'url(data:image/png;base64,\(base64String2))';
                              """
                webView.evaluateJavaScript(jsCode, completionHandler: nil)
            }
        }*/
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
   /* public func convertImageToBase64(named imageName: String) -> String? {
        guard let uiImage = UIImage(named: imageName),
              let imageData = UIImagePNGRepresentation(uiImage) else {
            return nil
        }
        return imageData.base64EncodedString()
    }*/


}*/
