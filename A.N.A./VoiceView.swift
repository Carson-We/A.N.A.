//
//  VoiceView.swift
//  A.N.A.
//
//  Created by TSZ SAN WU on 11/5/23.
//

import SwiftUI
import AVFoundation

struct VoiceView: View {
    @State private var currentIndex = 0
    @State private var sentences: [String] = []
    
    var body: some View {
        VStack {
            Text(sentences[currentIndex])
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            HStack {
                Button(action: {
                    changeSentence(by: -1)
                }) {
                    Text("Previous")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .disabled(currentIndex == 0)
                
                Button(action: {
                    changeSentence(by: 1)
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .disabled(currentIndex == sentences.count - 1)
            }
        }
        .onAppear {
            loadSentences()
        }
    }
    
    func changeSentence(by offset: Int) {
        let newIndex = currentIndex + offset
        if newIndex >= 0 && newIndex < sentences.count {
            currentIndex = newIndex
        }
    }
    
    func loadSentences() {
        guard let fileURL = Bundle.main.url(forResource: "sentences", withExtension: "txt") else {
            return
        }
        
        do {
            let contents = try String(contentsOf: fileURL, encoding: .utf8)
            sentences = contents.components(separatedBy: .newlines).filter { !$0.isEmpty }
        } catch {
        }
    }
}
