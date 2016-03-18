//
//  Pokeman.swift
//  pokeman-pokedex
//
//  Created by Richard Price on 18/03/2016.
//  Copyright © 2016 twisted echo. All rights reserved.
//

import Foundation

class Pokeman {
    
    private var _name: String!
    private var _pokedexId: Int!
  
    var name : String {
        
        return _name
        
    }
    
    var ID : Int {
        
        return _pokedexId
        
    }
    
    init(name: String, pokedex_Id: Int) {
        
        self._name = name
        self._pokedexId = pokedex_Id

        
    }
    
    
}
