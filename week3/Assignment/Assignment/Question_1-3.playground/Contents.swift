//: # Remote Learning Assignment - Week 3
//:
//: ------------------------------------------------------
//: ## Q1
//: What is a **closure** ? How to execute a **closure**?

// closure 和函數非常相似，是一種 Callable 的物件

/// 通常我們會把 closure 傳給某個變數或常數，用 `someClosure()` 來呼叫
let someClosure: () -> Void = {
  print("Hello World!")
}

someClosure()

/// 或直接透過運算變數的方式執行，通常用於我們在乎回傳值而不是執行過程時
/// 這種方式無法在呼叫時傳遞參數m
var anotherClosure: Int {
  print("Hello World!")
  return 1
}

anotherClosure

//: ------------------------------------------------------
//: ## Q2
//: Please declare a **closure** whose *input type* is `Int`, *output type* is `Bool`.
//: The functionality of this **closure** is to verify if the input is odd or not. Return `true` if
// it’s odd and vice versa.

var isValueOdd: (Int) -> Bool = { value in
  value % 2 == 1
}

isValueOdd(3)

//: ------------------------------------------------------
//: ## Q3
//: Please complete the following function that prints a triangle made of *asterisks*.
//:
// ```
// func printTriangle(layers: Int) {
// }
// ```
//: For example, here’s what the output of `printTriangle(layers: 5)` should be:
//:
// ```
// *
// **
// ***
// ****
// *****
// ```
//

func printTriangle(layers: Int) {
  (1 ... layers).forEach { print(String(repeating: "*", count: $0)) }
}

printTriangle(layers: 5)
/// PS. 這種寫法相比迴圈可以讓我們在未來更容易地改變輸出的格式，像是：
func triangle(layers: Int) -> [String] {
  (1 ... layers).map { String(repeating: "*", count: $0) }
}
