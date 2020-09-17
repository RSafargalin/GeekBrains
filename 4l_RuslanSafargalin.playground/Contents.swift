enum Color {
    case red, blue, grey, silver, yellow
}
enum Gearbox {
    case manual, auto
}
enum EngineState {
    case start, stop
}
enum Turbo {
    case none, install
}
enum BodyType {
    case cargo, medic, police, firedep
}
enum HooterState {
    case off, on
}

class Car {
    let color: Color
    let wheels: Int
    let gearbox: Gearbox
    let hp: Int
    var engineState: EngineState = .stop
    var hooter: HooterState = .off
    
    func engineStartStop() {
        switch self.engineState {
        case .start:
            self.engineState = .stop
        case .stop:
            self.engineState = .start
        }
    }
    
    func useHooter() {
        switch self.hooter {
        case .on:
            print("Bip-bip")
            self.hooter = .off
        case .off:
            print("Bip-bip")
            self.hooter = .on
        }
    }
    
    init(color: Color, wheels: Int, gearbox: Gearbox, hp: Int, engineState: EngineState) {
        self.color = color
        self.wheels = wheels
        self.gearbox = gearbox
        self.hp = hp
        self.engineState = engineState
    }
}

class SportCar: Car {
    let turbo: Turbo
    
    override func engineStartStop() {
        if self.turbo == Turbo.install {
            print("psh-psh")
            super.engineStartStop()
        }
    }
    
    init(color: Color, wheels: Int, gearbox: Gearbox, hp: Int, engine: EngineState, turbo: Turbo) {
        self.turbo = turbo
        super.init(color: color, wheels: wheels, gearbox: gearbox, hp: hp, engineState: engine)
    }
}

class TruckCar: Car {
    let bodyType: BodyType
    var cargoVolume: Int {
        bodyType == BodyType.cargo ? 2000 : 0
    }
    var specialHooter: Bool {
        bodyType != BodyType.cargo ? true : false
    }
    
    override func useHooter() {
        print("Wiu-wiu")
        super.useHooter()
    }
    
    override func engineStartStop() {
        print("br-br")
        super.engineStartStop()
    }
    
    init(color: Color, wheels: Int, gearbox: Gearbox, hp: Int, engineState: EngineState, bodyType: BodyType) {
        self.bodyType = bodyType
        super.init(color: color, wheels: wheels, gearbox: gearbox, hp: hp, engineState: engineState)
    }
}

let camaroSS = SportCar(color: .yellow, wheels: 4, gearbox: .manual, hp: 400, engine: .stop, turbo: .install)
print(camaroSS.turbo)
camaroSS.engineStartStop()

let volvoTruck = TruckCar(color: .silver, wheels: 6, gearbox: .auto, hp: 800, engineState: .stop, bodyType: .cargo)
print(volvoTruck.cargoVolume)
volvoTruck.engineStartStop()

let medicTruck = TruckCar(color: .red, wheels: 4, gearbox: .auto, hp: 200, engineState: .stop, bodyType: .medic)
medicTruck.useHooter()
