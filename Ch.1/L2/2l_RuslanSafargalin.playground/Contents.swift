import UIKit

let numberA = 6
let numberB = 7

func isEven(number: Int) -> Bool {
    number % 2 == 0 ? true : false
}

isEven(number: numberA)
isEven(number: numberB)

print("1. Написать функцию, которая определяет, четное число или нет.")
print("Number \(numberA) is even? \(isEven(number: numberA))")
print("Number \(numberB) is even? \(isEven(number: numberB))\n")

func isSplitTo3(number: Int) -> Bool {
    number % 3 == 0 ? true : false
}

isSplitTo3(number: numberA)
isSplitTo3(number: numberB)

print("2. Написать функцию, которая определяет, делится ли число без остатка на 3.")
print("Number \(numberA) is split to 3? \(isSplitTo3(number: numberA))")
print("Number \(numberB) is split to 3? \(isSplitTo3(number: numberB))\n")

var array: [Int] = []

func createArray100(array: inout [Int]) -> [Int] {
    for index in 1...100 {
        array.append(index)
    }
    return array
}

createArray100(array: &array)

print("3. Создать возрастающий массив из 100 чисел.\n", array, "\n")

for index in (0..<array.count).reversed() {  // Не уверен что .reversed() - хорошая практика
    if isEven(number: array[index]) || !isSplitTo3(number: array[index]) {
        array.remove(at: index)
    }
}

print("4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.\n", array, "\n")

func createFibonacci(number: inout [Int]) -> [Int] {
    number.append(number[number.count-1] + number[number.count-2])
    return number
}

var arrayFibonacci: [Int] = [0, 1, 1]
for _ in 1...50 {
    createFibonacci(number: &arrayFibonacci)
}

print("5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.")
print(arrayFibonacci, "\n")

var simpleNumTemp: [Int] = []
var simpleNumbers: [Int] = []

let n = 550
var step = 2
var counter = 0
let maxSimpleNumbersOnArray = 100

for index in 2...n {
    simpleNumTemp.append(index)
}

func removeNotSimpleNumbersFromArray(array: inout [Int], step p: Int) {
    array.removeAll { value -> Bool in
        value != p && (value % p) == 0
    }
}

func setNextStepFromArray(array: [Int], step p: inout Int) {
    for (_, value) in array.enumerated() {
        if value > p {
            p = value
            break
        }
    }
}

while counter < maxSimpleNumbersOnArray {
    removeNotSimpleNumbersFromArray(array: &simpleNumTemp, step: step)
    setNextStepFromArray(array: simpleNumTemp, step: &step)
    simpleNumbers.append(simpleNumTemp[counter])
    counter += 1
}
print("6. Массив простых чисел состоящий из \(maxSimpleNumbersOnArray) элементов\n", simpleNumbers)
