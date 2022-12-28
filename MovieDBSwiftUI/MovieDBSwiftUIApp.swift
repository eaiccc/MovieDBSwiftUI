//
//  MovieDBSwiftUIApp.swift
//  MovieDBSwiftUI
//
//  Created by Link on 2022/12/4.
//

import SwiftUI

@main
struct MovieDBSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TrendViewModel())
        }
    }
}
