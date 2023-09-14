//
//  ViewModel.swift
//  ValorantShopRealmTestProject
//
//  Created by 김건우 on 2023/09/14.
//

import Foundation

final class ViewModel: ObservableObject {
    
    let realmManager = RealmManager.shared
    let resourceManager = ResourceManager.shared
    
    @Published var riotClientVersion: String = ""
    @Published var riotClientBuild: String = ""
    
    func fetchValorantVersion() async  {
        
        let result = await resourceManager.fetchValorantVersion()
        
        switch result {
        case .success(let riotVersion):
            DispatchQueue.main.async {
                self.realmManager.saveRiotVersion(riotVersion)
                self.riotClientVersion = riotVersion.data?.riotClientVersion ?? ""
                self.riotClientBuild = riotVersion.data?.riotClientBuild ?? ""
            }
        case .failure(let _):
            print("발로란트 버전 가져오기 실패")
        }
        
    }
    
    func deleteAllRealmData() {
        self.realmManager.deleteRiotVersion()
    }
}
