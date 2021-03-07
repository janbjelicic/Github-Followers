//
//  UserDetailsViewController.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import UIKit
import RxSwift
import RxCocoa

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBlog: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblTwitter: UILabel!
    
    private var viewModel: UserDetailsViewModel!
    private let disposeBag = DisposeBag()
    
    func configure(viewModel: UserDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupBindings()
    }
    
    private func setupNavigationBar() {
        title = viewModel.title
    }
    
    private func setupBindings() {
        viewModel.user.drive(onNext: { [weak self] user in
            guard let self = self else { return }
            self.lblName.text = "Name: " + (user.name ?? "not available")
            self.lblBlog.text = "Blog: " + (user.blog ?? "not available")
            self.lblLocation.text = "Location: " + (user.location ?? "not available")
            self.lblTwitter.text = "Twitter username: " + (user.twitterUsername ?? "not available")
        }).disposed(by: disposeBag)
    }
    
}
