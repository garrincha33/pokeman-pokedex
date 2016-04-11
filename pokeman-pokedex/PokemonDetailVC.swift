//
//  PokemonDetailVC.swift
//  pokeman-pokedex
//
//  Created by Richard Price on 27/03/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokeman!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokemonId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails {
            
            () -> () in
            
            self.updateUI()
 
        }
 
    }
    
    func updateUI() {
        
      descriptionLbl.text = pokemon.description
      typeLbl.text = pokemon.type
      defenseLbl.text = pokemon.defense
      heightLbl.text = pokemon.height
      weightLbl.text = pokemon.weight
      baseAttackLbl.text = pokemon.attack
      pokedexLbl.text = "\(pokemon.pokemonId)"
        
        if pokemon.nextEvolutionId == "" {
            
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
            
        } else {
            
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutiontxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                
                str += " - LVL \(pokemon.nextEvolutionLvl)"
                
                evoLbl.text = str
                
            }
            
        }

    }

    
    @IBAction func backBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
