//
//  APIClientError.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/31.
//

import Foundation

public enum APIClientError: Error {
    case invalidURL
    case noDataError
    case responseError
    case badStatus(statusCode: Int)
    case networkError
    case decodeError
}
