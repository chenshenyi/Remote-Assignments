# Part5: Function

文中的代碼片段也可以在[Part5-Function.playground](Assignment/Part5-Function.playground/Contents.swift)中查看。

## Q1

What are the return types in the following statements?

```swift
func birthday() -> String {

}

func payment() -> Double {

}
```

----

`closure` 內沒有 statement，照理說是回傳 `Void`，但函式宣告又分別宣告了回傳值是 `String` 和 `Double`，因此會報錯而不會有 return type

## Q2

Please declare a function named `multiply` with two arguments `a` and `b`.

This function won’t return any value and will only print out the result of `a * b`.

Be noticed that we want to give the argument `b` a default value of `10`.

----

```swift
func multiply(a:Int, b: Int = 10) -> Void {
    print (a * b)
}
```

## Q3

What’s the difference between **argument label** and **parameter name** in a function?

----

**argument label** 是在呼叫函式時使用的名稱，**parameter name** 是在函式內部使用的名稱，例如：

```swift
func greet(person name: String) -> String {
  return "Hello, \(name)"
}

greet(person: "Dave")
```

`person` 是 **argument label**，`name` 是 **parameter name**，在函式內部使用 `name`，在呼叫函式時使用 `person`

在大多數情況，每個參數都會有 **parameter name**，但 **argument label** 是可選的，如果不想要使用 **argument label**，可以將 **argument label** 設為 `_`，例如：

```swift
func greet(_ name: String) -> String {
  return "Hello, \(name)"
}

greet("Dave")
```

需要注意的是，如果沒有 **argument label**，在呼叫函式時，**parameter name** 會被當作 **argument label**

## Q4

Please declare a function named `greet` with `person` as an **argument label** and `name` as a **parameter name**. This `greet` function will return a `String`. For example, if
you call the function `greet` like this:

```swift
greet(person: "Luke")
```

It will return the string: `"Hello, Luke"`.

----

```swift
func greet(person name: String) -> String {
  return "Hello, \(name)"
}
```
