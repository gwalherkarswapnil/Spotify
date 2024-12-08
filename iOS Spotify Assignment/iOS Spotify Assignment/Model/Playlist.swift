//
//  Playlist.swift
//  iOS Spotify Assignment
//
//  Created by Swapnil on 08/12/24.
//
import Foundation
struct Playlist: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let coverImages: [String] // URLs or asset names
    let creator: String
}
