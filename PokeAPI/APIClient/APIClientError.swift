//
//  APIClientError.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/31.
//

import Foundation

enum APIClientError: LocalizedError {
    case invalidURL
    case noData
    case responseError
    case badStatus(statusCode: Int)
    case networkError
    case decodeFailed
}
