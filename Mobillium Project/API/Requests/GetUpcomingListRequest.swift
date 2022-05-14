//
//  GetUpcomingListRequest.swift
//  Mobillium Project
//
//  Created by Çağatay Eğilmez on 14.05.2022.
//

import Foundation
struct GetUpcomingListRequest: APIRequest {
    var headers: [String : String]? = nil
    
    var baseUrl: URL = Environment.rootURL

    typealias Response = MovieModel
    
    let method: HTTPMethodType = .get
    
    var path: String { "movie/upcoming" }
    
    var queryParameters: [URLQueryItem] {
        return [URLQueryItem.init(name: "api_key", value: Environment.apiKey)]
    }
}
