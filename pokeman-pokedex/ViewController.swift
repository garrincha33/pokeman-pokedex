//
//  ViewController.swift
//  pokeman-pokedex
//
//  Created by Richard Price on 18/03/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collection : UICollectionView!
    
    
    var pokemon = [Pokeman]()
    
    //----for filtered results
    
    var isInSearchMode = false
    var filteredPokemon = [Pokeman]()
    
     //----for filtered results
    
    var musicPlayer : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
      collection.delegate = self
      collection.dataSource = self
      searchBar.delegate = self
      searchBar.returnKeyType = UIReturnKeyType.Done
 
      initAudio()
      parsePokemonCSV()

    }
    
    func initAudio() {
        
        let path = NSBundle.mainBundle().pathForResource("pokemonmusic", ofType: "mp3")
        
        do {
            
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path!)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let err as NSError {
            
            print(err.debugDescription)
            
        }
        
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
            
            let poke : Pokeman!
            
            if isInSearchMode {
                
                poke = filteredPokemon[indexPath.row]
  
            } else {
                
                poke = pokemon[indexPath.row]
                
            }
            
            
        cell.configureCell(poke)
            
        return cell
            
            
        } else {
            
            return UICollectionViewCell()
            
        }

    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let poke = Pokeman!
        
        if isInSearchMode {
            
            poke = filteredPokemon[indexPath.row]
            
        } else {
            
            poke = pokemon[indexPath.row]
            
        }
        
        performSegueWithIdentifier("PokemonDetailVC", sender: poke)

    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isInSearchMode {
            
            return filteredPokemon.count
            
        }

        return pokemon.count
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(105, 105)
        
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            isInSearchMode = false
            view.endEditing(true)
            collection.reloadData()
 
        } else {
            
            isInSearchMode = true
            
            let lower =  searchBar.text!.lowercaseString
            
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(lower) != nil})
            collection.reloadData()
      
        }

    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        view.endEditing(true)
        
    }
    

    @IBAction func musicBtnPressed(sender: AnyObject) {
        
        if musicPlayer.playing {
            
            musicPlayer.stop()
            
        } else {
            
            musicPlayer.play()
            
        }

    }

}

