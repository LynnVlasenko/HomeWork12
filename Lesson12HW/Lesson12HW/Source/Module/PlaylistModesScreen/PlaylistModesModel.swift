//
//  PlaylistModesModel.swift
//  Lesson12HW
//

//

import Foundation

protocol PlaylistModesModelDelegate: AnyObject {
    
    func dataDidLoad()
}

class PlaylistModesModel {
    
    weak var delegate: PlaylistModesModelDelegate?
    private let dataLoader = DataLoaderService()
    
    var items: [Song] = []
    var genreSections: [String] = []
    var authorSections: [String] = []
    
    func loadData() {
        
        dataLoader.loadPlaylist { playlist in
            
            self.items = playlist?.songs ?? []
            self.delegate?.dataDidLoad()
        }
    }
    
    // create additional array for genre sections
    func loadGenreSections() {
        
        var genreInPlaylist: Set<String> = []
        
        for item in items {
            genreInPlaylist.insert(item.genre)
        }
        
        for item in genreInPlaylist {
            genreSections.append(item)
        }
        genreSections = genreSections.sorted { $0 < $1 }
        
        self.delegate?.dataDidLoad()
        print(genreSections)
    }
    
    func loadAuthorSections() {
        
        var genreInPlaylist: Set<String> = []
        
        for item in items {
            genreInPlaylist.insert(item.author)
        }
        
        for item in genreInPlaylist {
            authorSections.append(item)
        }
        authorSections = authorSections.sorted { $0 < $1 }
        
        self.delegate?.dataDidLoad()
        print(authorSections)
    }
}
