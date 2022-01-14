//
//  ExpositionApiInjection.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

struct ExpositionRepositoryInjection {
    
    private init() { }
    
    static func injectExpositionRepository() -> ExpositionRepository {
        return ExpositionRepositoryDummyImpl()
    }
}
