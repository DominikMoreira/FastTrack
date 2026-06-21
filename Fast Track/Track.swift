//
//  Track.swift
//  Fast Track
//
//  Created by Dominik de Jesus Moreira on 21.06.26.
//

import Foundation

struct Track: Identifiable, Decodable {
    let trackId: Int
    let artistName: String
    let trackName: String
    let previewUrl: URL
    let artworkUrl100: String
    
    var id: Int { trackId } // Make struct conform to Identifiable
    var artworkUrl: URL? {
        let replacedString = artworkUrl100.replacingOccurrences(of: "100x100.jpg", with: "300x300.jpg")
        return URL(string: replacedString)
    }
}

struct SearchResult: Decodable {
    let results: [Track]
}

