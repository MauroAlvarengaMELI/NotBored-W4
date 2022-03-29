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
    private let categories: [String] = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        cell.textLabel?.font = UIFont(name: "Futura", size: 24)
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = categories[indexPath.row].capitalized
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showActivities(forType: categories[indexPath.row])
    }
    
    func showActivities(forType type: String) {
        let suggestionView = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        suggestionView.title = type.capitalized
        suggestionView.type = type
        navigationController?.pushViewController(suggestionView, animated: true)
    }
    
}
