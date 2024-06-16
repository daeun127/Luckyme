//
//  Home.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI
import Combine

struct Home: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Color.pointYellow
                    .ignoresSafeArea()
                GeometryReader { geometry in
                    VStack(spacing: 45) {
                        VStack {
                            HStack {
                                Image("Luckyme 1")
                                    .padding(.top, 30)
                                    .padding(.leading, 26)
                                Spacer()
                            }
                            Text("나의 고민을\n다양한 사고로 바라보자!")
                                .font(.system(size: 28, weight: .medium))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                                .frame(height: 300)
                        }
                        .background(Color.mainPurple)
                        AutoScrollingImageScrollView(images: img)
                            .frame(height: 170)
                        NavigationLink(destination: worryBefore()){
                            WhiteBtn(text: "마인드 체인지 하러가기")
                        }
                        
                    }
                }
                
            }
        }
    }
    
    struct AutoScrollingImageScrollView: View {
        let images: [String]
        @State private var currentIndex = 0
        private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        var body: some View {
            GeometryReader { geometry in
                let imageWidth: CGFloat = 145
                let spacing: CGFloat = 20
                let totalWidth = CGFloat(images.count) * (imageWidth + spacing)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: spacing) {
                        ForEach(images + images, id: \.self) { imageName in // Duplicate the array
                            Image(imageName)
                                .resizable()
                                .frame(width: imageWidth, height: imageWidth)
                                .clipped()
                        }
                    }
                    .frame(width: totalWidth * 2, height: imageWidth) // Double the total width
                    .offset(x: -CGFloat(currentIndex) * (imageWidth + spacing), y: 0)
                    .offset(x: (geometry.size.width - totalWidth) / 2, y: 0)
                    .onReceive(timer) { _ in
                        withAnimation {
                            currentIndex += 1
                            if currentIndex == images.count {
                                currentIndex = 0
                            }
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    Home()
}
