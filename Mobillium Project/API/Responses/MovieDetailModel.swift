//
//  MovieDetailModel.swift
//  Mobillium Project
//
//  Created by Çağatay Eğilmez on 14.05.2022.
//

import Foundation
struct MovieDetailModel: Decodable {
    let id: Int!
    private let backdrop_path: String!
    let title: String!
    let overview: String!
    let vote_average: Double!
    let imdb_id: String!
    let release_date: String!
    var imageUrl: String? {
        let path = "https://image.tmdb.org/t/p/w500" + (backdrop_path ?? "")
        return path
    }
}
