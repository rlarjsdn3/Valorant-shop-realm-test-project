//
//  RealmManager.swift
//  ValorantShopRealmTestProject
//
//  Created by 김건우 on 2023/09/14.
//

import Foundation
import RealmSwift

final class RealmManager {
    
    // MARK: - SINGLETON
    static let shared = RealmManager()
    private init() { }
    
    let realm = try! Realm()
    
//    func getRealmFilePath() {
//        print(realm.configuration.fileURL?.path() ?? "")
//    }
    
    func getRiotVersion() -> Results<RiotVersion> {
        return realm.objects(RiotVersion.self)
    }
    
    func saveRiotVersion(_ object: RiotVersion) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func deleteRiotVersion() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
