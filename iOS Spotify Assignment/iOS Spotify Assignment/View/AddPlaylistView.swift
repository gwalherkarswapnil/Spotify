//
//  AddPlaylistView.swift
//  iOS Spotify Assignment
//
//  Created by Swapnil on 08/12/24.
//
import SwiftUI

struct AddPlaylistView: View {
    @ObservedObject var viewModel: SpotifyHomeViewModel
    @Environment(\.dismiss) var dismiss

    @State private var playlistTitle = ""
    @State private var playlistDescription = ""
    @State private var coverImages = [String]()
    @State private var creatorName = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Playlist Details")) {
                    TextField("Title", text: $playlistTitle)
                    TextField("Description", text: $playlistDescription)
                    TextField("Creator", text: $creatorName)
                }
                
                Section(header: Text("Cover Images")) {
                    Text("Add images dynamically")
                }
            }
            .navigationTitle("Add Playlist")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.addPlaylist(title: playlistTitle, description: playlistDescription, coverImages: ["cover1"], creator: creatorName)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
