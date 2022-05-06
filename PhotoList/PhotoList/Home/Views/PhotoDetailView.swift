//
//  PhotoDetailView.swift
//  PhotoList
//
//  Created by Neelesh RAI on 04/05/22.
//

import SwiftUI
import Combine

struct PhotoDetailView: View {
    var selectedPhoto: Photo
    
    var body: some View {
        NavigationView {
            VStack{
                if #available(iOS 15.0, *) {
                    AsyncImage(url: URL(string: selectedPhoto.avatarUrl)) { image in
                        image
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    // Fallback on earlier versions
                    Image(selectedPhoto.avatarUrl )
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }
                HStack {
                    Text("Name: ")
                    Text(selectedPhoto.name)
                        .textCase(.uppercase)
                }
                HStack {
                    Text("ID: ")
                    Text("\(selectedPhoto.id )")
                }
            }
            .navigationTitle(selectedPhoto.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PhotoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailView(selectedPhoto: Photo(id: 1, name: "placeholder", avatarUrl: ""))
    }
}
