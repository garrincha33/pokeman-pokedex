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

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        mainImg.image = UIImage(named: "\(pokemon.pokemonId)")
        
        pokemon.downloadPokemonDetails {
            
            () -> () in
            
            
        }
 
    }

    
    @IBAction func backBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
