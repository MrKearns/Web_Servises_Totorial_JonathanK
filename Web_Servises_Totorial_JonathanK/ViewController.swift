//
//  ViewController.swift
//  Web_Servises_Totorial_JonathanK
//
//  Created by Jonathan Kearns on 2/22/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.231750,-88.333549") {
            if let data = NSData(contentsOf: url as URL) {
            
                do{
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
                    
                    let newDict = parsed
                    
                    
                    print(newDict["currently"]!["summary : icon"] as Any)
                    print(newDict["currently"]!["temperature"] as Any)
                    print(newDict["currently"]!["dewPoint"] as Any)
                    
                    self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!) °F"
                    self.currentSummary.text = "\(newDict["minutely"]!["summary"]!!)"
                    self.currentDewpoint.text = "\(newDict["currently"]!["dewPoint"]!!) °F"
                    
                    self.timezone.text = "\(newDict["timezone"]!)"
                    
//                    self.weatherIcon.image = UIImage(named: "\(newDict["minutely"]!["icon"]!!)")
                    
                }
                catch let error as NSError{
                    print("A JSON error acurred, here are the details:\n \(error)")
                }
            }
        }
    }
    
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBOutlet weak var currentSummary: UILabel!
    
    @IBOutlet weak var currentDewpoint: UILabel!
    
    @IBOutlet weak var timezone: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
}

