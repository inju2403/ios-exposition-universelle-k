//
//  ExpositionApiInjection.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

final class ExpositionApiInjection {
    static func injectExpositionApi() -> ExpositionApi {
        return ExpositionApiMock()
    }
}
