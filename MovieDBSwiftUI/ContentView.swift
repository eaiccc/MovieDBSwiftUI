//
//  ContentView.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/4.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: MovieDiscoverViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movieDiscover.movies, id: \.self) {
                    movie in
                    NavigationLink(destination: MovieDetailView(movieID: movie.id).environmentObject(MovieDetailViewModel())) {
                        MovieListItemView(movie: movie)
                    }
                }
            } //: LIST
        }.onAppear{
            viewModel.getAll(id: 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(MovieDiscoverViewModel())
    }
}

