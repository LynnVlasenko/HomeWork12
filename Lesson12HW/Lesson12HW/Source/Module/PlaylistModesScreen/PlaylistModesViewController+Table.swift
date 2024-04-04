//
//  PlaylistModesViewController+Table.swift
//  Lesson12HW
//
//  Created by Алина Власенко on 04.04.2024.
//

import UIKit

extension PlaylistModesViewController: UITableViewDataSource {
    
    // numberOfSections
    func numberOfSections(in tableView: UITableView) -> Int {
        switch contentView.segmentControl.selectedSegmentIndex {
        case 0:
            return 1
        case 1:
            return model.genreSections.count
        case 2:
            return model.authorSections.count
        default: return 0
        }
    }
    
    // titleForHeaderInSection
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch contentView.segmentControl.selectedSegmentIndex {
        case 0:
            return "All songs"
        case 1:
            for (index, item) in model.genreSections.enumerated() {
                if section == index {
                    return item
                }
            }
        case 2:
            for (index, item) in model.authorSections.enumerated() {
                if section == index {
                    return item
                }
            }
        default: return "no name"
        }
        return "no name"
    }
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var counter = 0
        
        switch contentView.segmentControl.selectedSegmentIndex {
        case 0:
            return model.items.count
        case 1:
            for (index, item) in model.genreSections.enumerated() {
                if index == section {
                    for d in model.items {
                        if item == d.genre {
                            counter += 1
                        }
                    }
                }
            }
            return counter
        case 2:
            for (index, item) in model.authorSections.enumerated() {
                if index == section {
                    for d in model.items {
                        if item == d.author {
                            counter += 1
                        }
                    }
                }
            }
            return counter
        default: return model.items.count
        }
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
        
        switch contentView.segmentControl.selectedSegmentIndex {
        case 0:
            cell.textLabel?.text = "\(model.items[indexPath.row].songTitle) / album: \(model.items[indexPath.row].albumTitle)"
            cell.detailTextLabel?.text = "\(model.items[indexPath.row].author) / genre: \(model.items[indexPath.row].genre)"
        case 1:
            for (index, item) in model.genreSections.enumerated() {
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
        case 2:
            for (index, item) in model.authorSections.enumerated() {
                if index == indexPath.section {
                    for d in model.items {
                        if item == d.author {
                            text.append("\(d.songTitle) / album: \(d.albumTitle)")
                            subtext.append("\(d.author) / genre: \(d.genre)")
                        }
                    }
                }
            }
            cell.textLabel?.text = text[indexPath.row]
            cell.detailTextLabel?.text = subtext[indexPath.row]
        default: return cell
        }
        return cell
    }
}

extension PlaylistModesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

