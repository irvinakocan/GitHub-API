//
//  ViewController.swift
//  GitHub API networking
//
//  Created by Macbook Air 2017 on 9. 12. 2023..
//

import UIKit

class ViewController: UIViewController {
    
    var gitHubUser: GitHubUser!
    var gitHubUserView: GitHubUserView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            do {
                gitHubUser = try await Request.getUser()
                gitHubUserView = GitHubUserView(model: gitHubUser)
                setGitHubUserView()
            }
            catch MyError.INVALID_DECODING {
                print("Invalid decoding problem.")
            }
            catch MyError.INVALID_RESPONSE {
                print("Invalid response.")
            }
            catch MyError.BAD_URL {
                print("The URL was bad.")
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func setGitHubUserView() {
        view.addSubview(gitHubUserView)
        gitHubUserView.translatesAutoresizingMaskIntoConstraints = false
        gitHubUserView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        gitHubUserView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        gitHubUserView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        gitHubUserView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
    }
}

