//: # Part 3: Protocol
//:
/*:-----------------------------------------------------------------------------
 ## Q1
 Declare a struct `Person` with a `name` property type `String` and a protocol name `PoliceMan`. There is only one method `arrestCriminals` with no argument and return `void` in the protocol.
  */
struct Person {
    var name: String
}

protocol PoliceMan {
    func arrestCriminals()
}

/*:-----------------------------------------------------------------------------
 ## Q2
 Make struct `Person` conform to `PoliceMan` protocol.
 */
extension Person: PoliceMan {
    func arrestCriminals() {}
}

/*:-----------------------------------------------------------------------------
 ## Q3
 Declare a protocol `ToolMan` with a method `fixComputer` that has no argument and return `void`.
 */
protocol ToolMan {
    func fixComputer()
}

/*:-----------------------------------------------------------------------------
 ## Q4
 Add a property `toolMan` to the struct `Person` with data type `ToolMan`
 */
// 為了按照題目順序作答，取巧用 computed property
extension Person {
    var toolMan: ToolMan {
        struct Progammer: ToolMan {
            func fixComputer() {}
        }
        return Progammer()
    }
}

/*:-----------------------------------------------------------------------------
 ## Q5
 Declare a struct named `Engineer` that conforms to the `ToolMan` protocol
 */
struct Engineer: ToolMan {
    func fixComputer() {}
}

/*:-----------------------------------------------------------------------------
 ## Q6
 Create a `Person` instance with the name `"Steven"` and also create the relative data you need to declare this instance.
 */
// 因為 Q4 取巧用了 computed property，所以這裡只須要創建一個 String 就能完成實例
let steven = Person(name: "Steven")
