//
//  MovieDetailView.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/21.
//

import SwiftUI

struct MovieDetailView: View {
    @EnvironmentObject var viewModel: MovieDetailViewModel
    var movieID: Int = 0
    var body: some View {
        let path = (
            viewModel.movieDetail.posterPath != nil) ? viewModel.movieDetail.posterPath : viewModel.movieDetail.backdropPath
        let photoUrl = (path != nil ) ? URL.getDetailPhotoURL(path ?? "") : nil
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack{
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
                            Color.gray.opacity(0.1)
                        }
                    }
                    Text("\(viewModel.movieDetail.title!)")
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .padding(.vertical, 8)
                        .background(Color.accentColor.frame(height: 6).offset(y:24))
                    
                    Group {
                        HStack {
                            Image(systemName: "info.circle").foregroundColor(.accentColor).imageScale(.large)
                            
                            Text(viewModel.movieDetail.overview!).multilineTextAlignment(.leading).layoutPriority(1)
                        }
                    }.padding(.horizontal)
                    
                    Group {
                        HStack {
                            Image(systemName: "books.vertical").foregroundColor(.accentColor).imageScale(.large)
                            Link(viewModel.movieDetail.title!,destination: (URL(string: viewModel.movieDetail.homepage!) ?? URL(string:"https://www.themoviedb.org/"))!)
                        }.foregroundColor(.accentColor)
                    }.padding(.horizontal)
                }
            }.ignoresSafeArea()
        }.onAppear{
            viewModel.getMovie(id: movieID)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    
    static let model = MovieDetailViewModel(service: JSONFileService())
    
    static var previews: some View {
        
        MovieDetailView().environmentObject(model)
    }
}
