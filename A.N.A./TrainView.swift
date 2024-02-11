//
//  TrainView.swift
//  A.N.A.
//
//  Created by TSZ SAN WU on 11/9/23.
//

import SwiftUI

struct TrainView: View {
    @State private var isConversationViewActive = false
    @State private var isVoiceViewActive = false
    var body: some View {
        VStack{
            Button(action: {
                isConversationViewActive = true
            }) {
                Text("Conversation")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isConversationViewActive) {
                ConversationView()
            }
            
            Button(action: {
                isVoiceViewActive = true
            }) {
                Text("Voice")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isVoiceViewActive) {
                VoiceView()
            }
        }
    }
}

#Preview {
    TrainView()
}
