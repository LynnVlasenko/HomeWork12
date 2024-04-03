//
//  MainPlaylistViewController+Table.swift
//  Lesson12HW
//
//  Created by Алина Власенко on 03.04.2024.
//

import UIKit

extension MainPlaylistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPlaylistCell")
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        cell.textLabel?.text = "\(model.items[indexPath.row].songTitle) / album: \(model.items[indexPath.row].albumTitle)"
        cell.detailTextLabel?.text = "\(model.items[indexPath.row].author) / genre: \(model.items[indexPath.row].genre)"
        
        return cell
    }
}

extension MainPlaylistViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
