//
//  lucky_card.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

struct lucky_card: View {
    var body: some View {
        
        HStack{
            Text("행운 부적")
                .font(.system(size: 30, weight: .semibold))
            Spacer()
        }
        .padding(.horizontal, 24)
        
        
        ScrollView(.vertical, showsIndicators: false){
            LuckyComponent(text: "뇌도 같이 낮잠 잔건데. 저녁에 집중력                  높아지면 완전 럭키비키잖아. 완전 럭키비키잖아", category: "공부", date: "24.05.31")
                .padding(.bottom, 16)
            LuckyComponent(text: "뇌도 같이 낮잠 잔건데. 저녁에 집중력                  높아지면 완전 럭키비키잖아", category: "공부", date: "24.05.31")
                .padding(.bottom, 16)
            LuckyComponent(text: "뇌도 같이 낮잠 잔건데. 저녁에 집중력                  높아지면 완전 럭키비키잖아", category: "공부", date: "24.05.31")
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    lucky_card()
}

struct LuckyComponent: View {
    var text: String
    var category: String
    var date: String
    
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 11){
                Text(text)
                    .frame(width: 291, height: 80)
                    .font(.system(size: 18, weight: .semibold))
                    .lineLimit(3)
                    .lineSpacing(3)
                    .padding(.top, -10)
                HStack{
                    Spacer()
                    Text("\(category) / \(date)")
                        .font(.system(size: 11, weight: .regular))
                        .padding(.bottom, -10)
                }
            }
            .zIndex(1.0)
            .padding(.horizontal, 28)
            Rectangle().fill(.white)
                .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
                .frame(maxWidth: .infinity, minHeight: 132)
        }
        
    }
}
