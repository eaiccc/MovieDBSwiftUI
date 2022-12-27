//
//  JSONFileService.swift
//  
//
//  Created by Link on 2022/11/30.
//

import Foundation

class JSONFileService: IDataService {
    var filePath = ""
    init() {
        if let src = Bundle.main.path(forResource: "Movies", ofType: "json"){
            filePath = src
            //print("init() \(filePath)")
        }
    }
    
    func getAllData(postID: Int, completion: @escaping (MovieDiscover) -> Void) {
        var result = MovieDiscover()
        let decoder = JSONDecoder()
        if let data = try? Data(contentsOf: URL(filePath: filePath)), let movies = try? decoder.decode(MovieDiscover.self, from: data) {
            result = movies
        }
        completion(result)
    }

    func getMovie() -> [Movie] {
        let result = MovieDiscover()
        let decoder = JSONDecoder()
        if let data = try? Data(contentsOf: URL(filePath: filePath)), let movieDiscover = try? decoder.decode(MovieDiscover.self, from: data) {
            return movieDiscover.movies
        }
        return result.movies
    }
    
    
    func getMoiveDetail(ID: Int, completion: @escaping (MovieDetail) -> Void) {
        var result = MovieDetail()
        //let decoder = JSONDecoder()
        guard let path = Bundle.main.path(forResource: "MovieDetails", ofType: "json") else { return  }
        if let data = try? Data(contentsOf: URL(filePath: path)) {
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let content = String(data: data, encoding: .utf8) ?? ""
                //print("json: \(content)")
                let response = try decoder.decode(MovieDetail.self, from: data)
                //print("response \(response)")
                result = response
                            
            }catch {
                print("decoder error:\(error)")
            }
        }
        completion(result)
    }
}
