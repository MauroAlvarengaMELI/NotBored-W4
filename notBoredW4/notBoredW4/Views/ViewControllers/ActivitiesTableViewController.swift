//
//  ActivitiesTableViewController.swift
//  notBoredW4
//
//  Created by Rodrigo Birchner on 24/03/2022.
//

import UIKit

class ActivitiesTableViewController: UITableViewController {
        
    @IBOutlet var activityTable: UITableView!
    
    private var viewModel: ActivityViewModel = ActivityViewModel(service: ActivityService())
    private let categories: [String] = ["Education", "Recreational", "Social", "Diy", "Charity", "Cooking", "Relaxation", "Music", "Busywork"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        getCategoryList()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        cell.textLabel?.font = UIFont(name: "Futura", size: 24)
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func getCategoryList() {
        viewModel.getActivity { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showActivities(for activity: Activity) {
        let suggestionView = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        suggestionView.title = activity.activity
        navigationController?.pushViewController(suggestionView, animated: true)
    }
    
}
