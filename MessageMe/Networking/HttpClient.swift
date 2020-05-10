//
//  HttpClient.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation

enum HttpMethod:String {
    case get = "GET"
    case post = "POST"
}

enum NetworkError: Error {
    case invalidDataFailure
    case responseFailure
    case jsonDecodingFailure
    
    var localizedDescription: String {
        switch self {
            case .invalidDataFailure: return "invalidDataFailure".localized()
            case .responseFailure: return "responseFailure".localized()
            case .jsonDecodingFailure: return "jsonDecodingFailure".localized()
        }
    }
}

class HttpClient {
    
    let jsonApplication = "application/json"
    let contentType =  "Content-Type"
    
    func makeAsynchronousServiceCall<T:Decodable>(with networkRequest:NetworkRequest<T>) {
        
        let request = createUrlRequest(with: networkRequest)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            if(error != nil){
                networkRequest.errorCallBack(NetworkError.responseFailure)
                return
            }
            
            guard let responseData = data else {
                networkRequest.errorCallBack(NetworkError.invalidDataFailure)
                return
            }
        
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(networkRequest.response, from: responseData)
                networkRequest.successCallback(decodedData)
            } catch {
                networkRequest.errorCallBack(NetworkError.jsonDecodingFailure)
                return
            }
        })
        
        task.resume()
    }
    
    private func createUrlRequest<T>(with networkRequest:NetworkRequest<T>) -> URLRequest {
        
        var request = handleGetMatrixRequest(with: networkRequest)
        request.addValue(jsonApplication, forHTTPHeaderField:contentType)
        request.httpMethod = networkRequest.httpMethod.rawValue
                
        if let networkRequestObject = networkRequest.request {
            
            if networkRequest.httpMethod == .post {
                request.httpBody = createHttpBody(with: networkRequestObject)
            }

        }

        return request
    }
    
    private func createHttpBody(with requestObject:Any) -> Data? {
        
        let mirrorObject = Mirror(reflecting: requestObject)
        var parameters:[String:Any] = [:]

        for (_, objectAttribute) in mirrorObject.children.enumerated() {
           
           if let objectAttributeLabel = objectAttribute.label {
               parameters[objectAttributeLabel] = objectAttribute.value
           }
        }

        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        return jsonData
        
    }
    
    private func handleGetMatrixRequest<T>(with networkRequest:NetworkRequest<T>) -> URLRequest {
        
        guard let requestObject = networkRequest.request else {
            return URLRequest(url: networkRequest.url)
        }
        
        if networkRequest.httpMethod == .get {
            
            let baseUrl = networkRequest.url
    
            let mirrorObject = Mirror(reflecting: requestObject)
            var buildOnString = ""
            
            for (_, objectAttribute) in mirrorObject.children.enumerated() {
                
                if let objectAttributeLabel = objectAttribute.label {
                    buildOnString += ";\(objectAttributeLabel)=\(String(describing: objectAttribute.value))"
                }
            }
            
            let baseUrlString = baseUrl.absoluteString
            let newUrlString = baseUrlString + buildOnString
            
            if let encoded = newUrlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded) {
                return URLRequest(url: url)
            } else {
                return URLRequest(url: networkRequest.url)
            }
    
        } else {
            return URLRequest(url: networkRequest.url)
        }
        
        
    }
    
}
