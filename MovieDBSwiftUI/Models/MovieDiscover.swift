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
    let movies: [MovieModel]

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
        movies = [MovieModel]()
    }
}

// MARK: - Result
