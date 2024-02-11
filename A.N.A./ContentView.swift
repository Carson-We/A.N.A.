//
//  ConversationView.swift
//  A.N.A.
//
//  Created by TSZ SAN WU on 11/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isCreateActive = false
    @State private var isMenuActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("A.N.A.")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.indigo)
                
                Text("Create your own Autonomous Neural Avatar")
                
                Button(action: {
                    isCreateActive = true
                }) {
                    Text("Create")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isCreateActive) {
                    CreateView()
                }
            }
            .navigationTitle("A.N.A.")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isMenuActive = true
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $isMenuActive) {
                MenuView()
            }
        }
    }
}
