//
//  GoalView.swift
//  Do the Thing
//
//  Created by Hubert Wojtowicz on 06/06/2024.
//

import SwiftUI

struct GoalView: View {
    var oneGoal = Goal.MOCK_GOAL
    var goals = Goal.MOCK_GOALS
    
    var body: some View {
        List{
            Section{
                Text(oneGoal.name)
                    .bold()
                Text("    " + oneGoal.tasks[0].name)
                    .strikethrough(oneGoal.tasks[0].isDone)
                Text("    " + oneGoal.tasks[1].name)
                    .strikethrough(oneGoal.tasks[1].isDone)
            }
            
            Section {
                ForEach(goals) { goal in
                    Text(goal.name)
                        .bold()
                    ForEach(goal.tasks) { task in
                        Text("    " + task.name)
                            .strikethrough(task.isDone)
                    }
                }
            }
        }
    }
}

#Preview {
    GoalView()
}
