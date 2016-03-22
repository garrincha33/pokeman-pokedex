//
//  PokeCell.swift
//  pokeman-pokedex
//
//  Created by Richard Price on 18/03/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        
    }
    
    
    var pokemon: Pokeman!
    
    func configureCell(pokemon: Pokeman) {
        
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokemonId)")
   
        
    }
    
    

}
