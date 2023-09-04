//: # Part 1: Object-Oriented
//:
/*:-----------------------------------------------------------------------------
 ## Q1
 Define a class called `Animal` with the following properties and methods:
 - `gender`: `enum` of `Gender` type. Should have `male`, `female` and `undefined` cases.
 - `eat()`: Should print `"I eat everything!"`
 */
enum Gender {
    case male
    case female
    case undefined
}

class Animal {
    var gender: Gender
    
    init(_ gender: Gender = .undefined){
        self.gender = gender
    }

    func eat() {
        print("I eat everything!")
    }
}

Animal(.female)
/*:-----------------------------------------------------------------------------
 ## Q2
 Declare three classes: `Elephant` , `Tiger` , `Horse` that inherits from `Animal` and override the `eat()` method to print what they usually eat.
 */
class Elephant: Animal {
    override func eat() {
        print("I eat grass!")
    }
}

class Tiger: Animal {
    override func eat() {
        print("I eat meat!")
    }
}

class Horse: Animal {
    override func eat() {
        print("I eat grass!")
    }
}
/*:-----------------------------------------------------------------------------
 ## Q3
 Declare a class `Zoo` with a property `weeklyHot` which means the most popular one in the zoo this week.
 The codes below can’t work correctly, please find what data type should A be and solve the problem.
 Note that `tiger`, `elephant`, and `horse` are instances of class `Tiger`, `Elephant`, and `Horse` respectively.
 ```
 class Zoo {
     var weeklyHot: A
     init(weeklyHot: A) { }
 }

 let zoo = Zoo(weeklyHot: Tiger())
 zoo.weeklyHot = tiger
 zoo.weeklyHot = elephant
 zoo.weeklyHot = horse
 ```
 */

class Zoo {
    var weeklyHot: Animal
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}

let zoo = Zoo(weeklyHot: Tiger())

let tiger = Tiger()
let elephant = Elephant()
let horse = Horse()

zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

/*:-----------------------------------------------------------------------------
 ## Q4
 What is an instance? What does **Initilizer** do in `Class` and `Struct`?
 */

// instance 是 class 或 struct 的實體
// 不同的 instance 都有 class 或 struct 定義的方法或屬性

// initilzer 是用來初始化 instance 的函數
// 最常見就是為 instance 所有 property 賦值

/*:-----------------------------------------------------------------------------
 ## Q5
 What’s the difference between `Struct` and `Class` ?
 */

/*
---------------------------------------------
| Comparison  | structure  | class          |
|-------------+------------+----------------|
| type        | value type | reference type |
| inheritance | no         | yes            |
| storage     | stack      | heap           |
| Initializer | default    | manually       |
| Thread-safe | yes        | no             |
---------------------------------------------
*/

/*:-----------------------------------------------------------------------------
 ## Q6
 What’s the difference between **reference type** and **value type**?
 */

// reference type，以記憶體位置為基準
// value type，以值為基準
// 最常見的區別如下：

// reference type
class A {
    var a = 1
}
var a1 = A()
var a2 = a1
a2.a = 2
print(a1.a) // 2

// value type
struct B {
    var b = 1
}
var b1 = B()
var b2 = b1
b2.b = 2
print(b1.b) // 1

/*:-----------------------------------------------------------------------------
 ## Q7
 What’s the difference between **instance method** and **type method**?
 */

// instance method 是針對實例的方法，可以被實例呼叫
// type method 是針對類別的方法，可以被類別呼叫

class Person {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func sayHi() {
        print("Hi, \(self.name)!")
    }
    
    class func sayHi() {
        print("Hi, I'm a person!")
    }
}

var me = Person("Chen")
Person.sayHi() // Hi, I'm a person!
me.sayHi() // Hi, Chen!

/*:-----------------------------------------------------------------------------
 ## Q8
 What does `self` mean in an **instance method** and a **type method** respectively?
 */

// 在 instance method 他代表呼叫他的 instance
// 在 type method 他代表呼叫他的 type

class Transportation {
    var wheels:Int
    static var allWheels = 0
    
    init(_ wheels:Int){
        self.wheels = wheels
        Transportation.allWheels += wheels
    }
    
    func getwheels(){
        print(self.wheels)
        // 可以呼叫實例的成員
    }
    
    class func getAllWheels(){
        print(self.allWheels)
        // 可以呼叫類的成員
    }
}

var bus = Transportation(8)
bus.getwheels() // 8
Transportation.getAllWheels() // 8


var car = Transportation(4)
car.getwheels() // 4
Transportation.getAllWheels() // 12

