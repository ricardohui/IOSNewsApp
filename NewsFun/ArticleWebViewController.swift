//
//  ArticleWebViewController.swift
//  NewsFun
//
//  Created by Ricardo Hui on 30/5/2019.
//  Copyright © 2019 Ricardo Hui. All rights reserved.
//

import UIKit
import WebKit
class ArticleWebViewController: UIViewController {

   var article = Article()
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: article.url){
            webView.load(URLRequest(url:url))
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
