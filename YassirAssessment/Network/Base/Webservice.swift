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
            
            log(data: data, response: response, error: nil)
            switch response.statusCode {
            case 200...299:
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                guard let decodedResponse = try? decoder.decode(responseType.self, from: data) else {
                    //log(data: data, response: response, error: nil)
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
    
    static func log(data: Data?, response: HTTPURLResponse?, error: Error?){

            let urlString = response?.url?.absoluteString
            let components = NSURLComponents(string: urlString ?? "")

            let path = "\(components?.path ?? "")"
            let query = "\(components?.query ?? "")"

            var responseLog = "\n<---------- IN ----------\n"
            if let urlString = urlString {
                responseLog += "\(urlString)"
                responseLog += "\n\n"
            }

            if let statusCode =  response?.statusCode{
                responseLog += "HTTP \(statusCode) \(path)?\(query)\n"
            }
            if let host = components?.host{
                responseLog += "Host: \(host)\n"
            }
            for (key,value) in response?.allHeaderFields ?? [:] {
                responseLog += "\(key): \(value)\n"
            }
            if let body = data{
                let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "Can't render body; not utf8 encoded";
                responseLog += "\n\(bodyString)\n"
            }
            if let error = error{
                responseLog += "\nError: \(error.localizedDescription)\n"
            }

            responseLog += "<------------------------\n";
            print(responseLog)
        }
}
