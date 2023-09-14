//
//  ResourceManager.swift
//  ValorantShopRealmTestProject
//
//  Created by 김건우 on 2023/09/14.
//

import Foundation

enum ResourceError: Error {
    case noResource
}

final class ResourceManager {
    
    // MARK: - SINGLETON
    static let shared = ResourceManager()
    private init() { }
    
    let realmManager = RealmManager.shared
    
    func fetchValorantVersion() async -> Result<RiotVersion, ResourceError> {
        // URL이 유효한지 확인
        guard let url = URL(string: "https://valorant-api.com/v1/version") else { return .failure(.noResource) }
        // Reqest 생성하기
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        // 네트워크 작업 수행하기
        let (data, response) = try! await URLSession.shared.data(for: urlRequest)
        // 네크워크 상태 코드 확인하기
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              (200..<300) ~= statusCode else {
            print("상태 코드 에러")
            return .failure(.noResource)
        }
        // 받아온 데이터를 디코드하기
        guard let riotVersion = decode(of: RiotVersion.self, data: data) else {
            print("JSON 디코드 에러")
            return .failure(.noResource)
        }
        // 데이터 출력하기
        dump(riotVersion)
        // 데이터 반환하기
        return .success(riotVersion)
        
        
    }
    
    func decode<T: Decodable>(of type: T.Type, data: Foundation.Data) -> T? {
        let decoder = JSONDecoder()
        return try! decoder.decode(type, from: data)
    }
    
}
