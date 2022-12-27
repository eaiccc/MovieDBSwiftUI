//
//  MovieListItemView.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/19.
//

import SwiftUI

struct MovieListItemView: View {
    
    // MARK: - PROPERTIES
    let movie: Movie
    
    // MARK: - BODY
    
    var body: some View {
        let path = (movie.posterPath != nil) ? movie.posterPath : movie.backdropPath
        let photoUrl = (path != nil ) ? URL.getListPhotoURL(path!) : nil
        
        HStack(alignment: .center, spacing: 16){
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
            VStack(alignment: .leading) {
                Text(movie.title).font(.title2).fontWeight(.heavy).foregroundColor(.accentColor).lineLimit(2)
                HStack {
                    Text(movie.releaseDate).font(.footnote)
                    Text("Star: \(String(movie.voteAverage))").font(.footnote).foregroundColor(.red)
                    
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
