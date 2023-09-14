//
//  ValorantShopRealmTestProjectApp.swift
//  ValorantShopRealmTestProject
//
//  Created by 김건우 on 2023/09/14.
//

import SwiftUI

@main
struct ValorantShopRealmTestProjectApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
