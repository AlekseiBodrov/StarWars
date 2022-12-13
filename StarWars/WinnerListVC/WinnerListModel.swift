import Foundation

class WinnerListModel {
    var arrayNamesOfUsers: [String] = [] {
        didSet {
            setNamesOfUsers = Set(arrayNamesOfUsers)
        }
    }
    lazy var setNamesOfUsers: Set<String> = Set(arrayNamesOfUsers)
//  var users: [User] = []
//
//    static func createAndSetUser(scoreLable: Int, IlumcrystalLabel: String, dateLabel: String){
//        let name = Game.arrayNamesOfUsers.last == "All users" ? "¯\\_(ツ)_/¯" : Game.arrayNamesOfUsers.last
//        let user = User(userName: name!,
//                        scoreLable: scoreLable,
//                        IlumcrystalLabel: IlumcrystalLabel,
//                        dateLabel: dateLabel)
//        arrayNamesOfUsers.append(name!)
//        Game.users.append(user)
//    }

    func fetchArrayFromSet() -> [String]{
        var array = ["All users"]
        array += Array(setNamesOfUsers).sorted(by: < )
        return array
    }
}
