enum EngineState {
    case on, off
}
enum EngineMode {
    case eco, normal, sport, race
}
enum DoorsState {
    case open, close
}
enum LightsState {
    case on, off
}

protocol Car {
    var color: String { get }
    var lights: LightsState { get set }
    var engine: EngineState { get set }
    var hp: Int { get set }
    var doors: DoorsState { get set }
    
    func handlerLights(state: LightsState)
}

extension Car {
    mutating func handlerEngine(state: EngineState) {
        switch state {
        case .on:
            self.engine = .off
        case .off:
            self.engine = .on
        }
    }
    
    mutating func handlerDoors(state: DoorsState) {
        switch state {
        case .open:
            self.doors = .close
        case .close:
            self.doors = .open
        }
    }
}

class SportCar: Car {
    var color: String
    var lights: LightsState
    var engine: EngineState
    var hp: Int
    var doors: DoorsState
    var engineMode: EngineMode
    
    func handlerLights(state: LightsState) {
        switch state {
        case .on:
            self.lights = .off
        case .off:
            self.lights = .off
        }
    }
    
    init(color: String, lights: LightsState, engine: EngineState, hp: Int, doors: DoorsState, engineMode: EngineMode) {
        self.color = color
        self.lights = lights
        self.engine = engine
        self.hp = hp
        self.doors = doors
        self.engineMode = engineMode
    }
}

class TruckCar: Car {
    var color: String
    var lights: LightsState
    var engine: EngineState
    var hp: Int
    var doors: DoorsState
    var tankVolume: Int
    
    func handlerLights(state: LightsState) {
        switch state {
        case .on:
            self.lights = .off
        case .off:
            self.lights = .off
        }
    }
    
    init(color: String, lights: LightsState, engine: EngineState, hp: Int, doors: DoorsState, tankVolume: Int) {
        self.color = color
        self.lights = lights
        self.engine = engine
        self.hp = hp
        self.doors = doors
        self.tankVolume = tankVolume
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивная машина с режимом работы двигателя: \(engineMode)"
    }
}
extension TruckCar: CustomStringConvertible {
    var description: String {
        return "Автоцистерна с обьемом: \(tankVolume)"
    }
}


extension SportCar: Comparable {
    static func <(lhs: SportCar, rhs: SportCar) -> Bool{
        return lhs.hp < rhs.hp
    }
    static func <=(lhs: SportCar, rhs: SportCar) -> Bool{
        return lhs.hp <= rhs.hp
    }
    static func >=(lhs: SportCar, rhs: SportCar) -> Bool{
        return lhs.hp >= rhs.hp
    }
    static func >(lhs: SportCar, rhs: SportCar) -> Bool{
        return lhs.hp > rhs.hp
    }
    static func ==(lhs: SportCar, rhs: SportCar) -> Bool{
        return lhs.hp == rhs.hp
    }
}

extension TruckCar: Comparable {
    static func <(lhs: TruckCar, rhs: TruckCar) -> Bool{
        return lhs.hp < rhs.hp
    }
    static func <=(lhs: TruckCar, rhs: TruckCar) -> Bool{
        return lhs.hp <= rhs.hp
    }
    static func >=(lhs: TruckCar, rhs: TruckCar) -> Bool{
        return lhs.hp >= rhs.hp
    }
    static func >(lhs: TruckCar, rhs: TruckCar) -> Bool{
        return lhs.hp > rhs.hp
    }
    static func ==(lhs: TruckCar, rhs: TruckCar) -> Bool{
        return lhs.hp == rhs.hp
    }
}

extension TruckCar: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(hp)
        hasher.combine(tankVolume)
    }
}



var sCar = SportCar(color: "Red", lights: .on, engine: .on, hp: 500, doors: .open, engineMode: .race)
var sCar_2 = SportCar(color: "Black", lights: .on, engine: .on, hp: 600, doors: .open, engineMode: .race)
var tCar = TruckCar(color: "Black", lights: .off, engine: .off, hp: 300, doors: .close, tankVolume: 1000)
var tCar_2 = TruckCar(color: "Black", lights: .off, engine: .off, hp: 400, doors: .close, tankVolume: 1000)

print(sCar)
print(tCar)

sCar < sCar_2
tCar == tCar_2

let dictionary = [
    tCar: 30
]

print(dictionary.first!)
