import Foundation

enum SettingType: String {
    case character
    case speed
}

final class Settings {
    var currentCharacter: Int
    var currentSpeed: Int
    var name: String

    let arrayCharacters = ["leia", "clipart", "dartfener", "stormtrooper"]
    let arraySpeedGame = ["hare.fill", "tortoise.fill"]

    init() {
        if let character = UserDefaults.standard.value(forKey: SettingType.character.rawValue) as? Int,
            let speed = UserDefaults.standard.value(forKey: SettingType.speed.rawValue) as? Int,
           let name = UserDefaults.standard.value(forKey: "name") as? String
        {
            self.currentCharacter = character
            self.currentSpeed = speed
            self.name = name
        } else {
            self.currentCharacter = 0
            self.currentSpeed = 0
            self.name = "NoName"
        }
    }

    deinit {
        UserDefaults.standard.set(currentCharacter, forKey: SettingType.character.rawValue)
        UserDefaults.standard.set(currentSpeed, forKey: SettingType.speed.rawValue)
        UserDefaults.standard.set(name, forKey: "name")
    }

    func decrementValue(setting: SettingType) {
        switch setting{
        case .character:
            currentCharacter -= 1
        case .speed:
            currentSpeed -= 1
        }
        checkCounter()
    }

    func incrementValue(setting: SettingType) {
        switch setting{
        case .character:
            currentCharacter += 1
        case .speed:
            currentSpeed += 1
        }
        checkCounter()
    }

    private func checkCounter(){
        currentCharacter = currentCharacter < 0 ? arrayCharacters.count - 1 : currentCharacter
        currentCharacter = currentCharacter > arrayCharacters.count - 1 ? 0 : currentCharacter

        currentSpeed = currentSpeed < 0 ? arraySpeedGame.count - 1 : currentSpeed
        currentSpeed = currentSpeed > arraySpeedGame.count - 1 ? 0 : currentSpeed
    }
}
