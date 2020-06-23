//
//  ImageTableCell.swift
//  CompositionalTest
//
//  Created by Pavel Moroz on 22.06.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class ImageTableCell: UITableViewCell {

    static let reuseId = "ImageTableCell"

    var cubeImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupElements() {
        
        backgroundColor = .none

        cubeImage.translatesAutoresizingMaskIntoConstraints = false
        cubeImage.contentMode = .scaleAspectFit
        cubeImage.image = #imageLiteral(resourceName: "Block 4")

        addSubview(cubeImage)

        NSLayoutConstraint.activate([
            cubeImage.topAnchor.constraint(equalTo: topAnchor),
            cubeImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cubeImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cubeImage.leadingAnchor.constraint(equalTo: leadingAnchor)

        ])

    }

    func setupCell(image: UIImage) {
        self.cubeImage.image = image
    }

}
