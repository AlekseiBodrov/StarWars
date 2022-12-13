import Foundation
import UIKit

class User: Codable {

    var userName: String
    var scoreLable: Int
    var ilumcrystalLabel: String
    var dateLabel: String

    init(userName: String,
         scoreLable: Int,
         ilumcrystalLabel: String,
         dateLabel: String){
        self.userName = userName
        self.scoreLable = scoreLable
        self.ilumcrystalLabel = ilumcrystalLabel
        self.dateLabel = dateLabel
    }


    public enum CodingKeys: String, CodingKey {
        case userName, scoreLable, ilumcrystalLabel, dateLabel
    }

    required public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.userName = try container.decode(String.self, forKey: .userName)
        self.scoreLable = try container.decode(Int.self, forKey: .scoreLable)
        self.ilumcrystalLabel = try container.decode(String.self, forKey: .ilumcrystalLabel)
        self.dateLabel = try container.decode(String.self, forKey: .dateLabel)
    }

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(self.userName, forKey: .userName)
        try container.encode(self.scoreLable, forKey: .scoreLable)
        try container.encode(self.ilumcrystalLabel, forKey: .ilumcrystalLabel)
        try container.encode(self.dateLabel, forKey: .dateLabel)
    }
}
