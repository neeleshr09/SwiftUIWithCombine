//
//  PhotoViewModel.swift
//  PhotoList
//
//  Created by Neelesh RAI on 04/05/22.
//

import Foundation
import Combine

class PhotoViewModel: ObservableObject {
    
    @Published var photos: [Photo] = []
    @Published var isRequestFailed = false
    
    private let pageLimit = 20
    private var currentLastID: Int? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func getPhotos() {
        NetworkManager.shared.getData(endpoint: .users, type: Photo.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                    // show offline data if API calling fails
                    self.photos = photosData
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] photosData in
                self?.photos = photosData
            }
            .store(in: &cancellables)
    }
}
