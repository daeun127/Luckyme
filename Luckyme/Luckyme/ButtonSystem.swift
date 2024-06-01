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

#Preview {
    ButtonSystem()
}
