//
//  LoginEncodable.swift
//  JsonCodableDemo
//
//  Created by Varun on 11/02/18.
//  Copyright © 2018 Codekul. All rights reserved.
//

import Foundation

class LoginEncodable: Codable {
    let email: String
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
    }
    
    init(email: String, password: String?) {
        self.email = email
        self.password = password
    }
}

// MARK: Convenience initializers

extension LoginEncodable {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(LoginEncodable.self, from: data)
        self.init(email: me.email, password: me.password)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

class LoginDecodable: Codable {
    let token: String?
    let error: String?
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case error = "error"
    }
    
    init(token: String?, error: String?) {
        self.token = token
        self.error = error
    }
}

// MARK: Convenience initializers

extension LoginDecodable {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(LoginDecodable.self, from: data)
        self.init(token: me.token, error: me.error)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
