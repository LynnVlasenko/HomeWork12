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
        
        return model.sections[section].title
    }
    
    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.sections[section].rows.count
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPlaylistCell")
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        cell.textLabel?.text = "\(model.sections[indexPath.section].rows[indexPath.row].songTitle) / album: \(model.sections[indexPath.section].rows[indexPath.row].albumTitle)"
        
        cell.detailTextLabel?.text = "\(model.sections[indexPath.section].rows[indexPath.row].author) / genre: \(model.sections[indexPath.section].rows[indexPath.row].genre)"
        
        return cell
    }
}

extension PlaylistByGenreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
