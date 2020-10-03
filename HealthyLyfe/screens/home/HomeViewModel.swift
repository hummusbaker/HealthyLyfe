//
//  HomeViewModel.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import UIKit

struct HomeViewModel {

    typealias BookSection = (title: String, books: [Book])

    private let articleSubjects: [ArticleSubject]
    private let books: [Book]
    let sections: [HomeViewModelItem]

    init(articleSubjects: [ArticleSubject] = ArticleSubject.allCases, books: [Book]) {
        var tempSections = [HomeViewModelItem]()

        self.articleSubjects = articleSubjects
        if !articleSubjects.isEmpty {
            tempSections.append(ArticlesHomeItem(articleSubjects: articleSubjects))
        }

        self.books = books
        if !books.isEmpty {
            tempSections.append(BooksHomeItem(books: books))
        }

        sections = tempSections
    }

    static var `default`: HomeViewModel{
        HomeViewModel(books: [])
    }
}

extension HomeViewModel {

    var sectionsCount : Int {
        sections.count
    }

    func rowCount(at section: Int) -> Int {
        sections[section].rowCount
    }

    func articleSubject(at index: Int) -> ArticleSubject? {
        if index < 0 || index >= articleSubjects.count {
            return nil
        }

        return articleSubjects[index]
    }

    func articleSubjectViewModel(at index: Int) -> ArticleSubjectViewModel? {
        guard let theArticleSubject = articleSubject(at: index) else {
            return nil
        }

        return ArticleSubjectViewModel(articleSubject: theArticleSubject)
    }

    var bookStackViewModel: BookStackViewModel? {
        BookStackViewModel(books: books)
    }
}

protocol HomeViewModelItem {

    var type: HomeSectionType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
}

enum HomeSectionType {
    case articles
    case books
}

struct ArticlesHomeItem: HomeViewModelItem {

    let type: HomeSectionType = .articles
    let sectionTitle = "Search articles by subject".uppercased()
    let rowCount: Int

    let articleSubjects: [ArticleSubject]

    init(articleSubjects: [ArticleSubject]) {
        self.articleSubjects = articleSubjects
        rowCount = articleSubjects.count
    }
}

struct BooksHomeItem: HomeViewModelItem {

    let type: HomeSectionType = .books
    let sectionTitle = "Browse advice books".uppercased()
    let rowCount = 1

    let books: [Book]

    init(books: [Book]) {
        self.books = books
    }
}
