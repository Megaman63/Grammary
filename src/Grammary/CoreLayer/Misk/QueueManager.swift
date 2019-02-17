//
//  QueueManager.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

enum QueueManager {
    static func dispatchOnMain(block: @escaping CommonBlock) {
        if Thread.current.isMainThread {
            block()
        } else {
            DispatchQueue.main.async(execute: block)
        }
    }
}
