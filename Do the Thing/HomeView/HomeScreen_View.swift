//
//  HomeScreen_View.swift
//  Do the Thing
//
//  Created by Hubert Wojtowicz on 06/06/2024.
//

import SwiftUI

struct HomeScreen_View: View {
    var body: some View {
        NavigationStack {
            Text("Motivational Quole")
            
            List {
                Section (header: Text("Main goal!")) {
                    Text("Hello here!")
                }
                
                Section(header: Text("Goals")) {
                    Text("Another Goal1")
                    Text("Another Goal1")
                    Text("Another Goal1")
                    Text("Another Goal1")
                    
                }
                
                Section(header: Text("Next tasks")) {
                    Text("Next Task")
                    Text("Next Task")
                    Text("Next Task")
                    Text("Next Task")
                    Text("Next Task")
                }
            }
        }
    }
}

#Preview {
    HomeScreen_View()
}
