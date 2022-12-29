//
//  MovieListItemView.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/19.
//

import SwiftUI

struct MovieListItemView: View {
    
    // MARK: - PROPERTIES
    let movie: MovieModel
    
    // MARK: - BODY
    
    var body: some View {
        let path = (movie.posterPath != nil) ? movie.posterPath : movie.backdropPath
        let photoUrl = (path != nil ) ? URL.getListPhotoURL(path!) : nil
        
        HStack(alignment: .center, spacing: 16){
            ZStack {
                AsyncImage(url: photoUrl){ phase in
                    switch phase {
                    case .empty:
                        Color.purple.opacity(0.1)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure(_):
                        Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .scaledToFit()
                    @unknown default:
                        Image(systemName: "exclamationmark.icloud")
                    }
                }
                .frame(width: 90, height: 90)
                .cornerRadius(12)
                
                ZStack {
                    Circle()
                        .fill(Color.mint).shadow(radius: 1)
                    Text(String(format: "%.1f", movie.voteAverage)).foregroundColor(.brown)
                }.frame(width: 40, height: 40, alignment: .bottomTrailing).offset(x:30, y:30)
                
            }
            VStack(alignment: .leading) {
                if let title = movie.title {
                    Text(title).font(.title2).fontWeight(.heavy).foregroundColor(.accentColor).lineLimit(2)
                }else if let name = movie.name {
                    Text(name).font(.title2).fontWeight(.heavy).foregroundColor(.accentColor).lineLimit(2)
                }
                HStack {
                    if let releaseDate = movie.releaseDate {
                        Text(releaseDate).font(.footnote)
                    }else if let airDate = movie.firstAirDate {
                        Text(airDate).font(.footnote)
                    }
                    
                }
                Text(movie.overview).font(.footnote).multilineTextAlignment(.leading).lineLimit(3).padding(.trailing,8).foregroundColor(.gray)
            }
        }
        
    }
}

struct MovieListItemView_Previews: PreviewProvider {

    static let movies = JSONFileService().getMovie()
    static var previews: some View {
        MovieListItemView(movie: movies[1])
    }
}
