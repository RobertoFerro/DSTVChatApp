//
//  NetworkRequest.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/05.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation

typealias T = Decodable

struct NetworkRequest<T> {
    let url:URL
    let request:Any?
    let response:T.Type
    let httpMethod: HttpMethod
    let successCallback:(T)->()
    let errorCallBack:(Error)->()
    
    init(_ url:URL, httpMethod:HttpMethod, request:Any? = nil, response:T.Type, successCallback:@escaping (T)->(), errorCallBack: @escaping (Error)->()) {
        self.url = url
        self.request = request
        self.response = response
        self.httpMethod = httpMethod
        self.successCallback = successCallback
        self.errorCallBack = errorCallBack
    }
}
