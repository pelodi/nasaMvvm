//
//  CuriosityPhotosViewModel.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin on 4/7/22.
//

import Foundation

protocol CuriosityPhotosViewModelDelegate: AnyObject {
    func didFetchPhotos()
    func showErrorAlert()
}

class CuriosityPhotosViewModel {
    
    private var page = 1
    var isPagination = false
    var photosResponse = [Photos]()
    weak var delegate: CuriosityPhotosViewModelDelegate?
    
    func fetchPhotos() {
        isPagination = true
        NasaAPI.shared.fetchCuriosityRoverPhotos(page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.photosResponse.append(contentsOf: response.photos)
                self.page += 1
                self.isPagination = false
                self.delegate?.didFetchPhotos()
            case .failure:
                self.delegate?.showErrorAlert()
            }
        }
    }
    
}
