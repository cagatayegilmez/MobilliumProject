//
//  SimilarMoviesModel.swift
//  Mobillium Project
//
//  Created by Çağatay Eğilmez on 14.05.2022.
//

import Foundation
struct SimilarMoviesModel: Decodable {
    let page: Int
    let total_pages: Int
    let results: [SimilarMoviesListModel]
}

struct SimilarMoviesListModel: Decodable {
    let id: Int
    private let backdrop_path: String?
    let title: String
    let release_date: String
    var imageUrl: String? {
        let path = "https://image.tmdb.org/t/p/w500" + (backdrop_path ?? "")
        return path
    }
}
