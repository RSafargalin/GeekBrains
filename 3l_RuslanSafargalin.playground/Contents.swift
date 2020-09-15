import UIKit

enum EngineState {
    case start, stop
}
enum DoorState {
    case open, close
}
enum FillTrunkMode {
    case add, clear
}

struct SportCar {
    let brand: String
    let yearManufactured: Int
    let trunkVolume: Int
    var filledTrunkVolume: Int
    var engineState: EngineState = .stop
    var doorState: DoorState = .close
    
    mutating func engineStart() {
        switch self.engineState {
            case .start:
                self.engineState = .stop
            case .stop:
                self.engineState = .start
        }
    }
    
    mutating func openDoor() {
        switch self.doorState {
          case .open:
              self.doorState = .close
          case .close:
              self.doorState = .open
        }
    }
    
    mutating func fillTrunk(at volume: Int, mode: FillTrunkMode) {
        switch mode {
            case .clear:
                if volume == 0 {
                    self.filledTrunkVolume = 0
                }
            default:
                if volume <= (trunkVolume - filledTrunkVolume) && volume > 0 {
                    self.filledTrunkVolume += volume
                }
        }
    }
}

struct TruckCar {
    let brand: String
    let yearManufactured: Int
    let cargoBayVolume: Int
    var filledCargoBayVolume: Int
    var engineState: EngineState
    var doorState: DoorState
    
    mutating func engineStart() {
        switch self.engineState {
            case .start:
                self.engineState = .stop
            case .stop:
                self.engineState = .start
        }
    }
    
    mutating func openDoor() {
        switch self.doorState {
          case .open:
              self.doorState = .close
          case .close:
              self.doorState = .open
        }
    }
    
    mutating func fillCargoBay(at volume: Int, mode: FillTrunkMode) {
        switch mode {
            case .clear:
                if volume == 0 {
                    self.filledCargoBayVolume = 0
                }
            default:
                if volume <= (cargoBayVolume - filledCargoBayVolume) && volume > 0 {
                    self.filledCargoBayVolume += volume
                }
        }
    }
}

var mercedes = SportCar(brand: "Mercedes-Benz", yearManufactured: 2017, trunkVolume: 200, filledTrunkVolume: 0, engineState: .stop, doorState: .close)

mercedes.openDoor()
mercedes.engineStart()
print("Mercedes. Door state: \(mercedes.doorState), Engine state: \(mercedes.engineState)")

var volvo = TruckCar(brand: "Volvo", yearManufactured: 2006, cargoBayVolume: 2000, filledCargoBayVolume: 0, engineState: .stop, doorState: .close)

volvo.openDoor()
volvo.engineStart()
print("Volvo. Door state: \(volvo.doorState), Engine state: \(volvo.engineState)")

