//
//  CarDetails.swift
//  Marium_FinalExam2020
//
//  Created by Xcode User on 2020-12-12.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class CarDetails: NSObject {

    let carsImg = ["audi.png" , "Bentley.jpg" , "Acura.png" , "Ford.jpg"]
    var dataString : String = ""
    var dbData : [NSDictionary]?
    let myURL = "https://rameezm.dev.fast.sheridanc.on.ca/marium_car/sqlTojsoncar.php" as String
    
  
    
    let carModel = [
        "https://rameezm.dev.fast.sheridanc.on.ca/marium_car/sqlTojsoncar.php",
        "https://rameezm.dev.fast.sheridanc.on.ca/marium_car/sqlTojsoncar.php",
        "https://rameezm.dev.fast.sheridanc.on.ca/marium_car/sqlTojsoncar.php",
        "https://rameezm.dev.fast.sheridanc.on.ca/marium_car/sqlTojsoncar.php",
        "https://rameezm.dev.fast.sheridanc.on.ca/marium_car/sqlTojsoncar.php"]
    
    var year : String = ""
    var colour : String = ""
    
    func getDataFromJson( selected : Int)
    {
        
        if let url = NSURL(string: carModel[selected]) {
            
            if let data = NSData(contentsOf: url as URL){
                do {
                    
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                
                    let newDict = parsed as? NSDictionary
                    let car = newDict?["car"] as? NSDictionary
                    
              
                }
                catch let error as NSError {
                    
                    year = "A JSON parsing error occurred, here are the details: "
                    colour = error.description
                }
            }
        }
        
    }
    struct Car {
        
        let Make : String
        let Model : String
        let Year : String
        let Colour : String
        let NewOrUsed : String
        let Price : String
        
    }
    let carMake = ["Audi", "Bentley", "Acura", "Ford"]
    var cars = [Car]()
    
    enum JSONError: String, Error {
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }

    func jsonParser() {
        
        guard let endpoint = URL(string: myURL) else {
            print("Error creating endpoint")
            return
        }

          let request = URLRequest(url: endpoint)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(datastring!)
                self.dataString = datastring! as String
                
                guard let data = data else {
                    throw JSONError.NoData
                }
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary]
                    else {
                    throw JSONError.ConversionFailed
                }
                print(json)
                self.dbData = json
                
                
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
}
}






