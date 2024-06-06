//
//  ContentView.swift
//  Do the Thing
//
//  Created by Hubert Wojtowicz on 06/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section (header: Text("Main goal")) {
                    Text("Hello World!")
                }
            }
            .navigationTitle("Do the Thing")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
