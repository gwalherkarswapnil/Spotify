//
//  SpotifyHomeViewModel.swift
//  iOS Spotify Assignment
//
//  Created by Swapnil on 08/12/24.
//


import SwiftUI
import Foundation
// SpotifyHomeViewModel
class SpotifyHomeViewModel: ObservableObject {
    @Published var playlists: [Playlist] = []
    @Published var searchText: String = ""
    @Published var isGridView: Bool = true

    var filteredPlaylists: [Playlist] {
        playlists.filter { playlist in
            searchText.isEmpty || playlist.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    func addPlaylist(title: String, description: String) {
        let newPlaylist = Playlist(id: UUID(), title: title, description: description, coverImages: [])
        playlists.append(newPlaylist)
        savePlaylists()
    }
    
    func loadPlaylists() {
        if let data = UserDefaults.standard.data(forKey: "playlists"),
           let decodedPlaylists = try? JSONDecoder().decode([Playlist].self, from: data) {
            playlists = decodedPlaylists
        }
    }
    
    func savePlaylists() {
        if let data = try? JSONEncoder().encode(playlists) {
            UserDefaults.standard.set(data, forKey: "playlists")
        }
    }
}
