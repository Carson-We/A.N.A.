//
//  SettingView.swift
//  A.N.A.
//
//  Created by Carson Wu on 2/11/24.
//

import SwiftUI
import UIKit

struct SettingView: View {
    var body: some View {
        VStack {
            Button(action: {
                openMailApp()
            }) {
                Text("Report Bug")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            
            Button(action: {
                openWebsite()
            }) {
                Text("About Developer")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }

    func openMailApp() {
        let recipient = "carson.developer1125@gmail.com"
        let subject = "Bug Report"
        let deviceModel = getDeviceModel()
        let operatingSystem = getOperatingSystem()
        let body = "Device Model: \(deviceModel)\nOperating System: \(operatingSystem)\n\nPlease provide further info/screenshots on what happened."

        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        let mailtoLink = "mailto:\(recipient)?subject=\(subjectEncoded)&body=\(bodyEncoded)"

        if let url = URL(string: mailtoLink) {
            UIApplication.shared.open(url)
        }
    }

    func getDeviceModel() -> String {
        let deviceModel: String

        if UIDevice.current.userInterfaceIdiom == .pad {
            deviceModel = "iPad"
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            deviceModel = "iPhone"
        } else {
            deviceModel = "Unknown"
        }

        return deviceModel
    }

    func getOperatingSystem() -> String {
        let operatingSystem: String
        let systemName = UIDevice.current.systemName
        let systemVersion = UIDevice.current.systemVersion

        operatingSystem = "\(systemName) \(systemVersion)"

        return operatingSystem
    }
    
    func openWebsite() {
        if let url = URL(string: "https://carson1125.com") {
            UIApplication.shared.open(url)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
