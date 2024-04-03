//
//  PlaylistMoveDeleteViewController.swift
//  Lesson12HW
//

//

import UIKit

class PlaylistMoveDeleteViewController: UIViewController {
    
    @IBOutlet weak var contentView: PlaylistMoveDeleteView!
    var model: PlaylistMoveDeleteModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task 3"
        
        setupInitialState()
        model.loadData()
        configureNavigationBar()
    }
    
    private func setupInitialState() {
        
        model = PlaylistMoveDeleteModel()
        
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    //MARK: - Configure NavBar
    
    private func configureNavigationBar() {
        
        let title = contentView.tableView.isEditing ? "Done" : "Edit"
        
        let barButton = UIBarButtonItem(
            title: title,
            style: .done,
            target: self,
            action: #selector(editingMode))
        
        navigationItem.rightBarButtonItem = barButton
        
        navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    
    @objc private func editingMode() {
        
        guard model.items.count != 0 else { return }
        
        contentView.tableView.isEditing = !contentView.tableView.isEditing
        configureNavigationBar()
        //print("Here action was Done: \(model.items)\n")
    }
}

extension PlaylistMoveDeleteViewController: PlaylistMoveDeleteModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

extension PlaylistMoveDeleteViewController: PlaylistMoveDeleteViewDelegate {
    
}
