//
//  AddPlaylistView.swift
//  iOS Spotify Assignment
//
//  Created by Swapnil on 08/12/24.
//
import SwiftUI

// Add Playlist View
struct AddPlaylistView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: SpotifyHomeViewModel
    @State private var playlistName: String = ""
    @State private var playlistDescription: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Playlist Name", text: $playlistName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Description", text: $playlistDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if !playlistName.isEmpty {
                        viewModel.addPlaylist(title: playlistName, description: playlistDescription)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Add Playlist")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Add Playlist")
        }
    }
}

