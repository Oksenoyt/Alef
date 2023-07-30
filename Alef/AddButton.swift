//
//  AddButton.swift
//  Alef
//
//  Created by Oksenoyt on 30.07.2023.
//

import UIKit

final class AddButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupButton() {
        let image = UIImage(systemName: "plus.circle.fill")
        let scale: CGFloat = 2
        setImage(image, for: .normal)
        tintColor = #colorLiteral(red: 0.368627451, green: 0.5764705882, blue: 0.6117647059, alpha: 1)
        transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
