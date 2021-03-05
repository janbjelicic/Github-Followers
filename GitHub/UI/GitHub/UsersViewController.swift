//
//  UsersViewController.swift
//  GitHub
//
//  Created by Jan Bjelicic on 05/03/2021.
//

import UIKit
import RxSwift
import RxCocoa

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    
    private var viewModel: UsersViewModel!
    private let disposeBag = DisposeBag()
    
    func configure(viewModel: UsersViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        getUsers()
    }
    
    private func setupNavigationBar() {
        title = viewModel.title
    }

    private func getUsers() {
        viewModel.getUsers().observe(on: MainScheduler.instance)
            .bind(to: tableVIew.rx.items(cellIdentifier: R.reuseIdentifier.userCell.identifier)) { _, viewModel, cell in
            cell.textLabel?.text = viewModel.name
        }.disposed(by: disposeBag)
//            .subscribe(onNext: { [weak self] users in
//            guard let self = self else { return }
//            self.tableVIew
//            print(users)
//        }, onError: { error in
//            print(error)
//        }).disposed(by: disposeBag)
    }
    
}
