//
//  ArmazenamentoDados.swift
//  App Minhas Viagens
//
//  Created by Henrique Silva on 12/11/20.
//

import UIKit

class ArmazenamentoDados{
    
    let chaveArmazenamento = "localViagem"
    var viagens: [Dictionary<String, String>] = []
    
    func getDefaults() -> UserDefaults{
        return UserDefaults.standard
    }
    
    func salvarViagens(viagem: Dictionary<String, String> ){
        viagens = listarViagens()
        viagens.append(viagem)
        getDefaults().setValue(viagens, forKey: chaveArmazenamento)
        getDefaults().synchronize()
        
    }
    
    func listarViagens() -> [Dictionary<String, String>]{
        let dados = getDefaults().object(forKey: chaveArmazenamento)
        if dados != nil{
            return dados as! Array
        }else{
            return []
        }
    }
    
    func removerViagem(indice: Int) {
        viagens = listarViagens()
        viagens.remove(at: indice)
        getDefaults().setValue(viagens, forKey: chaveArmazenamento)
        getDefaults().synchronize()
        
    }
    
}
