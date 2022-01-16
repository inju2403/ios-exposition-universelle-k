//
//  ApiMock.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//
import Foundation

protocol JSONFileDecodable {
    var decoder: JSONDecoder { get }
}

extension JSONFileDecodable {
    func decodeJson<T: Decodable>(_ decodingType: T.Type, fileName: String) throws -> T? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return nil
        }
        
        let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try decoder.decode(decodingType, from: jsonData)
        return response
    }
}
