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
            return model.genreSections[section].title
        case 2:
            return model.authorSections[section].title
        default: return "no name"
        }
    }
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch contentView.segmentControl.selectedSegmentIndex {
        case 0:
            return model.items.count
        case 1:
            return model.genreSections[section].rows.count
        case 2:
            return model.authorSections[section].rows.count
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
        
        switch contentView.segmentControl.selectedSegmentIndex {
        case 0:
            cell.textLabel?.text = "\(model.items[indexPath.row].songTitle) / album: \(model.items[indexPath.row].albumTitle)"
            cell.detailTextLabel?.text = "\(model.items[indexPath.row].author) / genre: \(model.items[indexPath.row].genre)"
        
        case 1:
            cell.textLabel?.text = "\(model.genreSections[indexPath.section].rows[indexPath.row].songTitle) / album: \(model.genreSections[indexPath.section].rows[indexPath.row].albumTitle)"
            cell.detailTextLabel?.text = "\(model.genreSections[indexPath.section].rows[indexPath.row].author) / genre: \(model.genreSections[indexPath.section].rows[indexPath.row].genre)"
        
        case 2:
            cell.textLabel?.text = "\(model.authorSections[indexPath.section].rows[indexPath.row].songTitle) / album: \(model.authorSections[indexPath.section].rows[indexPath.row].albumTitle)"
            cell.detailTextLabel?.text = "\(model.authorSections[indexPath.section].rows[indexPath.row].author) / genre: \(model.authorSections[indexPath.section].rows[indexPath.row].genre)"
        default: return cell
        }
        return cell
    }
}

extension PlaylistModesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

