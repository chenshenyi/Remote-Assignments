# Part3: Collection

## 1. Please initialize an empty array with `String` data type and assign it to a variable named `myFriends`

```swift
var myFriends: [String] = []
```

## 2. According to Q1, now I have three friends, `"Ian"`, `"Bomi"`, and `"Kevin"`. Please help me to add their name into `myFriends` array at once

```swift
myFriends += ["Ian", "Bomi", "Kevin"]
```

## 3. Oops, I forgot to add `"Michael"` who is one of my best friends, please help me to add `"Michael"` to the end of `myFriends` array

```swift
myFriends.append("Michael")
```

## 4. Because I usually hang out with `"Kevin"`, please move `"Kevin"` to the beginning of the `myFriends` array

```swift
myFriends.swapAt(0, 2)
```

如果不知道 `"Kevin"` 的 index 的話，可以用 `firstIndex(of:)` 來找到 index

```swift
if let index = myFriends.firstIndex(of: "Kevin") {
    myFriends.swapAt(0, index)
}
```

如果想保留其他元素的順序的話，可以用 `insert(_:at:)` 來插入

```swift
if let index = myFriends.firstIndex(of: "Kevin") {
    myFriends.insert(myFriends.remove(at: index), at: 0)
}
```

## 5. Use `for...in` to print all the friends in `myFriends` array
  
```swift
for friend in myFriends {
    print(friend)
}
```

## 6. Now I want to know who is at index `5` in the `myFriends` array, try to find the answer for me. Please explain how you get the answer and why the answer is it

這個 index 超出範圍，所以會報錯，可以用 `if` 判斷 index 是否在範圍內

```swift
let toGet = 5
if toGet < myFriends.count && toGet >= 0 {
    print(myFriends[toGet])
} else {
    print("the index is out of range")
}
```

## 7. How to get the first element in an array?

我們可以用 `first` 來取得第一個元素，但如果 array 沒有元素的話，會回傳 `nil`，所以可以用 `??` 來判斷是否為 `nil`

```swift
print(myFriends.first ?? "No friends")
```

更直覺的寫法是

```swift
print(myFriends[0])
```

但如果 array 沒有元素的話，會報錯，需要額外用 `if` 判斷

```swift
if myFriends.count > 0 {
    print(myFriends[0])
} else {
    print("No friends")
}
```

## 8. How to get the last element in an array?

```swift
print(myFriends.last ?? "No friends")
```

或者
  
```swift
if myFriends.count > 0 {
    print(myFriends[myFriends.count - 1])
} else {
    print("No friends")
}
```

## 9. Please initialize a `Dictionary` with keys of type `String`, value of type `Int`, and assign it to a variable named `myCountryNumber`

```swift
var myCountryNumber: [String: Int] = [:]
```

## 10. Please add three values `1`, `44`, `81` to `myCountryNumber` for keys `"US"`, `"GB"`, `"JP"` respectively

```swift
myCountryNumber["US"] = 1
myCountryNumber["GB"] = 44
myCountryNumber["JP"] = 81
```

或者
  
```swift
myCountryNumber = ["US": 1, "GB": 44, "JP": 81]
```

但第二種寫法會覆蓋掉原本的值，所以如果原本有值的話，會被覆蓋掉

## 11. Change the value of `"GB"` from `44` to `0`

```swift
myCountryNumber.updateValue(0, forKey: "GB")
```

或者

```swift
myCountryNumber["GB"] = 0
```

第一種寫法的好處是，如果 key 不存在的話，會回傳 `nil`，如果 key 存在的話，會回傳原本的值

## 12. How to declare an empty dictionary?

```swift
var emptyDictionary: [String: Int] = [:]
```

## 13. How to remove a key-value pair in a dictionary?

```swift
myCountryNumber.removeValue(forKey: "US")
```
