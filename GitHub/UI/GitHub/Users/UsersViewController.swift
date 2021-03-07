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
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: UsersViewModel!
    private let disposeBag = DisposeBag()
    
    func configure(viewModel: UsersViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        seupObservers()
        getUsers()
    }
    
    private func setupNavigationBar() {
        title = viewModel.title
    }

    private func getUsers() {
        viewModel.getUsers()
            .observe(on: MainScheduler.instance)
            .catch({ error in
                // Handle errors, perhaps show an alert.
                print(error)
                return Observable.never()
            })
            .bind(to: tableView.rx.items(cellIdentifier: R.reuseIdentifier.userCell.identifier)) { _, viewModel, cell in
            cell.textLabel?.text = viewModel.name
        }.disposed(by: disposeBag)
    }
    
    private func getUser(indexPath: IndexPath) {
        viewModel.getUser(index: indexPath.row)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] user in
            guard let self = self else { return }
            self.viewModel.showDetails(user: user)
        }, onError: { error in
            // Handle errors, perhaps show an alert.
            print(error)
        }).disposed(by: disposeBag)
    }
    
    private func seupObservers() {
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            self.tableView.deselectRow(at: indexPath, animated: true)
            self.getUser(indexPath: indexPath)
        }).disposed(by: disposeBag)
    }
    
}
