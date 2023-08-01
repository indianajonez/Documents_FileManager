//
//  ViewController.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let manager = FolderManager()
    //let vc = ViewController()
    var nameofNewFolder: UILabel!
    
    private lazy var buttonNewFolder = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.on.folder"), style: .plain, target: self, action: #selector(plusNewFolder))
    
    private lazy var buttonNewFile = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusNewFile))
    
    private var imageView: UIImageView!
    var imagePicker: ImagePicker!

        
    private lazy var tableOfData: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.id)
        return table
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Documents"
        view.backgroundColor = .white
        layout()
        createButton()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    private func createButton() {
        navigationItem.rightBarButtonItems = [buttonNewFile, buttonNewFolder]
            
    }
    
    @objc private func plusNewFolder() {
        self.nameofNewFolder?.text = "Folder,"
        self.alert(title:"Внимание!", message: "Ведите название папки", style: .alert)
        manager.addFolder(name: "New Folder") // поженить с алерта
        tableOfData.reloadData()
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.nameofNewFolder.text! += (text?.text!)! + ("!")
        }
        alertController.addTextField() { (textField) in
            textField.isSecureTextEntry = false // скрыте текста 
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc private func plusNewFile(_ sender: UIButton) {
        manager.addFolder(name: "file.txt\(Int.random(in: 0...10000))")
        self.imagePicker.present(from: sender)
        tableOfData.reloadData()
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
        self.imageView.image = image
    }
}
