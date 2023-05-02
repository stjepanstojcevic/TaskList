//
//  ContentView.swift
//  TaskList
//
//  Created by Stjepan Stojčević on 02.05.2023..
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    var searchBar : some View {
        HStack{
            TextField("Enter your task : ",text: self.$newToDo)
        }
    }
    var body: some View {
        NavigationView{
            VStack{
                List(self.taskStore.tasks){task in
                    Text(task.toDoItem)
                }.navigationBarTitle("Tasks")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
