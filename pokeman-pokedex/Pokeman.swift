//
//  Pokeman.swift
//  pokeman-pokedex
//
//  Created by Richard Price on 18/03/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import Foundation
import Alamofire

class Pokeman {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonUrl: String!
    
 
    var name : String {
        
        return _name
        
    }
    
    var pokemonId : Int {
        
        return _pokedexId
        
    }
    
    init(name: String, pokedex_Id: Int) {
        
        self._name = name
        self._pokedexId = pokedex_Id
        
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"

        
    }
    
    //use own closure "download complete" empty closure which runs at runtime
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        
        
    }
    
    
}
