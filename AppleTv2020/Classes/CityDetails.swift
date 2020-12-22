//
//  CityDetails.swift
//  Marium_FinalExam2020
//
//  Created by Xcode User on 2020-12-12.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class CityDetails: NSObject {
    var dbData : [NSDictionary]?
    let myURL = "https://rameezm.dev.fast.sheridanc.on.ca/marium_city/sqlToJsoncity.php" as String
    
    let cityNames = ["Toronto", "Montreal", "Vancouver", "San Francisco", "New York City"]
    let imgCity = ["toronto.jpg" , "Montreal.jpg" , "Vancouver.jpg" , "SanFrancisco.jpg" , "Nyc.jpg"]
    
    var title : String = ""
    var summary : String = ""
       var dataString1 : String = ""
    let cityLat = [
        43.653226,
        45.501689,
        5.638728,
        37.774929,
        40.712784]
    
    let cityLong = [
        -79.383184,
        -73.567256,
        -122.661486,
        -122.419416,
        -74.005941]
    
    func getDataFromJson( selected : Int)
    {
        if let url = NSURL(string: cityNames[selected]) {
       
            if let data = NSData(contentsOf: url as URL){
                do {
                
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                    
                    let newDict = parsed as? NSDictionary
                    let cityForecast = newDict?["currently"] as? NSDictionary
                    title = "\(cityForecast!["temperature"]!)"
                    
                    summary = "\(cityForecast!["summary"]!)"
                   
                }
                catch let error as NSError {
                    title = "A JSON parsing error occurred, here are the details: "
                    summary = error.description
                }
            }

        }
    }

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
                    let datastring1 = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print(datastring1!)
                    self.dataString1 = datastring1! as String
                    
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


