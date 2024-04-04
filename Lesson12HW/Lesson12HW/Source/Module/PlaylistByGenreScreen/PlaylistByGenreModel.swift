//
//  PlaylistByGenreModel.swift
//  Lesson12HW
//

//

import Foundation

protocol PlaylistByGenreModelDelegate: AnyObject {
    
    func dataDidLoad()
}

class PlaylistByGenreModel {
    
    weak var delegate: PlaylistByGenreModelDelegate?
    private let dataLoader = DataLoaderService()
    
    var items: [Song] = []
    var sections: [String] = []
    
    func loadData() {
        
        dataLoader.loadPlaylist { playlist in
            
            self.items = playlist?.songs ?? []
            self.delegate?.dataDidLoad()
        }
    }
    
    // create additional array for sections
    func loadSections() {
        
        var genreInPlaylist: Set<String> = []
        
        for item in items {
            genreInPlaylist.insert(item.genre)
        }
        
        for item in genreInPlaylist {
            sections.append(item)
        }
        sections = sections.sorted { $0 < $1 }
        
        self.delegate?.dataDidLoad()
        print(sections)
    }
    
    
}
