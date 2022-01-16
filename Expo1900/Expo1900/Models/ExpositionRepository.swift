//
//  ExpositionApiProtocol.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

protocol ExpositionRepository {
    func fetchKoreanEntryList(completion: @escaping ([KoreanEntry]?) -> Void)
    func fetchExposition(completion: @escaping (UniversalExposition?) -> Void)
}
