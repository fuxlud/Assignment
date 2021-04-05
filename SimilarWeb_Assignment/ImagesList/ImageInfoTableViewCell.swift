//
//  ImageInfoTableViewCell.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ImageInfoTableViewCell: UITableViewCell {
    
    private var viewModel: ImageInfoViewModel?
    
    @IBOutlet private var iconImageView: UIImageView?
    @IBOutlet private var descriptionLabel: UILabel?
}

extension ImageInfoTableViewCell: Presentable {
    internal func setupView(viewModel: Modelling?) {
        guard let viewModel = viewModel as? ImageInfoViewModel else {
            return
        }
        
        descriptionLabel?.text = viewModel.description
        iconImageView?.af.setImage(withURL: viewModel.imageURL)
    }
}
