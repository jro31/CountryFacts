import UIKit

class ViewController: UITableViewController {
    
    var countries = [[String: String]]()
    var numberOfCountries = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select country"
        
        if let jsonPath = Bundle.main.path(forResource: "Countries", ofType: "json") {
            print("jsonPath: \(jsonPath)")
            
            if let data = try? String(contentsOfFile: jsonPath) {
                
                let json = JSON(parseJSON: data)
                print("json: \(json)")
                
                parse(json: json)
                
                print(countries)
                
            } else {
                print("Unable to get contents of JSON file")
            }
        }

    }
    
    func parse(json: JSON) {
        for result in json.arrayValue {
            let countryName = result["countryName"].stringValue
            let continent = result["continent"].stringValue
            let population = result["population"].stringValue
            let currency = result["currency"].stringValue
            
            let obj = ["countryName": countryName, "continent": continent, "population": population, "currency": currency]
            
            countries.append(obj)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCountries
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = "Country name"
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

