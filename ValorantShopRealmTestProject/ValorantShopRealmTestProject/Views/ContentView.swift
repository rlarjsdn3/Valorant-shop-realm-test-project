//
//  ContentView.swift
//  ValorantShopRealmTestProject
//
//  Created by 김건우 on 2023/09/14.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.riotClientVersion)
                .fontWeight(.bold)
            Text(viewModel.riotClientBuild)
                .fontWeight(.light)
            
            Button("버전 불러오기") {
                Task {
                    await viewModel.fetchValorantVersion()
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button("DB 삭제하기") {
                viewModel.deleteAllRealmData()
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
