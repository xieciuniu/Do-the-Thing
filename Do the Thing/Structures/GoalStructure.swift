//
//  GoalStructure.swift
//  Do the Thing
//
//  Created by Hubert Wojtowicz on 06/06/2024.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var isDone: Bool
    
//    TODO: start, end date; priority; pojedynczy taks; powtarzalny task;
}

class Goal: ObservableObject, Identifiable {
    var id = UUID()
    var name: String = ""
    @Published var tasks: [Task] = []
    var isMain: Bool = false
    
    // TODO: możliwie zmienić wyświetlenie podzadań
    var showTasks: Bool = false
    
//    TODO: start date, end date, priorytet
    

}

@MainActor class Goals: ObservableObject {
    @Published var goals: [Goal] = []
    
       
    func showTasks(at offsets: UUID) {
        if let goal = goals.first(where: { $0.id == offsets }) {
            goal.showTasks.toggle()
        }
    }
}


//extension Goal {
//    static var MOCK_GOALS: [Goal] = [
//        .init,
//        .init(name: "zrobić trening", tasks: [Task(name: "zrobic klate", isDone: true), Task(name: "zrobic plecy", isDone: false)], isMain: false, showTasks: true),
//        .init(name: "zrobic obiad", tasks: [Task(name: "ugotowac ryż", isDone: false), Task(name: "usmazyvc kure", isDone: false)], isMain: false, showTasks: false)
//    ]
//    
//    static var MOCK_GOAL: Goal = .init(name: "Zrobić apke", tasks: [Task(name: "pierwszy widok", isDone: false), Task(name: "Drugi Widok", isDone: true)], isMain: true, showTasks: false)
//}
