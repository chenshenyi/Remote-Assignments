// #1
let lottoNumbers = [10, 9, 8, 7, 6, 5]
for i in lottoNumbers.count - 3..<lottoNumbers.count {
  print(lottoNumbers[i])
}
print()

// #2
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
print()

// #3
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
print()

// #4
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
print()

// #6
var isRaining = true
print(
  isRaining
    ? "It's raining, I don't want to work today."
    : "Although it's sunny, I still don't want to work today.")

// #7
var jobLevel = 3
let jobLevels: [Int: String] = [
  1: "Member",
  2: "Team Leader",
  3: "Manager",
  4: "Director",
]
if jobLevels.keys.contains(jobLevel) {
  print(jobLevels[jobLevel]!)
} else {
  print("We don't have this job")
}

jobLevel = 5
switch jobLevel {
case 1...4:
  print(jobLevels[jobLevel]!)
default:
  print("We don't have this job")
}

print(jobLevels[jobLevel, default: "We don't have this job"])

print(jobLevels[jobLevel] ?? "We don't have this job")
