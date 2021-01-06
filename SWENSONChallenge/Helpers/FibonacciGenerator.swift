//
//  FibonacciGenerator.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import Foundation

class FibonacciGenerator {
    
    static func GenerateFibonacciValueFor(number : Int , UseIterative : Bool = true ) -> Int {
        if number < 91 {
            return UseIterative ? iterativeFibonacci(number) : recursiveFibonacci(n : number)
        }
        else {
            return 0
        }
    }

    static func iterativeFibonacci(_ n: Int) -> Int {
        var fibs: [Int] = [0, 1]
        (2...n).forEach { i in
            fibs.append(fibs[i - 1] + fibs[i - 2])
        }
        return fibs.last!
    }
    
    static func recursiveFibonacci( n :  Int,  val :  Int = 1,  prev :  Int = 0) -> Int
    {
        if(n == 0) {
            return prev
        }
        return recursiveFibonacci(n:n - 1,val: val+prev,prev: val)
    }
    
    
    static func benchmark(method: () -> Void) {
        let startTime = DispatchTime.now().uptimeNanoseconds
        method()
        let endTime = DispatchTime.now().uptimeNanoseconds

        let elapsedTime = Double(endTime - startTime) / 1e6
        print("Elapsed time: \(elapsedTime) milliseconds")
    }
    
}
