//
//  MenuView.swift
//  A.N.A.
//
//  Created by TSZ SAN WU on 11/7/23.
//

import SwiftUI

extension UIApplication {
    var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
}

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
            
            if let appVersion = UIApplication.shared.appVersion {
                Text("v\(appVersion)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
