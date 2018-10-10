//
//  StructsEnums.swift
//  Fancy Calculator
//
//  Created by Vayunandan reddy Kunduru on 10/10/18.
//  Copyright © 2018 Vayunandan reddy Kunduru. All rights reserved.
//

import Foundation

enum Operator: String{
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String{
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
