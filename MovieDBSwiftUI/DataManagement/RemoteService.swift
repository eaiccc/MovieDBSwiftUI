//
//  RemoteService.swift
//  
//
//  Created by Link on 2022/11/30.
//

import Foundation
class RemoteService: IDataService {
    
    let page = 1
    
    var movieDisoverRequest: String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/discover/movie"

        components.queryItems = [
            URLQueryItem(name: "primary_release_date.lte", value: DefaultDiscoverDay),
            URLQueryItem(name: "sort_by", value: DefaultSortBy),
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "api_key", value: APIKey)
        ]
        return components.string!
    }
    
    func movieDetailRequest(id: Int) -> String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/movie/\(id)"

        components.queryItems = [
            URLQueryItem(name: "api_key", value: APIKey)
        ]
        return components.string!
    }
    
    func trendRequest(mediaType: String, timeWindow: String) -> String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/trending/\(mediaType)/\(timeWindow)"

        components.queryItems = [
            URLQueryItem(name: "api_key", value: APIKey)
        ]
        return components.string!
    }
    
    func getAllData(postID: Int, completion: @escaping (MovieDiscover) -> Void) {
        if let url = URL(string: movieDisoverRequest) {
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, res, error in
                if let error {
                    print(error)
                    return
                }
                if let data, let list = try? JSONDecoder().decode(MovieDiscover.self, from: data){
                    completion(list)
                }
            }.resume()
        }
    }
    
    func getMoiveDetail(ID: Int, completion: @escaping (MovieDetail) -> Void) {
        print("detail path:\(movieDetailRequest(id: ID))")
        let path = movieDetailRequest(id: ID)
        if let url = URL(string: path) {
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, res, error in
                if let error {
                    print("dataTast error:\(error)")
                    return
                }
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let content = String(data: data, encoding: .utf8) ?? ""
                        print(content)
                        let response = try decoder.decode(MovieDetail.self, from: data)
                        print("response \(response)")
                        completion(response)
                                    
                    }catch(let error) {
                        print("decoder error:\(error.localizedDescription)")
                    }
                } else {
                    print("No Data")
                }
                
//                if let data, let model = try? JSONDecoder().decode(MovieDetail.self, from: data){
//                    completion(model)
//                }
            }.resume()
        }
    }
    
    func getTrend(mediaType: String, timeWindow: String, completion: @escaping (TrendModel) -> Void) {
        if let url = URL(string: trendRequest(mediaType: mediaType, timeWindow: timeWindow)) {
            URLSession.shared.dataTask(with: URLRequest(url: url)) { data, res, error in
                if let error {
                    print(error)
                    return
                }
                if let data, let list = try? JSONDecoder().decode(TrendModel.self, from: data){
                    completion(list)
                }
            }.resume()
        }
    }
}

