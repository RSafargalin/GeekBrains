import UIKit
import Darwin

// 2x2 + 8x + 6 = 0
let a_coef = 2
let b_coef = 8
let c_coef = 6
var x1 = 0
var x2 = 0

// D = b2 — 4ac
let Discriminant = Int(pow(Float(b_coef), 2)) - 4 * a_coef * c_coef

switch Discriminant {
case 0:
    x1 = -b_coef / (2 * a_coef)
    print("x1 = x2 = \(x1)")
case 1...:
    x1 = (-b_coef + Int(sqrt(Float(Discriminant)))) / (2 * a_coef)
    print("x1 = \(x1)")
    x2 = (-b_coef - Int(sqrt(Float(Discriminant)))) / (2 * a_coef)
    print("x2 = \(x2)")
default:
    print("Нет решения")
}

// a = 3, b = 6, c = ?, S = ?, P = ?
let a = 3.0
let b = 6.0
let c = round(100 * sqrt(pow(a, 2) + pow(b, 2))) / 100
let S = (a * b) / 2
let P = a + b + c

var deposit = 1000
let interestRate = 5
let yearToString: [String] = ["первый", "второй", "третий", "четвертый", "пятый"]

func depositInterest(deposit: Int, interestRate: Int) -> Int {
    return deposit/100 * interestRate
}

for year in yearToString {
    deposit += depositInterest(deposit: deposit, interestRate: interestRate)
    print("Ваш доход на \(year) год составит \(deposit)")
}