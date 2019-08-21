//
//  ViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 15/08/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var tvSummary: UITextView!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivPoster.image = UIImage(named: movie.image)
        lbTitle.text = movie.title
        lbDuration.text = movie.duration
        lbCategories.text = movie.categories
        tvSummary.text = movie.summary
        lbRating.text = "⭐️ \(movie.rating)/10"
        
        /*
        ivToy.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        ivToy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
        "H:|-0-ivToy-0-lbToy-0|"
        
        super.viewDidLoad()
        
        let 🐶 = "Belinha"
        let 🐕 = "Lara"
        let 💩 = "Cocô"
        
        print("A \(🐶) e a \(🐕) fazem \(💩)")
        */
        
    }

    
}

