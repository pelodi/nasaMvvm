//
//  NasaAPI.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin on 4/6/22.
//

import Foundation

enum RequestError: Error {
    case canNotProcessData
    case noDataAvaliable
}

class NasaAPI {
    
    //MARK: Initiliaze
    private init() {}
    
    //MARK: Proporties
    static let shared = NasaAPI()
    
    func fetchCuriosityRoverPhotos(page: Int, completion: @escaping(Result<PhotosResponse, RequestError>) -> Void) {
        let resourceURL = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=\(page)&api_key=TOwhe9uObNVPuc5bqoAOnZiorcl6hXK1j16dFqna")!
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvaliable))
                return
            }
            do {
                let photosResponse = try JSONDecoder().decode(PhotosResponse.self, from: jsonData)
                completion(.success(photosResponse))
            } catch {
                completion(.failure(.canNotProcessData))
                debugPrint(error)
            }
        }
        dataTask.resume()
    }
    
}
