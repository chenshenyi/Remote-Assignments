//: # Part 4: Error Handling
//:
/*:-----------------------------------------------------------------------------
 ## Q1
  Read the code here first and paste it in the playground file, there is an **error** inside the code. Please solve the error by adding a piece of code in the file. Call `guess(number:)` and pass `20` as the argument after you fix the problem.

 ```
 enum GuessNumberGameError {
     case wrongNumber
 }

 class GuessNumberGame {
     var targetNumber = 10
     func guess(number: Int) throws {
         guard number == targetNumber else {
             throw GuessNumberGameError.wrongNumber
         }
         print("Guess the right number: \(targetNumber)")
     }
 }
 ```
 */
enum GuessNumberGameError: Error {
    // let the enum conform to Error protocol
    case wrongNumber
}

class GuessNumberGame {
    var targetNumber = 10
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        print("Guess the right number: \(targetNumber)")
    }
}

let newGame = GuessNumberGame()
do {
    try newGame.guess(number: 20)
} catch {
    print("Error: \(error)")
}
