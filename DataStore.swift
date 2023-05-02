//
//  DataStore.swift
//  TaskList
//
//  Created by Stjepan Stojčević on 02.05.2023..
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable{
    var id = String()
    var toDoItem = String()
    
    
}

class TaskStore : ObservableObject{
    @Published var tasks = [Task]()
}
