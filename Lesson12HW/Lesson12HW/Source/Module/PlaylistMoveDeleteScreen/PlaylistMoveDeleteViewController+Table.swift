//
//  PlaylistMoveDeleteViewController+Table.swift
//  Lesson12HW
//
//  Created by Алина Власенко on 03.04.2024.
//

import UIKit

extension PlaylistMoveDeleteViewController: UITableViewDataSource {
    
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
    
    
    // table did move row
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let itemToMove = model.items[sourceIndexPath.row]
        model.items.remove(at: sourceIndexPath.row)
        model.items.insert(itemToMove, at: destinationIndexPath.row)
        
        //print("Change: \(model.items)\n\n")
    }
    
    // delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.model.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //print("remove: \(model.items)\n\n")
            
            if self.model.items.count == 0 {
                
                DispatchQueue.main.async {
                    self.contentView.tableView.isEditing = false
                    self.navigationItem.rightBarButtonItem?.title = "Edit"
                }
            }
        } else {
            return
        }
    }
}

extension PlaylistMoveDeleteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
