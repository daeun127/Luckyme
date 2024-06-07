//
//  make_custom_mind.swift
//  Luckyme
//
//  Created by DaeunLee on 6/2/24.
//

import SwiftUI

struct make_custom_mind: View {
    @State private var mindName: String = ""
    @State private var mindDesc: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.subGray
                    .ignoresSafeArea()
                VStack{
                    Header()
                    VStack(alignment: .leading, spacing: 44){
                        VStack(alignment: .leading, spacing: 8){
                            Text("마인드 이름")
                                .font(.system(size: 24, weight: .semibold))
                            TextField("OO적 사고", text: $mindName)
                                .padding()
                                .border(Color.black, width: 2.5)
                                .frame(width: 312, height: 51)
                                .background(Color.white)
                        }
                        .padding(.top, 50)
                        VStack(alignment: .leading, spacing: 8){
                            Text("마인드 특징")
                                .font(.system(size: 24, weight: .semibold))
                            TextEditor(text: $mindDesc)
                                .padding()
                                .border(Color.black, width: 2.5)
                                .frame(width: 312, height: 200)
                                .background(Color.white)
                        }
                        NavigationLink(destination: custom_mind(mindName: $mindName, mindDesc: $mindDesc)){
                            YellowBtn(text: "완료하기")
                        }
                        Spacer()
                    }
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    make_custom_mind()
}
