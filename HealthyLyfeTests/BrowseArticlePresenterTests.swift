//
//  BrowseArticlePresenterTests.swift
//  HealthyLyfeTests
//
//  Created by Dawid Skiba on 9/30/20.
//

import XCTest
@testable import HealthyLyfe

class BrowseArticlePresenterTests: XCTestCase {

    var presenter: BrowseArticlePresenter!
    var interactor: MockBrowseArticleInteractorInput!
    var wireframe: MockBrowseArticleWireframeInterface!
    var userInterface: MockBrowseArticleUserInterface!

    private let defaultArticleSubject: ArticleSubject = .vegan

    private lazy var articleSearchResponse: ArticleSearchResponse = {
        let jsonData = JsonGenerator().jsonData(named: "articleSearchResponse")
        return try! JSONDecoder().decode(ArticleSearchResponse.self, from: jsonData)
    }()

    private lazy var sampleArticle: Article = {
        articleSearchResponse.articles.first!
    }()

    override func setUp() {
        super.setUp()

        interactor = MockBrowseArticleInteractorInput()
        wireframe = MockBrowseArticleWireframeInterface()
        userInterface = MockBrowseArticleUserInterface()

        presenter = BrowseArticlePresenter(articleSubject: defaultArticleSubject)
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        presenter.userInterface = userInterface
    }

    override func tearDown() {
        super.tearDown()

        interactor = nil
        userInterface = nil
        wireframe = nil
        presenter = nil
    }


    func test_whenDidLoad_userInterfaceConfiguresWithDefaulViewModel() throws {
        presenter.didLoad()

        XCTAssertEqual(userInterface.configureCallCount, 1)
        let spy = try XCTAssertNotNilAndUnwrap(userInterface.configureSpy)
        XCTAssertEqual(spy.count, 0)
        XCTAssertEqual(spy.navigationTitle, defaultArticleSubject.rawValue.capitalized)
        XCTAssertEqual(spy.tintColor, defaultArticleSubject.color)
    }

    func test_whenDidLoad_interactorFetches() throws {
        presenter.didLoad()

        XCTAssertEqual(interactor.fetchArticlesCallCount, 1)
        let spy = try XCTAssertNotNilAndUnwrap(interactor.fetchArticlesSpy)
        XCTAssertEqual(spy, defaultArticleSubject)
    }

    func test_whendidTapOnArticle_wireframeShowsWebview() throws {
        presenter.didTapOnArticle(sampleArticle)

        XCTAssertEqual(wireframe.showWebviewCallCount, 1)
        let spy = try XCTAssertNotNilAndUnwrap(wireframe.showWebviewSpy)
        XCTAssertEqual(spy, sampleArticle.url)
    }

    func test_whenDidFailToFetchArticles_userInterfaceShowErrorAlert() throws {
        presenter.didFailToFetchArticles(message: "oh no")

        XCTAssertEqual(userInterface.errorPopViewAlertCallCount, 1)
        let spy = try XCTAssertNotNilAndUnwrap(userInterface.errorPopViewAlertSpy)
        XCTAssertEqual(spy.message, "oh no")
    }

    func test_whenUserInterfaceShowErrorAlert_clickOnAction_wireframeDismisses() throws {
        presenter.didFailToFetchArticles(message: "oh no")

        XCTAssertEqual(userInterface.errorPopViewAlertCallCount, 1)
        let spy = try XCTAssertNotNilAndUnwrap(userInterface.errorPopViewAlertSpy)
        spy.dismissAction()

        XCTAssertEqual(wireframe.dismissCallCount, 1)
    }

    func test_whenDidFetchArticles_userInterfaceConfiguresWithCorrectViewModel() throws {
        let anArticle = sampleArticle
        presenter.didFetchArticles(articleSearchResponse.articles)

        XCTAssertEqual(userInterface.configureCallCount, 1)
        let spy = try XCTAssertNotNilAndUnwrap(userInterface.configureSpy)
        XCTAssertEqual(spy.count, 3)
        XCTAssertEqual(spy.article(at: 0)?.url, anArticle.url)

        let firstArticlePreviewViewModel = spy.articlePreviewViewModel(at: 0)
        XCTAssertEqual(firstArticlePreviewViewModel?.imageUrl, anArticle.imageUrl)
        XCTAssertEqual(firstArticlePreviewViewModel?.dateString, "Sep 15, 2020")
        XCTAssertEqual(firstArticlePreviewViewModel?.title, anArticle.title)
        XCTAssertEqual(firstArticlePreviewViewModel?.tintColor, defaultArticleSubject.color)
    }
}

private struct UnexpectedNilError: Error {}
private func XCTAssertNotNilAndUnwrap<T>(_ variable: T?, message: String = "Unexpected nil variable", file: StaticString = #file, line: UInt = #line) throws -> T {
    guard let variable = variable else {
        XCTFail(message, file: file, line: line)
        throw UnexpectedNilError()
    }
    return variable
}
