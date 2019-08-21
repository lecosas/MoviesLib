//
//  Movie.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 20/08/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String
    let categories: String
    let duration: String
    let rating: Double
    let summary: String
    let image: String
    
    /* Caso alguma propridade nao seja igual ao JSON
     Mesmo as propriedades que são iguais, é necessário colocar todas as propriedades
    enum CodingKeys: String, CondingKey {
        case summary = "movie_summary"
        case title
        case categories
        case duration
        case rating
        case image
    } */
    
    
}
