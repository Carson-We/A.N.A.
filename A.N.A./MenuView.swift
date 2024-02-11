//
//  MenuView.swift
//  A.N.A.
//
//  Created by TSZ SAN WU on 11/7/23.
//

import SwiftUI

struct MenuView: View {
    @State private var isSettingViewActive = false
    
    var body: some View {
        VStack {
            Button(action: {
                isSettingViewActive = true
            }) {
                Text("Setting")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isSettingViewActive) {
                SettingView()
            }
            
            Text("v0.1.0.1")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
        }
    }
}

struct SettingView: View {
    var body: some View {
        Text("Setting View")
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
