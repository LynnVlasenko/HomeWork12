//
//  PlaylistModesViewController.swift
//  Lesson12HW
//

//

import UIKit

class PlaylistModesViewController: UIViewController {
    
    @IBOutlet weak var contentView: PlaylistModesView!
    var model: PlaylistModesModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task 5"
        
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        
        model = PlaylistModesModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

extension PlaylistModesViewController: PlaylistModesModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

extension PlaylistModesViewController: PlaylistModesViewDelegate {
    
}
