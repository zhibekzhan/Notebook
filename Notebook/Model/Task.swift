//
//  Task.swift
//  Notebook
//
//  Created by zhibekzhaan on 9/18/23.
//

import Foundation

struct Task{
    var title: String
    var subTask: [SubTask]
    var isOpen: Bool = false
    var isCheck: Bool = false
}
