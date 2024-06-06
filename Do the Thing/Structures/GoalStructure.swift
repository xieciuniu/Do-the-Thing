//
//  GoalStructure.swift
//  Do the Thing
//
//  Created by Hubert Wojtowicz on 06/06/2024.
//

import Foundation

struct Goal: Identifiable {
    var id = UUID()
    var name: String
    var tasks: [Task]
    var isMain: Bool
    
    // TODO: możliwie zmienić wyświetlenie podzadań
    var showTasks: Bool
    
//    TODO: start date, end date, priorytet
}

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var isDone: Bool
    
//    TODO: start, end date; priority; pojedynczy taks; powtarzalny task;
}

extension Goal {
    static var MOCK_GOALS: [Goal] = [
        .init(name: "Zrobić apke", tasks: [Task(name: "pierwszy widok", isDone: false), Task(name: "Drugi Widok", isDone: true)], isMain: true, showTasks: false),
        .init(name: "zrobić trening", tasks: [Task(name: "zrobic klate", isDone: true), Task(name: "zrobic plecy", isDone: false)], isMain: false, showTasks: false),
        .init(name: "zrobic obiad", tasks: [Task(name: "ugotowac ryż", isDone: false), Task(name: "usmazyvc kure", isDone: false)], isMain: false, showTasks: false)
    ]
    
    static var MOCK_GOAL: Goal = .init(name: "Zrobić apke", tasks: [Task(name: "pierwszy widok", isDone: false), Task(name: "Drugi Widok", isDone: true)], isMain: true, showTasks: false)
}
