//
//  Extensions.swift
//  CleanrStoryboardFinal
//
//  Created by Zavier Hofstetter on 1/7/25.
//

import Foundation

extension Encodable {//This is the part of the protocol to encode data.
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
