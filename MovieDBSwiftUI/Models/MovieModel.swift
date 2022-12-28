//
//  MovieModel.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/28.
//

import Foundation
struct MovieModel: Codable, Hashable {
    let popularity: Double
    let voteCount: Int
    let video: Bool?
    let posterPath: String?
    let id: Int
    let adult: Bool?
    let backdropPath: String?
    let originalLanguage, originalTitle: String?
    let genreIDS: [Int]
    let title: String?
    let voteAverage: Double
    let overview: String
    let releaseDate: String?
    let name: String?
    let originalName: String?
    let firstAirDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case name
        case originalName = "original_Name"
        case firstAirDate = "first_air_date"
    }
}

