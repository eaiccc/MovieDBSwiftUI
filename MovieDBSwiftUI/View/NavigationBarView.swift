//
//  NavigationBarView.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/28.
//

import SwiftUI

struct NavigationBarView: View {
    
    //MARK: - PROPERTY
    
    //@State private var isAnimated: Bool = false
    
    //MARK: - BODY
    var body: some View {
        HStack{
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass").font(.title).foregroundColor(.black)
            }) //:BUTTON
            
            Spacer()
            
            Text("MovieDB").font(.title).fontWeight(.black).foregroundColor(.black)
            
            Spacer()
        }
        
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView().previewLayout(.sizeThatFits).padding()
    }
}
