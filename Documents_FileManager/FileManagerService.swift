//
//  FolderManager.swift
//  Documents_FileManager
//
//  Created by Ekaterina Saveleva on 22.07.2023.
//
import Foundation

protocol FileManagerServiceProtocol {
    // Создание нового файлв
    func createNewFolder(url: URL)
    // Создание нового файла
    func addFile(url: URL, name: String, data: Data)
    // Удаление файла
    func deleteFile(path: String)
}

final class FileManagerService: FileManagerServiceProtocol {
    func createNewFolder(url: URL) {
        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: false)
        } catch {
            print(error.localizedDescription)
        }
    }

    func addFile(url: URL, name: String, data: Data) {
        let imagePath = url.appendingPathComponent(name)
        FileManager.default.createFile(atPath: imagePath.path, contents: data, attributes: nil)
    }

    func deleteFile(path: String) {
        do {
            try FileManager.default.removeItem(atPath: path)
        } catch {
            print(error)
        }
    }
}

//class FolderManager {
//
//
//    // MARK: - Public properties
//
//    var pathForCurrentFolder: String
//    // вычисляемое свойство выводит все файлы и папки в массив
//    var items: [String] {
//       (try? FileManager.default.contentsOfDirectory(atPath: pathForCurrentFolder)) ?? []
//    }
//
//
//    // MARK: - Init
//
//    init() {
//        self.pathForCurrentFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//    }
//
//    init(pathForCurrentFolder: String) {
//        self.pathForCurrentFolder = pathForCurrentFolder
//    }
//
//
//    // MARK: - Public methods
//
//
//    func addFile(name: String, content: String) {
//        let url = URL(filePath: pathForCurrentFolder + "/" + name)
//        try? content.data(using: .utf8)?.write(to: url)
//    }
//
//    func addFolder(name: String) {
//       try? FileManager.default.createDirectory(atPath: pathForCurrentFolder + "/" + name, withIntermediateDirectories: true)
//    }
//
//    func addPhoto(image: UIImage) {
//        if let data = image.jpegData(compressionQuality: 1) {
//            let path = URL(filePath: pathForCurrentFolder + "/" + String(describing: image))
//            try? data.write(to: path)
//        }
//    }
//
//    //метод, который позволяет отсортировать папки и файлы. Этот код надо просто запомнить:)
//    func isDerictory(atIndex index: Int) -> Bool {
//        let name = items[index]
//        let path = pathForCurrentFolder + "/" + name
//        var objBool: ObjCBool = false
//        FileManager.default.fileExists(atPath: path, isDirectory: &objBool)
//
//        return objBool.boolValue
//    }
//
//    func getFullPath(atIndex index: Int) -> String {
//        pathForCurrentFolder + "/" + items[index]
//    }
//
//    func deleteItem(atIndex index: Int) {
//        let path = pathForCurrentFolder + "/" + items[index]
//        try? FileManager.default.removeItem(atPath: path)
//    }
//}
//
