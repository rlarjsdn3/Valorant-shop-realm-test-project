//
//  Version.swift
//  ValorantShopRealmTestProject
//
//  Created by 김건우 on 2023/09/14.
//

import RealmSwift

final class RiotVersion: Object, Codable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var status: Int
    @Persisted var data: Datum?
    
    enum CodingKeys: String, CodingKey {
        case status
        case data
    }
}

final class Datum: Object, Codable {
    @Persisted var riotClientVersion: String
    @Persisted var riotClientBuild: String
}
