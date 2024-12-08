//
//  SpotifyHomeViewModel.swift
//  iOS Spotify Assignment
//
//  Created by Swapnil on 08/12/24.
//


import SwiftUI

class SpotifyHomeViewModel: ObservableObject {
    @Published var playlists: [Playlist] = [
        Playlist(title: "My first library", description: "266 songs", coverImages: ["cover1", "cover2", "cover3", "cover4"], creator: "User"),
        Playlist(title: "My second library", description: "58 songs", coverImages: ["cover5", "cover6", "cover7", "cover8"], creator: "Jhesy")
    ]
    
    @Published var searchText: String = ""
    @Published var isGridView: Bool = true

    var filteredPlaylists: [Playlist] {
        if searchText.isEmpty {
            return playlists
        } else {
            return playlists.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func addPlaylist(title: String, description: String, coverImages: [String], creator: String) {
        playlists.append(Playlist(title: title, description: description, coverImages: coverImages, creator: creator))
    }
}
