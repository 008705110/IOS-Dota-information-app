//
//  favHeroViewController.swift
//  hero
//
//  Created by admin on 12/4/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class favHeroViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    @IBOutlet weak var nameLabl1: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var finalName = ""
    
    static var heroes = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = finalName
        
        //debugging to make sure that array is updated
        print("Inside Fav class rn")
        print(favHeroViewController.heroes)
        print("Fav heroes array count")
        print(favHeroViewController.heroes.count)
        
        nameLabl1.text = finalName

        // Do any additional setup after loading the view.
        self.tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animeateTable()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favHeroViewController.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        //to get the selected hero from the array
        let hero = favHeroViewController.heroes[indexPath.row]
        cell.textLabel?.text = hero.localized_name
        
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "lalalalal", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroTableViewController {
            destination.hero = favHeroViewController.heroes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func tableView(_ tableView: UITableView,
                  commit editingStyle: UITableViewCell.EditingStyle,
                  forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        favHeroViewController.heroes.remove(at: indexPath.row)
        tableView.reloadData()
    } }
    
    func animeateTable (){
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }



}
    


