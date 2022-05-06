//
//  PhotoRow.swift
//  PhotoList
//
//  Created by Neelesh RAI on 04/05/22.
//

import SwiftUI

struct PhotoRow: View {
    
    let photo: Photo
    var body: some View {
        HStack (spacing: 12) {
//            Image("userPlaceHolder") // uncomment this to check sample demo
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: photo.avatarUrl)) { image in
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            } else {
                // Fallback on earlier versions
                Image(photo.avatarUrl )
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }
            Text(photo.name)
                .textCase(.uppercase)
        }
        .padding(8)
    }
}

struct PhotoRow_Previews: PreviewProvider {
    static var previews: some View {
        let mockData = Photo(id: 1, name: "Test", avatarUrl: "")
        PhotoRow(photo: mockData)
    }
}
