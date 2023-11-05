//
//  ConversationView.swift
//  A.N.A.
//
//  Created by TSZ SAN WU on 11/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isConversationActive = false
    @State private var isTrainActive = false

    var body: some View {
        NavigationView {
            VStack {
                Text("A.N.A.")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.indigo)
                
                Text("Create your own Autonomous Neural Avatar")
                
                Button(action: {
                    isTrainActive = true
                }) {
                    Text("Train")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isTrainActive) {
                    HStack {
                        Button(action: {
                            isConversationActive = true
                        }) {
                            Text("Conversation")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $isConversationActive) {
                            ConversationView()
                        }
                        
                        Button(action: {
                        }) {
                            Text("Voice")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $isConversationActive) {
                            Text("Voice Button Tapped")
                        }
                }
                }
                .padding(.top, 30)
            }
            .navigationTitle("Main")
        }
    }
}
