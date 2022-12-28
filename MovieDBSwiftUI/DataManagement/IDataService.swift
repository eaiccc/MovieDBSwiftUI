//
//  IDataService.swift
//  
//
//  Created by Link on 2022/11/30.
//

import Foundation

protocol IDataService {
    func getAllData(postID: Int, completion: @escaping(MovieDiscover) -> Void)
    func getMoiveDetail(ID: Int, completion: @escaping (MovieDetail) -> Void)
    func getTrend(mediaType: String, timeWindow: String, completion: @escaping (TrendModel) -> Void)
}
