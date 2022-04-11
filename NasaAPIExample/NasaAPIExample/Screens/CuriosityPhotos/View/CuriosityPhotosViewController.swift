//
//  CuriosityPhotosViewController.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin on 4/8/22.
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
        title = "Photos from NASA"
        self.viewModel.delegate = self
        self.curiosityPhotos.dataSource = self
        self.curiosityPhotos.delegate = self
        self.curiosityPhotos.register(UINib(nibName: CuriosityPhotosTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CuriosityPhotosTableViewCell.identifier)
    }
    
    private func initViewModel() {
        self.showSpinner(onView: self.view)
        self.viewModel.fetchPhotos()
    }
}

// MARK: - Extensions
extension CuriosityPhotosViewController: CuriosityPhotosViewModelDelegate {
    func didFetchPhotos() {
        self.removeSpinner()
        DispatchQueue.main.async {
            self.curiosityPhotos.reloadData()
        }
    }
    
    func showErrorAlert() {
        self.showError()
    }
}

extension CuriosityPhotosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.photosResponse.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CuriosityPhotosTableViewCell.identifier, for: indexPath) as? CuriosityPhotosTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: self.viewModel.photosResponse[indexPath.row])
        cell.addShadow()
        cell.selectionStyle = .none
        return cell
    }
    
    //MARK: Select cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DetailPopUp.instance.showAlert(earthDateText: self.viewModel.photosResponse[indexPath.row].earth_date ?? "", cameraText: self.viewModel.photosResponse[indexPath.row].camera?.name ?? "", nameText: self.viewModel.photosResponse[indexPath.row].rover?.name ?? "", statusText: self.viewModel.photosResponse[indexPath.row].rover?.status ?? "", launchDateText: self.viewModel.photosResponse[indexPath.row].rover?.launch_date ?? "", landingDateText: self.viewModel.photosResponse[indexPath.row].rover?.landing_date ?? "", image: self.viewModel.photosResponse[indexPath.row].img_src ?? "")
    }
     
    //MARK: Method for pagination scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (self.curiosityPhotos.contentSize.height - 100 - scrollView.frame.size.height) && !self.viewModel.isPagination {
            self.viewModel.fetchPhotos()
        }
    }
}
