//
//  ContentView.swift
//  PhotoList
//
//  Created by Neelesh RAI on 04/05/22.
//

import SwiftUI
import Combine


struct ContentView: View {
    
    @ObservedObject private var photoViewModel = PhotoViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach (photoViewModel.photos, id: \.id) { photo in
                    NavigationLink(destination: PhotoDetailView(selectedPhoto: photo)) {
                        PhotoRow(photo: photo)
                    }
                }
                
                LoadingView(isFailed: photoViewModel.isRequestFailed)
                    .onAppear(perform: fetchData)
                    .onTapGesture(perform: onTapLoadView)
            }
            .navigationTitle("Photo List")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }

    private func fetchData() {
        photoViewModel.getPhotos()
    }
    
    private func onTapLoadView() {
        if photoViewModel.isRequestFailed {
            photoViewModel.isRequestFailed = false
            fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*/// Uncomment this to check sample Sample Demo if both API call and offline data loading fails
struct ContentView: View {
    var photos = [
        Photo(id: 09, name: "Neelesh", avatarUrl: ""),
        Photo(id: 10, name: "Michel", avatarUrl: ""),
        Photo(id: 11, name: "Corry", avatarUrl: "")
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(photos, id: \.id) { photo in
                    NavigationLink(destination: PhotoDetailView(selectedPhoto: photo)) {
                            PhotoRow(photo: photo)
                    }
                }
            }
            .navigationTitle("Photo List")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}*/




