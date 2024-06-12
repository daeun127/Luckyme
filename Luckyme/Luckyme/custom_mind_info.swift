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
                    Spacer().frame(height: 50)
                    VStack(spacing: 20){
                        VStack(alignment: .leading, spacing: 20){
                                Text(think)
                                    .font(.system(size: 30, weight: .semibold))
                                    .frame(width: 311, height: 48, alignment: .leading)
                                    .background{
                                        if ((think == thinks[0]) || (think == thinks[2])){
                                            Rectangle().fill(.pointYellow)
                                                .frame(width: 150, height: 30, alignment: .leading)
                                                .padding(.leading, -160)
                                                .padding(.top, 16)
                                        } else{
                                            Rectangle().fill(.pointYellow)
                                                .frame(width: 175, height: 30, alignment: .leading)
                                                .padding(.leading, -160)
                                                .padding(.top, 16)
                                        }
                                    }
                            Text(desc)
                                .font(.system(size: 20, weight: .regular))
                                .frame(width: 311, height: 336, alignment: .topLeading)
                                .lineSpacing(6)
                        }
                        .navigationBarBackButtonHidden()
                        
                        NavigationLink(destination: custom_mind(mindName: .constant(""), mindDesc: .constant(""))){
                            WhiteBtn(text: "다른 사고 보기")
                        }
                        Spacer().frame(height: 80)
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    custom_mind_info(think: "럭키걸 사고", desc: "상황에 대한 특별하고 창의적인 해석을 통해 일상의 작은 부분에서도 긍정적이고 특별한 의미를 발견하고 즐길 수 있게 하는 사고 방식. \n \n단순히 긍정적으로 생각하는 것을 넘어, 상황 자체를 마치 특별한 이벤트처럼 느끼고, 그 속에서 긍정적이고 즐거운 감정을 최대한으로 끌어낸다.")
}
