//
//  ViewModelList.swift
//  MVVMTano
//
//  Created by admin on 2/2/21.
//

import Foundation

class ViewModelList {
    
    // CREAR MECANISMO PARA ENLAZAR LO QUE SERIA LA VISTA CON ESTE MODELO DE LA VISTA
    var refreshData = { () -> () in }
    
    // FUENTE DE DATOS (ARRAY)
    var dataArray : [List] = [] {
        didSet {
            refreshData()
        }
    }
    
    // NO DEBERIA IR AQUI!! HABRIA QUE CREAR UNA CAPA DE CONEXION PARA HACER ESTE TIPO DE COSAS E INSTANCIAR DESDE AQUI EL OBJETO DE CAPA DE CONEXION
    
    // OBTENER DATOS DE LA API
    func retriveDataList() {
        
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let json = data else { return }
            
            //SEREALIZAR LOS DATOS
            do {
                let decoder = JSONDecoder()
                self.dataArray = try decoder.decode([List].self, from: json)
            } catch let error{
                print("Ha ocurrido un error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
