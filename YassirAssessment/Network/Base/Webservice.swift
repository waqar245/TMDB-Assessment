//
//  APIRequestHandler.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import Foundation

class Webservice {
    
    static func request<T: Decodable>(_ endPoint: Endpoint, responseType: T.Type) async -> Result<T, RequestError> {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = APIConstants.host
        components.path = "/\(APIConstants.apiVersion)\(endPoint.path)"
        components.queryItems = endPoint.parameters
        
        let url = components.url?
            .appending(queryItems: [URLQueryItem(name: "api_key", value: APIConstants.apiKey)])
        
        var request = URLRequest(url: url!)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.headers
        
        do {
            
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            switch response.statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                guard let decodedResponse = try? decoder.decode(responseType.self, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
