//
//  custom_mind.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

var thinks: [String] = ["럭키걸 사고", "마이웨이 사고", "득도적 사고", "월급쟁이 사고"]


struct custom_mind: View {
    
    let think1 = (thinks[0],"완전 럭키비키잖아")
    let think2 = (thinks[1], "터진 입이라 내뱉었다")
    let think3 = (thinks[2], "오~케이! Bravoooo")
    let think4 = (thinks[3], "그치만 어쩌겠어.해야지")
    
    var body: some View {
        Spacer()
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:15){
                    HStack(spacing: 15){
                        thinkView(think: think1.0, desc: think1.1)
                        thinkView(think: think2.0, desc: think2.1)
                    }
                    HStack(spacing: 15){
                        thinkView(think: think3.0, desc: think3.1)
                        thinkView(think: think4.0, desc: think4.1)
                    }
                }
            }
            NavigationLink{
                
            } label: {
                YellowBtn(text: "나만의 마인드 만들기")
            }
        }
        .padding(.vertical, 60)
    }
}

struct thinkView: View {
    var think: String
    var desc: String
    
    var body: some View {
        ZStack{
            VStack(spacing: 9){
                Circle()
                    .frame(width: 74, height: 74)
                Text(think)
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: 29)
                Text(desc)
                    .font(.system(size: 11, weight: .regular))
            }
            Rectangle()
                .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
                .foregroundStyle(.white)
        }
        .frame(width: 148, height: 185)
    }
}

#Preview {
    custom_mind()
}
