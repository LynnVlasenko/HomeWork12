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
    var genreSections: [Section] = []
    var authorSections: [Section] = []
    
    func loadData() {
        
        dataLoader.loadPlaylist { playlist in
            self.items = playlist?.songs ?? []
            
            if let songs = playlist?.songs {
                
                // конвертуємо масив songs у Dictionary
                // використовуючи grouping, де $0.genre - це ключ для елементів songs,
                // у яких значення genre однакове
                let groupedGenreSongs = Dictionary(grouping: songs) { $0.genre }
                let groupedAuthorSongs = Dictionary(grouping: songs) { $0.author }
                
                // конвертуємо словник у масив [Section] і задаємо:
                // поле title - ключ
                // поле rows - значення, для ключа (сгруповані пісні за ознакою genre)
                let songGenreSections: [Section] = groupedGenreSongs.compactMap { key, value in
                    return Section(title: key, rows: value)
                }
                
                let songAuthorSections: [Section] = groupedAuthorSongs.compactMap { key, value in
                    return Section(title: key, rows: value)
                }
                
                self.genreSections = songGenreSections.sorted { $0.title < $1.title }
                self.authorSections = songAuthorSections.sorted { $0.title < $1.title }
                
                self.delegate?.dataDidLoad()
            }
            print("\n Genre: \(self.genreSections)")
            for i in self.genreSections {
                print("title: \(i.title), rows:\(i.rows)")
            }
            
            print("\n Author: \(self.genreSections)")
            for i in self.genreSections {
                print("title: \(i.title), rows:\(i.rows)")
            }
        }
    }
}
