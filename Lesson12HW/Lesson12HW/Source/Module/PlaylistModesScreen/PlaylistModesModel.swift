//
//  PlaylistModesModel.swift
//  Lesson12HW
//

//

import Foundation

protocol PlaylistModesModelDelegate: AnyObject {
    
    func dataDidLoad()
}

struct Sections {
    var rows: [String] = []
}

class PlaylistModesModel {
    
    weak var delegate: PlaylistModesModelDelegate?
    private let dataLoader = DataLoaderService()
    
    var items: [Song] = []
    var sections: [Sections] = [Sections(), Sections()]
//    var genreSections: [String] = []
//    var authorSections: [String] = []
    
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
            sections[0].rows.append(item)
        }
        sections[0].rows = sections[0].rows.sorted { $0 < $1 }
        
        self.delegate?.dataDidLoad()
        print(sections[0].rows)
    }
    
    func loadAuthorSections() {
        
        var genreInPlaylist: Set<String> = []
        
        for item in items {
            genreInPlaylist.insert(item.author)
        }
        
        for item in genreInPlaylist {
            sections[1].rows.append(item)
        }
        sections[1].rows = sections[1].rows.sorted { $0 < $1 }
        
        self.delegate?.dataDidLoad()
        print(sections[1].rows)
    }
}
