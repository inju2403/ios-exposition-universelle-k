//
//  Repository.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

class ExpositionApiMock: ApiMock, ExpositionApi {
    func fetchKoreanEntryList(completion: @escaping ([KoreanEntry]?) -> Void) {
        self.jsonFileName = Constant.koreanEntryMockFileName
        self.response(completion: completion)
    }
    
    func fetchExposition(completion: @escaping (UniversalExposition?) -> Void) {
        self.jsonFileName = Constant.universalExpositionMockFileName
        self.response(completion: completion)
    }
}
