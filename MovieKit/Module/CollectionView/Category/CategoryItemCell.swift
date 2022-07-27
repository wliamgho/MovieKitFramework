//
//  CategoryItemCell.swift
//  MovieDB
//
//  Created by William on 28/02/22.
//

import UIKit
import SnapKit

public class CategoryItemCell: UICollectionViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()

    public static func size(text: String?) -> CGSize {
        guard let text = text else {
            return .zero
        }

        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 12)
        label.text = text
        label.sizeToFit()
        return CGSize(width: label.frame.width + 26, height: 32)
    }

    public var name: String? {
        didSet {
            guard let name = self.name else { return }

            containerView.layer.borderWidth = 1.5
            containerView.layer.masksToBounds = false
            containerView.layer.cornerRadius = 16
            containerView.layer.borderColor = UIColor.black.cgColor

            self.title.text = name
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        self.contentView.backgroundColor = .clear
        containerView.addSubview(title)
        self.contentView.addSubview(containerView)

        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        title.snp.makeConstraints {
            $0.edges.equalTo(containerView)
        }
    }
}
