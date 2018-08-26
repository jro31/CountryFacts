
import UIKit

class ViewController: UITableViewController {
    
    var countries = [[String: String]]()
    var numberOfCountries = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select country"
        
        if let jsonPath = Bundle.main.path(forResource: "Countries", ofType: "json") {
            
            if let data = try? String(contentsOfFile: jsonPath) {
                
                let json = JSON(parseJSON: data)
                
                parse(json: json)
                
            } else {
                print("Unable to get contents of JSON file")
            }
        }

    }
    
    func parse(json: JSON) {
        for result in json.arrayValue {
            let countryName = result["countryName"].stringValue
            var continent = result["continent"].stringValue
            var population = result["population"].stringValue
            var currency = result["currency"].stringValue
            var otherInformation = result["otherInformation"].stringValue
            
            if continent == "" { continent = "Information not available" }
            if population == "" { population = "Information not available" }
            if currency == "" { currency = "Information not available" }
            if otherInformation == "" { otherInformation = "There is nothing else to know about this country" }
            
            let obj = ["countryName": countryName, "continent": continent, "population": population, "currency": currency, "otherInformation": otherInformation]
            
            countries.append(obj)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfCountries = countries.count
        return numberOfCountries
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        
        cell.textLabel?.text = countries[indexPath.row]["countryName"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CountryInfoViewController()
        vc.countryInformation = countries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

