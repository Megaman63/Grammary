//
//  Example.swift
//  Grammary
//
//  Created by Сергей Гребеножко on 27/12/2018.
//  Copyright © 2018 Сергей Гребеножко. All rights reserved.
//

import Foundation

struct Example: Codable {
    let text: String
    
    init(text: String) {
        self.text = text
    }
}
