//
//  CustomTableViewCell.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 22.07.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    // MARK: - Public properties
    
    static let id: String = UUID().uuidString
    
    
    // MARK: - Private properties

    private lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public methods
    
    func setupCell(name: String) {
        self.name.text = name
    }
    
    
    // MARK: - Private methods
    
    private func layout() {
        contentView.addSubview(name)
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            name.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
