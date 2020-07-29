//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
            
            Button(action: registerUser) {
                HStack {
                    if name.count < 3 {
                        HStack {
                            Image(systemName: "checkmark.circle").disabled(true)
                            Text("ОК")
                                .disabled(true)
                        }.frame(width: 280)
                        Text("\(name.count)")
                            .foregroundColor(.red)
                    } else {
                        HStack {
                            Image(systemName: "checkmark.circle")
                            Text("ОК")
                        }.frame(width: 280)
                        Text("\(name.count)")
                        .foregroundColor(.green)
                    }
                }
            }
        }
        .padding()
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister = true
            UserDefaults.standard.set(self.name, forKey: "userName")
            UserDefaults.standard.set(user.isRegister, forKey: "userIsRegister")
        }
    }

}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
    
}
