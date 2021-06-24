//
//  APIRouter.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Foundation

enum APIRouter {
    
    case Products([String: Any])
    
    private var method: HTTPMethod {
        switch self {
        case .Products:
            return .GET
        }
    }
    
    private var path: String {
        switch self {
        case .Products(let parameters):
            let item = parameters["item"] ?? ""
            return "MCO/search?q=\(item)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
    }
    
    private var url: String {
        APIManagerConstants.endpoint
    }
    
    private var urlRequest: URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    private var nsUrlRequest: URLRequest? {
        guard let nsUrl = NSURL(string: self.url + path) else {
            return nil
        }
        var urlRequest = URLRequest(url: nsUrl as URL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    var request: URLRequest? {
        switch self {
        case .Products:
            return nsUrlRequest
        }
    }
    
}

