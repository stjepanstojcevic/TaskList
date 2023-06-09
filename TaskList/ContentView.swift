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
            Image(systemName: "pencil.line")
                        .foregroundColor(.red)
            Button(action: self.addNewToDo,label: {Text("Add New")})
        }
    }
    func addNewToDo(){
        taskStore.tasks.append(Task(id:String(taskStore.tasks.count+1),toDoItem: newToDo))
        self.newToDo=""
    }
    
    var body: some View {
    
            NavigationView{
                
                
                VStack{
                    searchBar.padding()
                   
                    List{
                        
                        ForEach(self.taskStore.tasks){
                            task in
                            Text(task.toDoItem)
                        }.onMove(perform: self.move)
                            .onDelete(perform: self.delete)
                    }.navigationBarTitle("Today's tasks", displayMode: .large)
                        .foregroundColor(.red)
                        .navigationBarItems(trailing: EditButton())
                        .navigationBarHidden(false)
                        .foregroundColor(.red)

                    
                    HStack{
                        
                        Image(systemName: "eraser.line.dashed.fill")
                            .foregroundColor(.red)
                        Button(action: self.removeAll,label: {Text("Clear all")})
                        Image(systemName: "eraser.line.dashed.fill")
                            .foregroundColor(.red)
                        
                    }
                }
            }
    }
    func move(from source : IndexSet, to destination : Int)
    {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets : IndexSet)
    {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    func removeAll()
    {
        taskStore.tasks.removeAll()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
