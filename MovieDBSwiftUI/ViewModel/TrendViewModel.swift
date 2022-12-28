//
//  TrendViewModel.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/27.
//

import SwiftUI

final class TrendViewModel: ObservableObject {
    //lazy var service: IDataService = JSONFileService()
    lazy var service: IDataService = RemoteService()
    @Published var trend = TrendModel()
    func getAll(id: Int) {
        service.getTrend(mediaType: "movie", timeWindow: "week") { result in
            DispatchQueue.main.async {
                self.trend = result
            }
        }
    }
}
