//
//  ImagesListViewController.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import UIKit

class ImagesListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView?
    
    private var networkProxy = NetworkProxy()
    private var imageInfos: [ImageInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImagesInfo()
    }
    
    private func fetchImagesInfo() {
        networkProxy.fetchImagesInfo { [weak self] result in
            switch result {
            case let .failure(error):
                self?.showError(error: error)
            case let .success(imageInfos):
                self?.imageInfos = imageInfos
                self?.tableView?.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let imageDetailsViewController = segue.destination as? ImageDetailsViewController {
            guard let imageInfo = sender as? ImageInfo else {
                return
            }
            
            let imageInfoViewModel = ImageDetailsViewModel(with: imageInfo)
            imageDetailsViewController.viewModel = imageInfoViewModel
        }
    }
}

extension ImagesListViewController: UISearchBarDelegate {
    
    internal func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("")
    }
}

extension ImagesListViewController: UITableViewDataSource {
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageInfos.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageInfoTableViewCell.className, for: indexPath) as? ImageInfoTableViewCell else {
            return UITableViewCell()
        }

        let imageInfo = imageInfos[indexPath.row]
        let imageInfoViewModel = ImageInfoViewModel(with: imageInfo)

        cell.setupView(viewModel: imageInfoViewModel)
        return cell
    }
}

extension ImagesListViewController: UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageInfo = imageInfos[indexPath.row]
        self.performSegue(withIdentifier: ImageDetailsViewController.className, sender: imageInfo)
    }
}

