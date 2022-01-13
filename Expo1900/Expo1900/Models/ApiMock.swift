//
//  ApiMock.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//
import Foundation

class ApiMock {
    private var decoder = JSONDecoder()
    var jsonFileName: String!
    
    func decode<T: Decodable>(_ decodingType: T.Type, fileName: String) throws -> T? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            return nil
        }
        
        let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try decoder.decode(decodingType, from: jsonData)
        return response
    }
    
    func response<T: Decodable>(completion: @escaping (T) -> Void) {
        DispatchQueue.global().async {
            guard let response = try? self.decode(T.self, fileName: self.jsonFileName) else {
                return
            }
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
}
