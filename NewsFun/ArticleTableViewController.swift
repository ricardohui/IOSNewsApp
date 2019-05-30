//
//  ArticleTableViewController.swift
//  NewsFun
//
//  Created by Ricardo Hui on 30/5/2019.
//  Copyright © 2019 Ricardo Hui. All rights reserved.
//

import UIKit
import Kingfisher
class ArticleTableViewController: UITableViewController {

    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsHelper().getArticles{(articles) in
            self.articles = articles
            self.tableView.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell{
            
            let article = articles[indexPath.row]
            cell.titleLabel.text = article.title
            cell.categoryLabel.text = article.category
            let url = URL(string: article.urlToImage)
            cell.articleImageView.kf.setImage(with: url)
                return cell
        }

        // Configure the cell...
        return UITableViewCell()
        
    }
 
}

class ArticleCell : UITableViewCell{
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var categoryLabel: UILabel!
    
    @IBOutlet var articleImageView: UIImageView!
    
}
