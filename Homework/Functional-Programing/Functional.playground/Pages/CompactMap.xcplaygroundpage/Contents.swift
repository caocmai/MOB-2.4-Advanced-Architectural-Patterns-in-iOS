//: [Previous](@previous)

import Foundation

//: # CompactMap
/*:
 For collections (Arrays, Strings, or Dictionaries) we can use
 `compactMap`. With `compactMap`, instead of flattening nested
 collection, you can flatten optionals inside a collection.
 
 This means you can filter nils out. Here's an example:
 */
let numbers = ["5", "42", "nine", "100", "😆"]
let result = numbers.compactMap({ Int($0) })

print(result) // [5, 42, 100]

//: #### Exercise 1
/*:
 Create a function that removes all vowels from a string. Use compactMap
 */
let test = "testing this out"
//let noVowels = test.map({ $0 }).compactMap({
//})
//print(noVowels)

func removeVowels(string: String) -> String {
    
    let vowelsList = ["e", "i", "o", "u", "a"]
    
    return String(string.compactMap({ vowel in
        if vowelsList.contains(String(vowel)) {
            return nil
        } else {
            return vowel
        }
    }))
    
}

print(removeVowels(string: test))
//: #### Exercise 2
/*:
 Generate values from 0 to 100, with only even numbers. And
 also skip every factor of ten.
 Expected result:
 
 `[2, 4, 6, 8, 12, 14, 16, 18, 22, 24, 26, 28]`
 */
func onlyEvens(n: Int) -> [Int] {
    var listNums = [Int]()
    for i in 1...n {
        listNums.append(i)
    }
//    let evenListAndNoTens = listNums.filter({ $0 % 2 == 0}).filter({ $0 % 10 != 0})
    
    var evensNoFactor10 = [Int]()
    
    evensNoFactor10 = listNums.compactMap({ num in
        if num % 2 != 0 {
            return nil
        } else if num % 10 == 0  {
            return nil
        } else {
            return num
        }
    })
    
    return evensNoFactor10
}

let test2 = (onlyEvens(n: 30))

print(test2)

//: [Next](@next)
