//
//  MovieDetailViewModel.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/21.
//

import Foundation
final class MovieDetailViewModel: ObservableObject {
    //lazy var service: IDataService = JSONFileService()
    lazy var service: IDataService = RemoteService()
    var movieID: Int = 0
    @Published var movieDetail = MovieDetail()
    func getMovie(id: Int) {
        service.getMoiveDetail(ID: id) { result in
            DispatchQueue.main.async {
                self.movieDetail = result
                //print("movieDetail \(result.title) \(result.posterPath)")
            }
        }
    }
    init(service: IDataService = RemoteService(), movieID: Int = 0, movieDetail: MovieDetail = MovieDetail()) {
        self.service = service
        self.movieID = movieID
        self.movieDetail = movieDetail
    }
    func getMockMovie() {
        JSONFileService().getMoiveDetail(ID: 0) { result in
                self.movieDetail = result
        }
    }
    

}
