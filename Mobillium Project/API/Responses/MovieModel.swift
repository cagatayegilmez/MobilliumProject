//
//  MovieModel.swift
//  Mobillium Project
//
//  Created by Çağatay Eğilmez on 14.05.2022.
//

import Foundation
struct MovieModel: Decodable {
    let results: [MovieListModel]
}

struct MovieListModel: Decodable {
    let id: Int
    private let backdrop_path: String?
    let title: String
    let vote_average: Double
    let overview: String
    private let release_date: String
    var releaseDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: release_date)
        return date ?? Date()
    }
    var imageUrl: String? {
        let path = "https://image.tmdb.org/t/p/w500" + (backdrop_path ?? "")
        return path
    }
}
