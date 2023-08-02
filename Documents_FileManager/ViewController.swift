//
//  ViewController.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Public properties
    
    
    let manager = FolderManager()
    var nameofNewFolder = ""
    var imagePicker: ImagePicker!
    
    
    // MARK: - Private properties
    
    private lazy var buttonNewFolder = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.on.folder"), style: .plain, target: self, action: #selector(plusNewFolder))
    
    private lazy var buttonNewFile = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusNewFile))
    
    private lazy var tableOfData: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.id)
        return table
    }()
    
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Documents"
        view.backgroundColor = .white
        layout()
        createButton()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    
    // MARK: - Public methods
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.nameofNewFolder += text?.text ?? ""
            self.manager.addFolder(name: self.nameofNewFolder)
            self.tableOfData.reloadData()
        }
        alertController.addTextField() { (textField) in
            textField.isSecureTextEntry = false // скрыте текста
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Private methods
    
    private func createButton() {
        navigationItem.rightBarButtonItems = [buttonNewFile, buttonNewFolder]
    }
    
    @objc private func plusNewFolder() {
        self.alert(title:"Внимание!", message: "Ведите название папки", style: .alert)
    }
    
    @objc private func plusNewFile(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    private func layout() {
        view.addSubview(tableOfData)
        
        NSLayoutConstraint.activate([
            tableOfData.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableOfData.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableOfData.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableOfData.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}



// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}



// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id) as? CustomTableViewCell else {return UITableViewCell()}
        cell.setupCell(name: manager.items[indexPath.row])
        return cell
        
    }
}



// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate


extension ViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        if let image = image {
            self.manager.addPhoto(image: image)
            self.tableOfData.reloadData()
        }
    }
}

