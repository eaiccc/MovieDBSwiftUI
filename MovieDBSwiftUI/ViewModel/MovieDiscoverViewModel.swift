//
//  MovieDiscoverViewModel.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/9.
//

import SwiftUI

final class MovieDiscoverViewModel: ObservableObject {
    lazy var service: IDataService = JSONFileService()
    //lazy var service: IDataService = RemoteService()
    @Published var movieDiscover = MovieDiscover()
    func getAll(id: Int) {
        service.getAllData(postID: id) { result in
            DispatchQueue.main.async {
                self.movieDiscover = result
            }
        }
    }
}

