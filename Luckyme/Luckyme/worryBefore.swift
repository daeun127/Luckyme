 //
//  worryBefore.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

struct worryBefore: View {
    @State var negative: String = ""
    @State var lucky: [String] = [""]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.subGray
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Header()
                        .padding(.vertical)
                    VStack(spacing: -44){
                        Image("before_img")
                            .resizable()
                            .frame(width: 88, height: 88)
                            .zIndex(1.0)
                            .overlay{
                                Circle().fill(Color.clear)
                                    .stroke(Color.black, lineWidth: 2.5)
                            }
                        TextEditor(text: $negative)
                            .padding()
                            .padding(.top, 60)
                            .border(Color.black, width: 2.5)
                            .frame(width: 308, height: 399)
                            .background(Color.white)
                    }
                    
                    NavigationLink(destination: worryAfter(negative: $negative)){
                        WhiteBtn(text: "마인드 체인지")
                            .padding(.top, 48)
                    }
                    Spacer()
                }
                .padding(.top, -80)
                .navigationBarBackButtonHidden()
            }
        }
    }
}


#Preview {
    worryBefore()
}
