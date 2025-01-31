//
//  NewsCell.swift
//  MachineTest
//
//  Created by Fauzi Arda on 31/01/25.
//

import UIKit
class NewsCell: UITableViewCell {
    static let identifier = "NewsCell"
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let imageAndTitleContainer: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private let pills: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .leading
        return stack
    }()
    
    private let newsImage: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let titleAndPublisherStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let newsTitle: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
        return label
    }()
    
    private let publisherStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    private let publisher: UILabel = {
        let label = UILabel()
        label.text = "publisher"
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    private let timestamp: UILabel = {
        let label = UILabel()
        label.text = "timestamp"
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(stack)
        stack.addArrangedSubview(imageAndTitleContainer)
        stack.addArrangedSubview(pills)
        
        imageAndTitleContainer.addArrangedSubview(newsImage)
        imageAndTitleContainer.addArrangedSubview(titleAndPublisherStack)
        titleAndPublisherStack.addArrangedSubview(newsTitle)
        titleAndPublisherStack.addArrangedSubview(publisherStack)
        publisherStack.addArrangedSubview(publisher)
        publisherStack.addArrangedSubview(timestamp)
        publisherStack.addArrangedSubview(UIView())
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            
            newsImage.widthAnchor.constraint(equalToConstant: 100),
            pills.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with news: StockNews, isMainNews: Bool) {
        guard !isMainNews else { configureMainNews(for: news); return }
        newsTitle.text = news.title
        publisher.text = news.source
        timestamp.text = news.pubDate
        
        for price in news.prices {
            pills.addArrangedSubview(getPill(for: price))
        }
        pills.addArrangedSubview(UIView())
    }
    
    private func configureMainNews(for news: StockNews) {
        pills.isHidden = true
        imageAndTitleContainer.axis = .vertical
        newsTitle.text = news.title
        publisher.text = news.source
        timestamp.text = news.pubDate
    }
    
    override func prepareForReuse() {
        newsTitle.text = "Title"
        publisher.text = "source"
        timestamp.text = "date"
        pills.isHidden = false
        imageAndTitleContainer.axis = .horizontal
        
        for view in pills.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
    
    private func getPill(for price: StockPrice) -> UIButton {
        let button = UIButton()
        button.setTitle(price.code, for: .normal)
        button.setTitleColor( .black , for: .normal)
        button.backgroundColor = .blue.withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption1)
        return button
    }
}
