//
//  TabBarViewController.swift
//  notBoredW4
//
//  Created by Mauro Emmanuel Alvarenga on 25/03/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
        let firstTabTitle = "Categories"
        let firstTabImage = UIImage(systemName: "list.dash")
        
        let firstTabViewController = ActivitiesTableViewController(nibName: "ActivitiesTableViewController", bundle: nil)
        firstTabViewController.title = firstTabTitle
        
        let firstTabNavigationController = UINavigationController(rootViewController: firstTabViewController)
        let firstTabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
        firstTabNavigationController.tabBarItem = firstTabBarItem
        
        let secondTabTitle = "Random"
        let secondTabImage = UIImage(systemName: "shuffle")
        
        let secondTabViewController = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        secondTabViewController.title = secondTabTitle
        
        let secondTabNavigationController = UINavigationController(rootViewController: secondTabViewController)
        let secondTabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: nil)
        secondTabNavigationController.tabBarItem = secondTabBarItem
        
        viewControllers = [firstTabNavigationController, secondTabNavigationController]
        
        setNavBarAppeareance(firstTabNavigationController.navigationBar)
        setNavBarAppeareance(secondTabNavigationController.navigationBar)
        setTabBarAppeareance(self.tabBar)
    }
    
    func setNavBarAppeareance(_ navbar: UINavigationBar) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.darkText, .font: UIFont(name: "Futura", size: 32)!]
        navbar.standardAppearance = appearance
        navbar.scrollEdgeAppearance = appearance
        navbar.compactAppearance = appearance
    }

    func setTabBarAppeareance(_ tabBar: UITabBar) {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        appearance.compactInlineLayoutAppearance.normal.iconColor = .darkText
        appearance.compactInlineLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.darkText, .font: UIFont(name: "Futura", size: 12)!]
        
        appearance.inlineLayoutAppearance.normal.iconColor = .darkText
        appearance.inlineLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.darkText, .font: UIFont(name: "Futura", size: 12)!]
        
        appearance.stackedLayoutAppearance.normal.iconColor = .darkText
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.darkText, .font: UIFont(name: "Futura", size: 12)!]
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        tabBar.tintColor = .systemBlue
    }
}
