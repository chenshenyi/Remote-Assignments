//:# Part4: Control Flow
//:
//:-----------------------------------------------------------------------------
//:## Q1
//:Here is an array:`let lottoNumbers = [10, 9, 8, 7, 6, 5]`. Please use `for ... in` loop and `Range` to print the last three members in the `lottoNumbers` array
let lottoNumbers = [10, 9, 8, 7, 6, 5]
for i in lottoNumbers.count - 3..<lottoNumbers.count {
  print(lottoNumbers[i])
}

//:-----------------------------------------------------------------------------
//:## Q2
//:Please use a `for...in` loop to print the results as the images listed below respectively(through `lottoNumbers`)
/*:```bash
5
6
7
8
9
10

10
8
6
```*/
for i in stride(
  from: lottoNumbers.count - 1,
  through: 0,
  by: -1)
{
  print(lottoNumbers[i])
}
print()

for i in stride(
  from: 0,
  to: lottoNumbers.count,
  by: 2)
{
  print(lottoNumbers[i])
}

//:-----------------------------------------------------------------------------
//:## Q3
//:Please use a `while` loop to solve *Q2*
var j = lottoNumbers.count - 1
while j >= 0 {
  print(lottoNumbers[j])
  j -= 1
}
print()

j = 0
while j < lottoNumbers.count {
  print(lottoNumbers[j])
  j += 2
}

//:-----------------------------------------------------------------------------
//:## Q4
//:Please use a `repeat-while` loop to solve *Q2*
var k = lottoNumbers.count - 1
repeat {
  print(lottoNumbers[k])
  k -= 1
} while k >= 0
print()

k = 0
repeat {
  print(lottoNumbers[k])
  k += 2
} while k < lottoNumbers.count

//:-----------------------------------------------------------------------------
//:## Q5
//:What are the differences between `while` and `repeat-while`?

// `repeat-while` 會至少執行一次迴圈的內容，類似於 C 的 `do-while`，而 `while` 若初始條件不符合的話，就不會執行迴圈內容

//:-----------------------------------------------------------------------------
//:## Q6
//:Declare a variable `isRaining` to record the weather.
//:Please write a statement that if the weather is raining, print `"It’s raining, I don’t want to work today."`, otherwise print `"Although it’s sunny, I still don’t want to work today."`
var isRaining = true
print(
  isRaining
    ? "It's raining, I don't want to work today."
    : "Although it's sunny, I still don't want to work today.")
//:-----------------------------------------------------------------------------
//:## Q7
//:In a company, we might use numbers to represent job levels. Let’s make an example. We use `1` for the `"Member"`, `2` for `"Team Leader"`, `3` for `"Manager"`, and `4` for `"Director"`
//:Now, declare a variable named `jobLevel` and assign a number to it. If the `jobLevel` number is in our list, print the relative job title name; if not, just print `"We don't have this job"`.
//:Please use the `if-else` statement and the `switch` statement to complete this requirement separately

// 首先我們用 `jobLevels` 字典來儲存職位與代號的對應關係：
var jobLevel = 3
let jobLevels: [Int: String] = [
  1: "Member",
  2: "Team Leader",
  3: "Manager",
  4: "Director",
]

// 用 `if-else` 來判斷是否有這個職位：
if jobLevels.keys.contains(jobLevel) {
  print(jobLevels[jobLevel]!)
} else {
  print("We don't have this job")
}
// 由於 `jobLevels[jobLevel]` 有可能是 `nil`，所以加上 `!` 表示我們確定有這個職位，否則會印出 `Optional(...)`

// 用 `switch` 來判斷是否有這個職位：
jobLevel = 5
switch jobLevel {
case 1...4:
  print(jobLevels[jobLevel]!)
default:
  print("We don't have this job")
}
// 需要注意這個方法中 `case` 必須是連續而且固定的

// 更好的方法是直接使用 `jobLevels` 字典的 `default` 值：
print(jobLevels[jobLevel, default: "We don't have this job"])

// 或是使用 `??` 運算符：
print(jobLevels[jobLevel] ?? "We don't have this job")
