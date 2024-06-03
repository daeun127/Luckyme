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
            VStack(spacing: 20){
                VStack(alignment: .leading, spacing: 20){
                    Text(think)
                        .font(.system(size: 30, weight: .semibold))
                        .frame(width: 311, height: 48, alignment: .leading)
                    Text(desc)
                        .font(.system(size: 20, weight: .regular))
                        .frame(width: 311, height: 336, alignment: .topLeading)
                }
                .navigationBarBackButtonHidden()
                
                NavigationLink(destination: custom_mind(mindName: .constant(""), mindDesc: .constant(""))){
                    WhiteBtn(text: "다른 사고 보기")
                }
            }
        }
    }
}

#Preview {
    custom_mind_info(think: "사고", desc: "설명")
}
