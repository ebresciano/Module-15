//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func getChange(amount: Double) -> String {
  let amountInCents = Int(amount * 100)
    let dollars = amountInCents / 100
    let quarters = (amountInCents - dollars*100) / 25
    let dimes = (amountInCents - dollars*100 - quarters*25) / 10
    let nickels = (amountInCents - dollars*100 - quarters*25 - dimes*10) / 5
    let pennies = amountInCents % 5
    
    return "Your change is \(dollars) dollars, \(quarters) quarters, \(dimes) dimes, \(nickels) nickels, \(pennies), pennies."
    
  }
    print(getChange(19.95))
    
    