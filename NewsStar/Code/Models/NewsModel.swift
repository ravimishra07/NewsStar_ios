//
//  NewsModel.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import Foundation


// MARK: - NewsModel
struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
  //  let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
