import UIKit
import WebKit

class CountryInfoViewController: UIViewController {
    var webView: WKWebView!
    var countryInformation: [String: String]!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = countryInformation["countryName"]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        guard countryInformation != nil else { return }
        
        if let continent = countryInformation["continent"] {
            if let population = countryInformation["population"] {
                if let currency = countryInformation["currency"] {
                    if let otherInformation = countryInformation["otherInformation"] {
                        var html = "<html>"
                        html += "<head>"
                        html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
                        html += "<style type=\"text/css\">"
                            html += "body { font-size: 150% } "
                            html += "bold { font-weight: bold }"
                        html += "</style>"
                        html += "</head>"
                        html += "<body>"
                            html += "<bold>Continent:</bold> " + continent + "<br>" + "<bold>Population:</bold> " + population + "<br>" + "<bold>Currency:</bold> " + currency + "<br>" + "<bold>Other Information:</bold> " + otherInformation
                        html += "</body>"
                        html += "</html>"
                        webView.loadHTMLString(html, baseURL: nil)
                    }
                }
            }
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
