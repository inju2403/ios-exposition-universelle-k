//
//  ExpositionApiProtocol.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

protocol ExpositionApi {
    func fetchKoreanEntryList(completion: @escaping ([KoreanEntry]?) -> ())
    func fetchExposition(completion: @escaping (UniversalExposition?) -> ())
}
