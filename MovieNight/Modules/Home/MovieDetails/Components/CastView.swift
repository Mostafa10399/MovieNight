//
//  CastView.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import SwiftUI
import CoreKit

struct CastView: View {
    
    // MARK: - Properties
    
    let castMember: CastMemberPresentable
    
    // MARK: - CodeView
    
    var body: some View {
        VStack(spacing: 4) {
            AsyncImage(url: castMember.profileUrl, transaction: .init(animation: .bouncy(duration: 0.2)), content: { imageState in
                switch imageState {
                case .empty:
                    ZStack {
                        Color.gray
                            .opacity(0.4)
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                @unknown default:
                    Image(systemName: "photo")
                        .resizable()
                }
            })
            .clipShape(Circle())
            .frame(width: 90, height: 90)
            VStack(spacing: 2) {
                Text(castMember.name)
                    .lineLimit(1)
                    .font(.custom("Montserrat-Medium", size: 12))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(.accent)
                Text(castMember.characterName)
                    .lineLimit(1)
                    .font(.custom("Montserrat-Regular", size: 12))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(.accent)
            }
            .frame(width: 90)
        }
    }
}
