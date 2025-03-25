//
//  ImageLoader.swift
//  HeroApp
//
//  Created by Madina Abdulgafar on 20.03.2025.
//

import Foundation
import SwiftUI

struct AsyncImageView: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}
