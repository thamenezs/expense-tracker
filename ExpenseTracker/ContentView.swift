//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Thais Souza on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .font(.title2)
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            
            .background(Color.backgroundColor)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.iconColor, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
