//
//  worryAfter.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI


struct worryAfter: View {
    
    var body: some View {
        TabView{
            
            TextComponent(think: thinks[0], result: "물이 딱 반 정도 남았네! 다 먹기엔 너무 많고 덜 먹기엔 너무 적고 그래서 딱 반만 있었으면 좋겠다고 생각했는데 완전 럭키비키잖아🍀")
            TextComponent(think: thinks[1], result: "물이 딱 반 정도 남았네! 다 먹기엔 너무 많고 덜 먹기엔 너무 적고 그래서 딱 반만 있었으면 좋겠다고 생각했는데 완전 럭키비키잖아🍀")
            TextComponent(think: thinks[2], result: "물이 딱 반 정도 남았네! 다 먹기엔 너무 많고 덜 먹기엔 너무 적고 그래서 딱 반만 있었으면 좋겠다고 생각했는데 완전 럭키비키잖아🍀")
            TextComponent(think: thinks[3], result: "물이 딱 반 정도 남았네! 다 먹기엔 너무 많고 덜 먹기엔 너무 적고 그래서 딱 반만 있었으면 좋겠다고 생각했는데 완전 럭키비키잖아🍀")
        }
        .padding(.vertical, 100)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        

    }
}

#Preview {
    worryAfter()
}

struct TextComponent: View {
    var think: String
    var result: String
    
    var body: some View {
        ZStack{
            VStack(spacing: -44){
                Circle().fill(.black)
                    .frame(width: 88, height: 88)
                    .zIndex(1.0)
                Rectangle().fill(.white)
                    .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
                    .frame(width: 308, height: 399)
            }
            .overlay{
                VStack(alignment: .leading, spacing: 6){
                    Text(result)
                        .lineSpacing(6)
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 252, height: 265, alignment: .leading)
                        .position(x: 150, y: 230)
                    Text(think)
                        .font(.system(size: 14, weight: .medium))
                        .padding(.bottom, 28)
                        .padding(.leading, 21)
                }
            }
        }
    }
}
