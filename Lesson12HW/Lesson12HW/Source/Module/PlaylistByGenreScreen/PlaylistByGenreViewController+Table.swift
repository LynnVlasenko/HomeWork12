//
//  PlaylistByGenreViewController+Table.swift
//  Lesson12HW
//
//  Created by Алина Власенко on 04.04.2024.
//

import UIKit

extension PlaylistByGenreViewController: UITableViewDataSource {
    
    // numberOfSections
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    // titleForHeaderInSection
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        for (index, item) in model.sections.enumerated() {
            if section == index {
                return item
            }
        }
        return "no name"
    }
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var counter = 0
        
        for (index, item) in model.sections.enumerated() {
            if index == section {
                for d in model.items {
                    if item == d.genre {
                        counter += 1
                    }
                }
                
            }
        }
        return counter
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPlaylistCell")
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        var text: [String] = []
        var subtext: [String] = []
        
        for (index, item) in model.sections.enumerated() {
            if index == indexPath.section {
                for d in model.items {
                    if item == d.genre {
                        text.append("\(d.songTitle) / album: \(d.albumTitle)")
                        subtext.append("\(d.author) / genre: \(d.genre)")
                    }
                }
            }
        }
        
        cell.textLabel?.text = text[indexPath.row]
        cell.detailTextLabel?.text = subtext[indexPath.row]
        
        return cell
    }
}

extension PlaylistByGenreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
