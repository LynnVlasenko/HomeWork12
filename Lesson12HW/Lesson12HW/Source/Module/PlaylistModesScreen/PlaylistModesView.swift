//
//  PlaylistModesView.swift
//  Lesson12HW
//

//

import UIKit

protocol PlaylistModesViewDelegate: AnyObject {
    
}

class PlaylistModesView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func didGangeSegment(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    weak var delegate: PlaylistModesViewDelegate?
}
