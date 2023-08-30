import UIKit

// #1
var myFriends: [String] = []

// #2
myFriends += ["Ian", "Bomi", "Kevin"]
 
// #3
myFriends.append("Michael")

// #4
myFriends.swapAt(0, 2)

// #5
for friend in myFriends {
    print(friend)
}

// #6
let toGet = 5
if toGet < myFriends.count && toGet >= 0 {
    print(myFriends[toGet])
} else {
    print("the index is out of range")
}

// #7
print(myFriends.first ?? "No friends")


// #8
print(myFriends.last ?? "No friends")

// #9
var myCountryNumber: [String: Int] = [:]

// #10
myCountryNumber["US"] = 1
myCountryNumber["GB"] = 44
myCountryNumber["JP"] = 81

// #11
myCountryNumber.updateValue(0, forKey: "GB")

// #12
var emptyDictionary: [String: Int] = [:]

// #13
myCountryNumber.removeValue(forKey: "US")
