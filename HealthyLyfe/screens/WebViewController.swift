//
//  WebViewController.swift
//  HealthyLyfe
//
//  Created by Dawid Skiba on 10/2/20.
//

import Foundation
import WebKit

class WebViewController: UIViewController {

    private let url: URL
    private let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        webView.load(URLRequest(url: url))
    }
}

private extension WebViewController {

    func setUp() {
        view.addSubview(webView)
        webView.allowsBackForwardNavigationGestures = true
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissView))
    }

    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
