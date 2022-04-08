//
//  CuriosityPhotosViewController.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin, Vodafone on 4/8/22.
//

import UIKit

class CuriosityPhotosViewController: BaseViewController {
    
    @IBOutlet weak var curiosityPhotos: UITableView!
    
    private lazy var viewModel = CuriosityPhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPage()
        self.initViewModel()
    }
    
    private func setupPage() {
        title = "Curiosity Camera"
        viewModel.delegate = self
        curiosityPhotos.dataSource = self
        curiosityPhotos.delegate = self
        curiosityPhotos.register(UINib(nibName: CuriosityPhotosTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CuriosityPhotosTableViewCell.identifier)
    }
    
    private func initViewModel() {
        showSpinner(onView: self.view)
        viewModel.fetchPhotos()
    }
}

// MARK: - Extensions
extension CuriosityPhotosViewController: CuriosityPhotosViewModelDelegate {
    func didFetchPhotos() {
        removeSpinner()
        DispatchQueue.main.async {
            self.curiosityPhotos.reloadData()
        }
    }
    
    func showErrorAlert() {
        showError()
    }
}

extension CuriosityPhotosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.photosResponse.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CuriosityPhotosTableViewCell.identifier, for: indexPath) as? CuriosityPhotosTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.photosResponse[indexPath.row])
        cell.addShadow()
        cell.selectionStyle = .none
        return cell
    }
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (curiosityPhotos.contentSize.height - 100 - scrollView.frame.size.height) && !viewModel.isPagination {
            viewModel.fetchPhotos()
        }
    }
}
