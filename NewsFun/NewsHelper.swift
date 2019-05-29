//
//  NewsHelper.swift
//  NewsFun
//
//  Created by Ricardo Hui on 30/5/2019.
//  Copyright © 2019 Ricardo Hui. All rights reserved.
//

import Foundation
import Alamofire
import DocumentClassifier
class NewsHelper{
    
    func getArticles(){
        Alamofire.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=7bda0004bed94053b1cfbc6442f45105").responseJSON { (response) in
            print(response)
            if let json = response.result.value as? [String: Any]{
                if let jsonArticles = json["articles"] as? [[String:Any]]{
                    var articles = [Article]()
                    for jsonArticle in jsonArticles{
                        guard let title = jsonArticle["title"] as? String, let urlToImage = jsonArticle["urlToImage"] as? String, let url = jsonArticle["url"] as? String, let description = jsonArticle["description"] as? String else{
                            continue
                        }
                        let article = Article()
                        article.title = title
                        article.urlToImage = urlToImage
                        article.url = url
                        article.description = description
            
                        guard let classification = DocumentClassifier().classify(description) else { return }
                        print(classification.prediction) // Technology: 0.42115752953489294
                        article.category = classification.prediction.category.rawValue
                        articles.append(article)
                    }
                }
            }
        }
    }
}

class Article{
    var title = ""
    var urlToImage = ""
    var url = ""
    var description = ""
    var category = ""
}
