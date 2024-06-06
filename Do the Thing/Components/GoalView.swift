//
//  GoalView.swift
//  Do the Thing
//
//  Created by Hubert Wojtowicz on 06/06/2024.
//

import SwiftUI

struct GoalView: View {
    var oneGoal = Goal()
    @StateObject private var goals = Goals()
    // variable to contain UUID of goals that will show tasks
    @State var showDetails: [UUID] = []
    
    var body: some View {
        List{
            
            Section {
                ForEach(goals.goals) { goal in
                    Text(goal.name)
                        .bold()
                        .onTapGesture {
                            showHideTasks(id: goal.id )
                        }
                    if showDetails.contains(goal.id) {
                        ForEach(goal.tasks) { task in
                            Text("    " + task.name)
                                .strikethrough(task.isDone)
                        }
                    } else {}
                }
            }
            
//            Text(String(refresh))
            
            Button(action: {
                let twoGoals = Goal()
                twoGoals.name = "dodac cos"
                twoGoals.showTasks = true
                twoGoals.tasks = [Task(name: "zrobic", isDone: true), Task(name: "nie zrobic", isDone: false)]
                goals.goals.append(twoGoals)
            }, label: {
                Text("Button")
            })
        }
    }
    
    func showHideTasks(id: UUID) {
        if showDetails.contains(id) {
            showDetails.removeAll(where: { $0 == id })
        } else {
            showDetails.append(id)
        }
    }
}

#Preview {
    GoalView()
}
