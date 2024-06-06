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
    
    var body: some View {
        List{
//            Section{
//                Text(oneGoal.name)
//                    .bold()
//                    
//                Text("    " + oneGoal.tasks[0].name)
//                    .strikethrough(oneGoal.tasks[0].isDone)
//                Text("    " + oneGoal.tasks[1].name)
//                    .strikethrough(oneGoal.tasks[1].isDone)
//            }
            
            Section {
                ForEach(goals.goals) { goal in
                    Text(goal.name)
                        .bold()
                        .onTapGesture {
                            goals.showTasks(at: goal.id)
                        }
                    if goal.showTasks {
                        ForEach(goal.tasks) { task in
                            Text("    " + task.name)
                                .strikethrough(task.isDone)
                        }
                    } else {}
                }
            }
            
            Button(action: {
                var twoGoals = Goal()
                twoGoals.name = "dodac cos"
                twoGoals.tasks = [Task(name: "zrobic", isDone: true), Task(name: "nie zrobic", isDone: false)]
                goals.goals.append(twoGoals)
            }, label: {
                Text("Button")
            })
        }
    }
}

#Preview {
    GoalView()
}
