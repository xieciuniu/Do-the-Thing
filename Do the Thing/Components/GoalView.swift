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
    @State var showDetailsGoal: [UUID] = []
    @State var doneTasks: [UUID] = []
    // rotation of show task button
    @State private var rotation = false
    
    var body: some View {
        List{
            
            Section {
                ForEach(goals.goals) { goal in
                    HStack(){
                        Text(goal.name)
                            .bold()
                            .onTapGesture {}
                        
                        Button(action: {
                            showHideTasks(id: goal.id )
                            
                        } , label: {
                            Image(systemName: "chevron.forward")
                                .rotationEffect(.degrees(showDetailsGoal.contains(goal.id) ? 90.0 : 0.0))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        })
                        .padding(.leading)
                        .padding(.trailing)
                        
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 9.0)
                                .opacity(0.3)
                                .foregroundStyle(Color.gray)
                                .frame(height: 40)
                            
                            Circle()
                                .trim(from: 0.0, to: CGFloat(countTaskComplition(tasks: goal.tasks)))
                                .stroke(style: StrokeStyle(lineWidth: 9.0, lineCap: .round, lineJoin: .round))
                                .foregroundStyle(Color.blue)
                                .rotationEffect(.degrees(-90))
                                .frame(height: 40)
                            
                        }
                        
                        
                    }
                    
                    
                    if showDetailsGoal.contains(goal.id) {
                        ForEach(goal.tasks) { task in
                            
                            Text("    " + task.name)
                                .strikethrough(doneTasks.contains(task.id))
                                .onTapGesture {
                                    if let goalId = goals.goals.firstIndex(where: {$0.id == goal.id }) {
                                        if let taskId = goals.goals[goalId].tasks.firstIndex(where: {$0.id == task.id }) {
                                            goals.goals[goalId].tasks[taskId].isDone.toggle()
                                        }
                                    }
                                    if doneTasks.contains(task.id) {
                                        withAnimation {
                                            doneTasks.removeAll(where: { $0 == task.id })
                                        }
                                    } else {
                                        withAnimation {
                                            doneTasks.append(task.id)
                                        }
                                    }
                                    
                                }
                            
                        }
                    } else {}
                }
            }
            
//            Text(String(refresh))
            
            Button(action: {
                let twoGoals = Goal()
                twoGoals.name = "dodac cos"
                twoGoals.showTasks = true
                let zadanie = Task(name: "nextOne", isDone: false)
                twoGoals.tasks = [Task(name: "zrobic", isDone: true), Task(name: "nie zrobic", isDone: false)]
                twoGoals.tasks.append(zadanie)
                goals.goals.append(twoGoals)
            }, label: {
                Text("Button")
            })
        }
    }
    
    func showHideTasks(id: UUID) {
        if showDetailsGoal.contains(id) {
            withAnimation(.spring) {
                showDetailsGoal.removeAll(where: { $0 == id })
            }
        } else {
            withAnimation {
                showDetailsGoal.append(id)
                doneTasks.append(id)
            }
        }
        
        
    }
    
    func countTaskComplition(tasks: [Task]) -> Double {
        let doneTasks = tasks.filter{ $0.isDone }.count
        return 1.0 / Double(tasks.count) * Double(doneTasks)
    }
    
    func synch(goal: Goal) {
//        var add: [UUID] = []
//        ForEach(goal.tasks.filter { $0.isDone }) { task in
//            let add = task.id
//            doneTasks.append(goal.id)
//        }
    }
    
    init() {}
}

#Preview {
    GoalView()
}
