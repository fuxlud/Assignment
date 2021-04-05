//
//  ImageDetailsViewController.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import UIKit

class ImageDetailsViewController: UIViewController {

    public var viewModel: ImageDetailsViewModel?

    @IBOutlet private var numberOfLikesLabel: UILabel!
    @IBOutlet private var bigImageView: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var userThumbnailImageView: UIImageView!
    @IBOutlet private var userFullNameLabel: UILabel!
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var userBioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(viewModel: viewModel)
    }
}

extension ImageDetailsViewController: Presentable {
    internal func setupView(viewModel: Modelling?) {
        guard let viewModel = viewModel as? ImageDetailsViewModel else {
            return
        }
        
        numberOfLikesLabel.text = viewModel.likes
        bigImageView?.af.setImage(withURL: viewModel.imageURL)
        descriptionLabel.text = viewModel.description
        if let userImageURL = viewModel.userImageURL {
            userThumbnailImageView?.af.setImage(withURL: userImageURL)
        }
        userFullNameLabel.text = viewModel.name
        usernameLabel.text = viewModel.username
        userBioLabel.text = viewModel.bio
    }
}
