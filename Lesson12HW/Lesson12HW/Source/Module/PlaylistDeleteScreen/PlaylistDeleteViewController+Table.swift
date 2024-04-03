//
//  PlaylistDeleteViewController+Table.swift
//  Lesson12HW
//
//  Created by Алина Власенко on 03.04.2024.
//

import UIKit

extension PlaylistDeleteViewController: UITableViewDataSource {
    
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

extension PlaylistDeleteViewController: UITableViewDelegate {
    
    // delete row
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            model.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //print(model.items)
        }
    }
}
