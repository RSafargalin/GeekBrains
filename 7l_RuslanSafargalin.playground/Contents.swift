enum ATMError: Error {
    case offline
    case noMoney
    case moreThanAvailable
    case lessThanPossible
    case notNullOrNegative
}

enum ATMStatus {
    case offline,
         online
}

class ATM {
    private var powerStatus: ATMStatus
    private let maxMoneyInStorage: Int
    private var moneyInStorage: Int
    private let minAmountMoneyForOperation: Int
    
    func powerSelector() {
        switch powerStatus {
        case .offline:
            powerStatus = .online
        case .online:
            powerStatus = .offline
        }
    }
    
    func minAmountInStorage() -> Int {
        return maxMoneyInStorage
    }
    
    func maxWithdrawalAmount() -> Int {
        return moneyInStorage
    }
    
    func minWithdrawalAmount() -> Int {
        return minAmountMoneyForOperation
    }
    
    func getMoney(at money: Int) throws -> Int {
        guard powerStatus == .online else {
            throw ATMError.offline
        }
        guard money > 0 else {
            throw ATMError.notNullOrNegative
        }
        guard moneyInStorage > 0 else {
            throw ATMError.noMoney
        }
        guard moneyInStorage >= money else {
            throw ATMError.moreThanAvailable
        }
        guard minAmountMoneyForOperation <= money else {
            throw ATMError.lessThanPossible
        }
        moneyInStorage -= money
        return money
    }

    init(status: ATMStatus, maxMoneyInStorage: Int, moneyInStorage: Int, minAmountMoneyForOperation: Int) {
        self.powerStatus = status
        self.maxMoneyInStorage = maxMoneyInStorage
        self.moneyInStorage = moneyInStorage
        self.minAmountMoneyForOperation = minAmountMoneyForOperation
    }
}

var yaATM = ATM(status: .online, maxMoneyInStorage: 200_000, moneyInStorage: 50_000, minAmountMoneyForOperation: 200)
do {
    try yaATM.getMoney(at: 2_000)
} catch ATMError.offline {
    print("Банкомат отключен")
} catch ATMError.noMoney {
    print("В банкомате нет денег")
} catch ATMError.notNullOrNegative, ATMError.lessThanPossible {
    print("Вы указали неправильное количество денег. Минимальное значение: \(yaATM.minWithdrawalAmount())")
} catch ATMError.moreThanAvailable {
    print("Вы указали слишком большое значение. Максимальное значение: \(yaATM.maxWithdrawalAmount())")
} catch {
    print("Непредвиденная ошибка: \(error)")
}
