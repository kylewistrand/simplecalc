//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args.count < 2 {
            // print("Not valid input")
            return 0
        }
        
        switch args.last {
        case "count":
            return args.count - 1
        case "avg":
            var sum = 0
            for num in args{
                if Int(num) != nil {
                    sum += Int(num)!
                }
            }
            return sum / (args.count - 1)
        case "fact":
            // Inspiration from https://stackoverflow.com/a/46805669
            var sum = 1
            for i in (1...Int(args[0])!) {
                sum *= i
            }
            return sum
        default:
            switch args[1] {
            case "+":
                return Int(args[0])! + Int(args[2])!
            case "-":
                return Int(args[0])! - Int(args[2])!
            case "/":
                return Int(args[0])! / Int(args[2])!
            case "%":
                return Int(args[0])! % Int(args[2])!
            case "*":
                return Int(args[0])! * Int(args[2])!
            default:
                return Int(args[0])!
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

