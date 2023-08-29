# Part2: Basics

文中的代碼片段也可以在[Part2-Basics.playground](Assignment/Part2-Basics.playground/Contents.swift)中查看。

## 1. Explain `let` and `var`

- `let` - 用於宣告一個常數，宣告後不可再更改其值
- `var` - 用於宣告一個變數，宣告後可以再更改其值

需要注意的是，`let` 如果宣告的是物件或容器（傳參變數），則其內部的值可以更改，但是不能再指向其他物件或容器。

## 2. Define pi

```swift
let pi: Double = Double.pi
```

## 3. Declare two constants `x` and `y` of type `Int` then assign any value to them. After that, please calculate the average of `x` and `y` and store the result in a constant named `average`

```swift
let x: Int = 10
let y: Int = 20
let average: Int = (x + y) / 2
```

## 4. Following Q3, now we want to save the average in a record system, but the system doesn’t accept `65` but `65.0`

### Please solve this problem so that we can put the average in the record system

```swift
let average2: Double = Double(average)
```

### Please explain the difference between ( `10 / 3` ) and ( `10.0 / 3.0` )

- `10 / 3` 是整數除法，會對商數(其絕對值)向下取整，結果是 `3`
- `10.0 / 3.0` 是浮點數除法，結果是 `3.333333333333334`

## 5. Declare two constants that values are `10` and `3` each, then please calculate the remainder and save the result in a constant named `remainder`

```swift
let ten:Int = 10
let three:Int = 3
let remainder:Int = 10 % 3
```

## 6. Please change the following codes into the ones with the type annotation

```swift
var flag = true
var inputString = "Hello world."
let bitsInBite = 8
let averageScore = 86.8
```

----

```swift
var flag:Bool = true
var inputString:String = "Hello world."
let bitsInBite:Int = 8
let averageScore:Double = 86.8
```

## 7. What is Type Inference in Swift?

Type Inference 是 Swift 的一個特性，它可以在編譯時期自動推斷變數或常數的型別，而不需要明確指定型別，但需要注意如果宣告時沒有賦值，則無法推斷型別。

## 8. What is the issue about this piece of code?

```swift
var phoneNumber = 0_987_654_321
phoneNumber = "Hello world."
```

----

`phoneNumber` 是一個整數，但是在第二行卻賦值為字串。如果確實要儲存多種型別，可以改為

```swift
var phoneNumber:Any = 0_987_654_321
phoneNumber = "Hello world."
```

但由於整數的第一位數字 0 不會被儲存，所以更合理修改為

```swift
var phoneNumber2:String = "0987654321"
phoneNumber2 = "Hello world."
```

## 9. Please declare a variable `salary` with initial value `22000`, and use *unary plus operator* adding `28000` to `salary`, so it will be `50000` after this process

```swift
var salary:Int = 22_000
salary += 28_000
```

## 10. Please write down the *Equality operator* in Swift

- `==` - 等於
- `===` - 等於（物件比較）
