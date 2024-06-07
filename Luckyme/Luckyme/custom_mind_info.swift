//
//  custom_mind_info.swift
//  Luckyme
//
//  Created by DaeunLee on 6/2/24.
//

import SwiftUI

struct custom_mind_info: View {
    var think: String
    var desc: String
    var body: some View {
        NavigationStack{
            ZStack{
                Color.subGray
                    .ignoresSafeArea()
                VStack{
                    Header()
                    VStack(spacing: 20){
                        VStack(alignment: .leading, spacing: 20){
                            ZStack{
                                Text(think)
                                    .font(.system(size: 30, weight: .semibold))
                                    .frame(width: 311, height: 48, alignment: .leading)
                                if ((think == thinks[0]) || (think == thinks[2])){
                                    Rectangle().fill(changeColor(think: think))
                                        .frame(width: 150, height: 30, alignment: .leading)
                                        .position(x:110, y:112)
                                        .zIndex(-1)
                                } else{
                                    Rectangle().fill(changeColor(think: think))
                                        .frame(width: 175, height: 30, alignment: .leading)
                                        .position(x:120, y:112)
                                        .zIndex(-1)
                                }
                                
                            }
                            Text(desc)
                                .font(.system(size: 20, weight: .regular))
                                .frame(width: 311, height: 336, alignment: .topLeading)
                                .padding(.leading, 36)
                        }
                        .navigationBarBackButtonHidden()
                        
                        NavigationLink(destination: custom_mind(mindName: .constant(""), mindDesc: .constant(""))){
                            WhiteBtn(text: "다른 사고 보기")
                        }
                        Spacer()
                    }
                }
                
            }
            
        }
    }
}

func changeColor(think: String) -> Color{
    let color: Color = Color.think1
    
    if (think == thinks[0]){
        return Color.think1
    } else if (think == thinks[1]){
        return Color.think2
    } else if (think == thinks[2]){
        return Color.think3
    } else if (think == thinks[3]){
        return Color.think4
    }
    
    return color
}
#Preview {
    custom_mind_info(think: "럭키걸 사고", desc: "설명")
}
