//
//  TrendModel.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/27.
//

import Foundation
// MARK: - MovieDiscover
struct TrendModel: Codable, Hashable {
    var page: Int
    var movies: [MovieModel]
    var totalResults: Int?
    var totalPages: Int?
    
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
