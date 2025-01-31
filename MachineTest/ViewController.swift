
import UIKit

class ViewController: UIViewController {
    private let viewModel = NewsViewModel()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private let categoryTitle: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private let categoriesView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 75, height: 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel.categories.count)
        setupView()
    }
    
    private func setupView() {
        view.addSubview(stack)
        stack.addArrangedSubview(categoryTitle)
        stack.addArrangedSubview(categoriesView)
        stack.addArrangedSubview(UIView())
        setupCategoriesView()
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoriesView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupCategoriesView() {
        categoriesView.dataSource = self
        categoriesView.delegate = self
        categoriesView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        cell.configureWith(cat: viewModel.categories[indexPath.row].name)
        return cell
    }
}
