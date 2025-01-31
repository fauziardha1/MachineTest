//
//  NewsDetailViewController.swift
//  MachineTest
//
//  Created by Fauzi Arda on 31/01/25.
//

import WebKit

class NewsDetailViewController: UIViewController {
    var source = "https://www.apple.com"
    
    private var webView: WKWebView = {
        let view = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "arrowBack")?.withTintColor(.black), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(webView)
        backButton.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            webView.topAnchor.constraint(equalTo: backButton.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let myURL = URL(string:source)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    @objc private func dismissPage() {
        self.dismiss(animated: true)
    }
}

