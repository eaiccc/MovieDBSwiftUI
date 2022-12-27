//
//  MovieDiscover.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/8.
//

import Foundation

// MARK: - MovieDiscover
struct MovieDiscover: Codable, Hashable {
    let page, totalResults, totalPages: Int
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
    
    init() {
        page = 0;
        totalResults = 0;
        totalPages = 0
        movies = [Movie]()
    }
}

// MARK: - Result
struct Movie: Codable, Hashable {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String?
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let originalLanguage, originalTitle: String
    let genreIDS: [Int]
    let title: String
    let voteAverage: Double
    let overview, releaseDate: String

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
    }
}

