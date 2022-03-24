//
//  ActivitiesTableViewController.swift
//  notBoredW4
//
//  Created by Rodrigo Birchner on 24/03/2022.
//

import UIKit

class ActivitiesTableViewController: UITableViewController {
        
    @IBOutlet var activityTable: UITableView!
    
//    private var viewModel: ActivitiesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getActivitiesList()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel?.getActivitiesCount() ?? 1
        return 1 // Delete
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.font = UIFont(name: "Futura", size: 24)
        cell.textLabel?.textColor = .black
//        cell.textLabel?.text = viewModel?.getActivity2(at: indexPath.row).name
        return cell
    }
    
    func getActivitiesList() {
//        viewModel?.getActivities { [weak self] in
//            self?.tableView.reloadData()
//        }
    }
    
    func showActivities(for activity: Activity) {
        let suggestionView = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        suggestionView.title = activity.activity
        
        navigationController?.pushViewController(suggestionView, animated: true)
    }
    
}
