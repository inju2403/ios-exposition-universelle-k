//
//  Repository.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import Foundation

struct ExpositionRepositoryDummyImpl: JSONFileDecodable, ExpositionRepository {
    
    let decoder: JSONDecoder = JSONDecoder()
    
    func fetchKoreanEntryList(completion: @escaping ([KoreanEntry]?) -> Void) {
        let jsonFileName = Constant.koreanEntryMockFileName
        DispatchQueue.global().async {
            let response = try? self.decodeJson([KoreanEntry].self, fileName: jsonFileName)
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
    
    func fetchExposition(completion: @escaping (UniversalExposition?) -> Void) {
        let jsonFileName = Constant.universalExpositionMockFileName
        DispatchQueue.global().async {
            let response = try? self.decodeJson(UniversalExposition.self, fileName: jsonFileName)
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
}
