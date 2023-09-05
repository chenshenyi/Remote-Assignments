

//: # Part 2: Enumerations and Optionals
//:
/*:-----------------------------------------------------------------------------
 ## Q1
 There are several gasoline types, 92, 95, 98, and diesel that we can use enum to model them.
 */
//: - Please declare an enum named `Gasoline` to model gasoline.
//: - Every kind of gasoline has its price. Please declare a computed property named `price` and a method named `getPrice` separately in `Gasoline` enum that both will return different prices depending on different gasoline.
//: - Please establish raw values for Gasoline . The data type of raw value should be `String`. For example, `Gasoline.oil92.rawValue` should be `"92"`.

enum Gasoline: String {
    var price: Float { self.getPrice() }
    case oil92 = "92", oil95 = "95", oil98 = "98", diesel

    func getPrice() -> Float {
        switch self {
        case .oil92: return 31.17
        case .oil95: return 32.67
        case .oil98: return 34.67
        case .diesel: return 28.73
        }
    }
}

Gasoline.oil92.rawValue
Gasoline.oil92.price

//: - Please explain what enum associated value is and how it works
// Associated value 就是為每一個 case 添加的一個儲存資料的 tuple
// 最常見的用法是結合 switch case 使用

enum Attendance {
    case onTime
    case late(delayMinutes: Int)
    case absent(withReason: String)
}

let smithAttendance = Attendance.late(delayMinutes: 10)
switch smithAttendance {
case .onTime:
    print("On time")
case .late(delayMinutes: let n):
    print("Late \(n) minutes")
case .absent(withReason: let reason):
    print("Absent with reason: \(reason)")
}

// 他會讓 switch case 先判斷 case 再取出 associated value
// 更為特殊的用法是 nested enum，可以幫助我們針對不同的 case 進一步分類

enum Attendance2 {
    case onTime
    case late(L)
    case absent(A)
    enum L {
        case moreThan10Minutes
        case lessThan10Minutes
    }

    enum A {
        case withReason(String)
        case withoutReason
    }
}

let jayAttendance = Attendance2.late(.moreThan10Minutes)
switch jayAttendance {
case .onTime:
    print("Great!")
case .absent(.withReason), .late(.lessThan10Minutes):
    print("It's Ok!")
case .late(.moreThan10Minutes), .absent(.withoutReason):
    print("You are fired!")
}

/*:-----------------------------------------------------------------------------
 ## Q2
 `Optional` is a very special data type in Swift. Take `var a: Int? = 10` for example, the value of a will be `nil` or `Int` . You should have learned how to deal with `Optional`.
 */
//: - People would like to have pets, but not everyone could have one. Declare a class `Pet` with `name` property and a class `People` with `pet` property which will store a `Pet` instance or `nil`. Please try to figure out what data type is suitable for these properties in `Pet` and `People`.
//: - Please create a `People` instance. Use `guard let` to unwrap the pet property and print its name.
//: - Please create another People instance. Use `if let` to unwrap the pet property and print its name.

class Pet {
    var name: String
    init(_ name: String) {
        self.name = name
    }
}

class People {
    var name: String
    var pet: Pet?
    init(_ name: String, pet: Pet? = nil) {
        self.name = name
        self.pet = pet
    }
}

let cat = Pet("cat")
let jessica = People("Jessica", pet: cat)

guard let jessicaPet = jessica.pet else {
    fatalError("The person without pet should not exist!!!")
}

print(jessicaPet.name)

let kevin = People("Kevin")
if let kevinPet = kevin.pet {
    print(kevinPet.name)
} else {
    print("You don't have a pet!")
}
