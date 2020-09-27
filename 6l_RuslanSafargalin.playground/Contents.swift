import Foundation

enum FatalErrors: String {
    case elementsZero = "The number of elements is 0"
    case numericStackOnly = "Only numeric stacks"
}

protocol Perimeter {
    func perimeter() -> Double
}

class Figure {
    
}

class Circle: Figure {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
}

extension Circle: Perimeter {
    func perimeter() -> Double {
        return self.radius * Double.pi * 2.0
    }
}

extension Circle: CustomStringConvertible {
    var description: String {
        return "Circle perimeter: \(self.perimeter())"
    }
}

class Rectangle: Figure {
    var sideA: Double
    var sideB: Double
    
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}

extension Rectangle: Perimeter {
    func perimeter() -> Double {
        return self.sideA * 2 + self.sideB * 2
    }
}

extension Rectangle: CustomStringConvertible {
    var description: String {
        return "Rectangle perimeter: \(self.perimeter())"
    }
}

struct Stack<T> {
    private var elements: [T] = []
    
    enum FilterMode {
        case even, odd
    }
    
    mutating func push(new element: T) {
        self.elements.append(element)
    }
    
    mutating func pop() -> T? {
        self.elements.removeLast()
    }
    
    subscript(index: Int) -> T? {
        if index >= elements.count || index < 0 {
            return nil
        }
        return elements[index]
    }
    
    func filter(mode: FilterMode?) -> [T]? {
        if elements.count == 0 {
            fatalError(FatalErrors.elementsZero.rawValue)
        }
        guard let mode = mode else { return nil }
        
        switch elements[0] {
        case is Int:
            switch mode {
            case .even:
                return elements.filter({
                    $0 as! Int % 2 == 0
                })
            case .odd:
                return elements.filter({
                    $0 as! Int % 2 != 0
                })
            }
        case is Figure:
            switch mode {
            default:
                return nil
            }
        default:
            //fatalError(FatalErrors.numericStackOnly.rawValue)
            return nil
        }
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return "\(elements.description)"
    }
}

let circle = Circle(radius: 10.0)
let rectangle = Rectangle(sideA: 5.0, sideB: 5.0)

var stackOfFigure = Stack<Figure>()

stackOfFigure.push(new: circle)
stackOfFigure.push(new: rectangle)

stackOfFigure.filter(mode: .none)

stackOfFigure[-1]
stackOfFigure[1]
stackOfFigure[3]

stackOfFigure.pop()

stackOfFigure.filter(mode: .none)

stackOfFigure[1]

var stackOfProtocol = Stack<Perimeter>()
stackOfProtocol.push(new: circle)
stackOfProtocol.push(new: rectangle)

var stackOfInt = Stack<Int>()
stackOfInt.push(new: 1)
stackOfInt.push(new: 2)
stackOfInt.push(new: 3)
stackOfInt.push(new: 4)
stackOfInt.push(new: 5)
stackOfInt.push(new: 6)
stackOfInt.push(new: 7)
stackOfInt.push(new: 8)

stackOfInt.filter(mode: .even)
stackOfInt.filter(mode: .odd)
