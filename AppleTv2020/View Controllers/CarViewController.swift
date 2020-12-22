//
//  CarViewController.swift
//  Marium_FinalExam2020
//
//  Created by Xcode User on 2020-12-12.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class CarViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate  {
    
    
    let carData = CarDetails()
    @IBOutlet var collectionViewCar : UICollectionView!
    @IBOutlet var myCollection : UICollectionView!
     var timer : Timer!
    let reuseIdentifier = "FeaturedCell"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.refreshTable), userInfo: nil, repeats: true);
        
        carData.jsonParser()
    }
    
    @objc func refreshTable(){
        if(carData.dbData != nil)
        {
            if (carData.dbData?.count)! > 0
            {
                self.myCollection.reloadData()
                self.timer.invalidate()
            }
        }
    }

    func CollectionView(collectionView : UICollectionView, layout collectionViewLayout : UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 50
    }
    
    func CollectionView(collectionView : UICollectionView, layout collectionViewLayout : UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout : UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0 , left: 50.0 , bottom: 0.0, right:50.0)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if carData.dbData != nil {
            return(carData.dbData?.count)!
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        carData.getDataFromJson(selected: indexPath.row)
        let alertController = UIAlertController(title: carData.year , message: carData.colour, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel" , style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == self.collectionViewCar)  {
            let cell : CarItemsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CarItemsCollectionViewCell
            
            let row = indexPath.row
            let rowData = (carData.dbData?[row])! as NSDictionary
            
            let imageFileName = carData.carsImg[indexPath.row]
            cell.featuredImage.image = UIImage(named: imageFileName)
            cell.lblCar.text = carData.carMake[indexPath.row]
         
            return cell
        }
        return UICollectionViewCell()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
