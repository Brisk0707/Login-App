//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Combine
import UIKit

final class UserManager: ObservableObject {
    @Published var isRegister = UserDefaults.standard.bool(forKey: "userIsRegister")
    var name = UserDefaults.standard.string(forKey: "userName")
    init(){}
}
