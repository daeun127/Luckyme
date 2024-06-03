//
//  ButtonSystem.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

struct ButtonSystem: View {
    var body: some View {
        YellowBtn(text: "나만의 마인드 만들기")
        WhiteBtn(text: "마인드 체인지")
        myView(text: "알림 설정")
        myPageIcon()
        
        
    }
}

struct YellowBtn: View {
    var text: String
    
    var body: some View {
        Rectangle().fill(.pointYellow)
            .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
            .frame(width: 310, height: 59)
            .overlay{
                Text(text)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
            }
    }
}

struct WhiteBtn: View {
    var text: String
    
    var body: some View {
        Rectangle().fill(.white)
            .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
            .frame(width: 310, height: 59)
            .overlay{
                Text(text)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.black)
            }
    }
}

struct myView: View {
    var text: String
    
    var body: some View {
        Rectangle().fill(.white)
            .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
            .frame(width: 343, height: 60)
            .overlay{
                HStack{
                    Text(text)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: "chevron.")
                }
                .padding(.horizontal, 22)
                
            }
    }
}

struct myPageIcon: View {
    var body: some View {
        NavigationLink(destination: my()){
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 44, alignment: .center)
            
        }
        .foregroundStyle(.black)
        
    }
}

#Preview {
    ButtonSystem()
}
