//
//  GitHubUserView.swift
//  GitHub API networking
//
//  Created by Macbook Air 2017 on 9. 12. 2023..
//

import UIKit

class GitHubUserView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let username: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let biography: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    init(model: GitHubUser) {
        super.init(frame: .zero)
        
        Task {
            let data = await Request.getImageData(imageUrlString: model.avatarUrl)
            if let imageData = data {
                imageView.image = UIImage(data: imageData)
            }
            else {
                imageView.image = UIImage(systemName: "person")
            }
        }
        username.text = model.login
        biography.text = model.bio ?? "bio: none"
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(username)
        username.translatesAutoresizingMaskIntoConstraints = false
        username.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        username.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        username.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(biography)
        biography.translatesAutoresizingMaskIntoConstraints = false
        biography.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 30).isActive = true
        biography.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        biography.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
