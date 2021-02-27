
import Foundation

//: # Map
//: #### Exercise 1
/*: Taking a collection of data to transform it is a common task any iOS dev must do.
 
Take for example an array of students and their attendance to a course.
*/
let attendance = [
    (name: "Adriana", sessions: 80),
    (name: "Mitchell", sessions: 10),
    (name: "Joi", sessions: 13),
    (name: "Ian", sessions: 14),
    (name: "Jess", sessions: 0),
]
/*:
How would you transform the data to present readable sentences of their status in the course stored in an array?
 
Take the following conditions:
- If a student has <12 they are at risk
- Any other case, they are on track
 
Expected result:
 
["Adriana is at risk", "Mitchell is at risk", "Joi is on track", "Ian is on track"]
*/
//Iterative version
var result = [String]()
for people in attendance {
    if people.sessions < 12 {
        result.append("\(people.name) is at risk")
    } else {
        result.append("\(people.name) is on track")

    }
    
}

//Functional version
let resultFuncMap = attendance.filter({$0.sessions < 12})
let resultFuncMapPass = attendance.filter({$0.sessions > 12})

let resultFunc = attendance.filter({$0.sessions < 12}).reduce(""){end, people in
    return end + people.name + "is at risk "
}
print(resultFunc)

var all = (resultFuncMap.map({ $0.name + "is at risk" }))

all.append(contentsOf: (resultFuncMapPass.map({$0.name + "is on rack"})))
print(all)
//resultFunc.reduce(""){end, people in
//    return end + people
//}

func checkMidTerm(attendence: [(name: String, sessions: Int)]) -> [String] {
//    return attendence.map{(name, sessions) -> String in
//        if sessions < 12 {
//            return "\(name) is at risk"
//        } else {
//            return "\(name) is on track"
//        }
//    }
    
    return attendence.map{ $0.sessions < 12 ? "\($0.name) is at risk" : "\($0.name) is on track"}
}

print(checkMidTerm(attendence: attendance))
/*:
 Now you need a function that takes students and their attendance and return only the session value, sorter and with zeros filtered out (most likely those students withdrew).
*/

//Functional approach, try chaining functions together with a pipeline.
let none0People = attendance.filter({$0.sessions > 0})
print(none0People)
func attendenceList(attendance: [(name: String, sessions: Int)]) -> [Int] {
    return attendance
        .map{ $0.sessions }
        .filter {$0 > 0}
        .sorted()
}

print(attendenceList(attendance: attendance))
//: #### Exercise 2
/*:
Create a function that transforms the values in a dictionary for books. Each rating needs to be turned into human readable format.
*/
let bookRatings: [String : Float] = ["Atomic Habits" : 5.0, "Getting Things Done" : 4.5, "Grit" : 4.0, "The Lean Startup" : 3.9]

let book = (bookRatings.filter({$0.value >= 5}))
//print(book.mapValues({ (text as NSString).substringWithRange($0) }))
print(book)

func apply<T, V>(fn: ([T]) -> V, arg: [T]) -> V {
    return fn(arg)
}

//func changeValue(a: [Int]) -> [String] {
//    return a.map({ if $0 > 0 {return String("yes")})
//}

var newBooks = [String:String]()
for (key, value) in bookRatings {
    if value >= 5 {
        newBooks[key] = "Excellent"
    }
}

print(newBooks)

func readableBooks(books: [String:Float] ) -> [String] {
    return books
        .map{ key, value in
            if value >= 5 {
            return "\(key) is Excellent"
            }
            else if value > 4 {
                return "\(key) is Good"
            } else {
                return "\(key) is Poor"
            }
        }

}

func test(rating: Float, book: String) -> String {
    switch rating {
    case ..<1: return "\(book) is Good"
    case ..<5: return "\(book) isAwioe"
    default:
        return "\(book) is Ok"
    }
}

let me = bookRatings.map({ test(rating: $0.value, book: $0.key)})
print(me)

print(readableBooks(books: bookRatings))
 
//: #### Exercise 3
/*:
The following code gets the street and city and cleans up the strings. See if you can reduce the code using map.
*/
let contact = ["address": ["zipcode": "94109","street":"post","city": "san francisco"]]

func capitalizedAndTrimmed(_ string: String) -> String {
    return string.trimmingCharacters(in: .whitespaces).capitalized
}

var capitalizedStreet: String? = nil
var capitalizedCity: String? = nil

if let address = contact["address"] {
    if let street = address["street"] {
        capitalizedStreet = capitalizedAndTrimmed(street.capitalized)
    }
    if let city = address["city"] {
        capitalizedCity = capitalizedAndTrimmed(city.capitalized)
    }
}

print(capitalizedStreet)
print(capitalizedCity)

// Cleaned up version
var capitalizedStreet2: String? = nil
var capitalizedCity2: String? = nil

// also works
var capitalizedStreet3: String? = contact["address"]?["street"].map(capitalizedAndTrimmed)
var capitalizedCity3: String? = nil

contact["address"].map {
    capitalizedStreet2 = capitalizedAndTrimmed($0["street"]!)
    capitalizedCity2 = capitalizedAndTrimmed($0["city"]!)
}

print(capitalizedCity2, capitalizedStreet2)

//: [Next](@next)
