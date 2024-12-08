//
//  Playlist.swift
//  iOS Spotify Assignment
//
//  Created by Swapnil on 08/12/24.
//
import Foundation
// Playlist Model
struct Playlist: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String
    let coverImages: [String]
}
