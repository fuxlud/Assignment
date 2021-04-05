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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ImageDetailsViewController: Presentable {
    internal func setupView(viewModel: Modelling?) {
        guard let viewModel = viewModel as? ImageDetailsViewModel else {
            return
        }
    }
}
