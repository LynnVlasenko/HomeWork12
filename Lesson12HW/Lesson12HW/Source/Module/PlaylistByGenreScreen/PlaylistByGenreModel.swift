//
//  PlaylistByGenreModel.swift
//  Lesson12HW
//

//

import Foundation

protocol PlaylistByGenreModelDelegate: AnyObject {
    
    func dataDidLoad()
}

class Section {
    
    var title: String
    var rows: [Song]
    
    init(title: String, rows: [Song]) {
        self.title = title
        self.rows = rows
    }
}

class PlaylistByGenreModel {
    
    weak var delegate: PlaylistByGenreModelDelegate?
    private let dataLoader = DataLoaderService()
    
    var sections: [Section] = []
    
    func loadData() {
        
        dataLoader.loadPlaylist { playlist in
            
            if let songs = playlist?.songs {
                
                // конвертуємо масив songs у Dictionary
                // використовуючи grouping, де $0.genre - це ключ для елементів songs,
                // у яких значення genre однакове
                let groupedSongs = Dictionary(grouping: songs) { $0.genre }
                
                // конвертуємо словник у масив [Section] і задаємо:
                // поле title - ключ
                // поле rows - значення, для ключа (сгруповані пісні за ознакою genre)
                let songSectoins: [Section] = groupedSongs.compactMap { key, value in
                    return Section(title: key, rows: value)
                }
                
                self.sections = songSectoins.sorted { $0.title < $1.title }
            }
            
            self.delegate?.dataDidLoad()
        }
        print(sections)
        for i in sections {
            print("title: \(i.title), rows:\(i.rows)")
        }
    }
}
