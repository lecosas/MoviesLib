//
//  UIViewController+Context.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 29/08/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
