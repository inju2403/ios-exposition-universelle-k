//
//  Repository.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

protocol RepositoryType {
    var koreanEntryList: [KoreanEntry]? { get set }
    var universalExposition: UniversalExposition? { get set }
    
    func getJsonString(fileName: String) -> String
    func getKoreanEntryList() -> [KoreanEntry]?
    func getUniversalExposition() -> UniversalExposition?
    
}

class Repository: RepositoryType {
    private let decoder = JSONDecoder()
    var koreanEntryList: [KoreanEntry]?
    var universalExposition: UniversalExposition?
    
    func getJsonString(fileName: String) -> String {
        var jsonString = ""
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return jsonString
        }
        
        guard let contentString = try? String(contentsOfFile: path) else {
            return jsonString
        }
        
        jsonString = contentString
        return jsonString
    }
    
    func getKoreanEntryList() -> [KoreanEntry]? {
        let jsonString = getJsonString(fileName: Constant.koreanEntryMockFileName)
        let data = jsonString.data(using: .utf8)
        
        if let data = data,
           let koreanEntryList = try? decoder.decode([KoreanEntry].self, from: data) {
            self.koreanEntryList = koreanEntryList
        }
        
        return koreanEntryList
    }
    
    func getUniversalExposition() -> UniversalExposition? {
        let jsonString = getJsonString(fileName: Constant.universalExpositionMockFileName)
        let data = jsonString.data(using: .utf8)
        
        if let data = data,
           let universalExposition = try? decoder.decode(UniversalExposition.self, from: data) {
            self.universalExposition = universalExposition
        }
        
        return universalExposition
    }
    
    
}

