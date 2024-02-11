//
//  TrainView.swift
//  A.N.A.
//
//  Created by TSZ SAN WU on 11/7/23.
//

//
//  ConversationView.swift
//  A.N.A.
//
//  Created by TSZ SAN WU on 11/5/23.
//

import SwiftUI

struct CreateView: View {
    @State private var name = ""
    @State private var bio = ""
    @State private var isTrainViewActive = false
    
    var body: some View {
        VStack {
            Text("Create your own Autonomous Neural Avatar")
                .font(.title)
                .padding()
            
            VStack {
                TextField("Enter your avatar's name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Enter your avatar's bio", text: $bio)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    isTrainViewActive = true
                    print("Name: \(name)")
                    print("Bio: \(bio)")
                }) {
                    Text("Train")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isTrainViewActive) {
                    TrainView()
                    
                    Text("Creation and use of avatar is subject to our Terms of Service")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding()
                }
                .padding()
            }
        }
    }
}
