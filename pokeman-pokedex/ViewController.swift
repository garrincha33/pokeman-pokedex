//
//  ViewController.swift
//  pokeman-pokedex
//
//  Created by Richard Price on 18/03/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection : UICollectionView!
    
    var pokemon = [Pokeman]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      collection.delegate = self
      collection.dataSource = self
 
      parsePokemonCSV()
        
    
    }
    
    
    func parsePokemonCSV() {
        
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")
        
        do {
 
            let csv = try CSV(contentsOfURL: path!)
            
            let rows = csv.rows
            
            for row in rows {
                
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]
                
                let poke = Pokeman(name: name!, pokedex_Id: pokeId)
                pokemon.append(poke)
                
            }
            
        } catch let err as NSError {
            
            print(err.debugDescription)
            
        }

    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
        let poke = pokemon[indexPath.row]
            
        cell.configureCell(poke)
            
        return cell
            
            
        } else {
            
            return UICollectionViewCell()
            
        }
        
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 50
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(105, 105)
        
        
    }


}

