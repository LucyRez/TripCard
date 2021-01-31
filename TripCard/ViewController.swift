//
//  ViewController.swift
//  TripCard
//
//  Created by Ludmila Rezunic on 24.01.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, TripCollectionCellDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    private var trips = [
        Trip(tripId: "Cupertino01", city: "Cupertino", country:"USA", featuredImage:UIImage(named:"cupertino"), price: 999999, totalDays: 12, isLiked: false),
        Trip(tripId: "Paris001", city: "Paris", country: "France", featuredImage: UIImage(named: "paris"), price: 2000, totalDays: 5, isLiked: false),
        Trip(tripId: "London001", city: "London", country:"United Kingdom", featuredImage:UIImage(named:"london"), price: 1000, totalDays: 5, isLiked: false),
        Trip(tripId: "Disneyland", city: "Disneyland 🏰", country:"Orlando, USA", featuredImage:UIImage(named:"disneyland"), price: 1000, totalDays: 1, isLiked: false),
        Trip(tripId: "Istanbul001", city: "Istanbul", country:"Turkey", featuredImage:UIImage(named:"istanbul"), price: 2200, totalDays: 10, isLiked: false)
    ]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TripCollectionViewCell
        
        cell.delegate = self
        cell.cityLabel.text = trips[indexPath.row].city
        cell.countryLabel.text = trips[indexPath.row].country
        cell.imageView.image = trips[indexPath.row].featuredImage
        cell.isLiked = trips[indexPath.row].isLiked
        cell.priceLabel.text = "$\(String(trips[indexPath.row].price))"
        cell.totalDaysLabel.text = "\(String(trips[indexPath.row].totalDays))"
        cell.layer.cornerRadius = 4.0
        return cell
    }
    
    func didLikeButtonPressed(cell: TripCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell){
            trips[indexPath.row].isLiked = !trips[indexPath.row].isLiked
            cell.isLiked = trips[indexPath.row].isLiked
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.clear
        
        if UIScreen.main.nativeBounds.height <= 1334.0 {
            let flowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flowLayout.itemSize = CGSize(width: 250.0, height: 315.0)
        }
    }
   
}

