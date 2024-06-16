//
//  my.swift
//  Luckyme
//
//  Created by DaeunLee on 6/2/24.
//

import SwiftUI

struct my: View {
    /// 백 버튼 커스텀
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            Color.subGray
                .ignoresSafeArea()
            VStack(spacing: 10){
                VStack(alignment: .center, spacing: 30){
                    ZStack{
                        HStack{
                            Text("홍길동")
                                .font(.system(size: 22, weight: .black))
                                .frame(width: 254, height: 70, alignment: .leading)
                                .padding(.top, -38)
                            Image("btn_share")
                                .padding(.top, -60)
                        }
                        Text("            님\n오늘 하루도 파이팅이에요!🍀")
                            .font(.system(size: 22, weight: .regular))
                            .frame(width: 254, height: 70, alignment: .leading)
                            .padding(.leading, -50)
                            .lineSpacing(12.0)
            
                    }
                    Path{ path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: 284 , y: 0))
                    }
                    .stroke(.black, style: StrokeStyle(lineWidth: 2.0, dash: [4.0]))
                    .frame(width: 300, height: 1)
                    VStack(alignment: .leading, spacing: 10){
                        Text("나의 평균 심리 상태는?")
                            .font(.system(size: 16, weight: .medium))
                        ZStack{
                            Path{ path in
                                path.move(to: CGPoint(x: 0, y: 0))
                                path.addLine(to: CGPoint(x: 284 , y: 0))
                            }
                            .stroke(.black, style: StrokeStyle(lineWidth: 2.0))
                            .frame(width: 300, height: 1)
                            Image("my_smile")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .overlay{
                                    Circle().fill(Color.clear)
                                        .stroke(Color.black, lineWidth: 2)
                                }
                        }
                    }
                    
                }
                .padding(.vertical, 40)
                .background(){
                    Rectangle().fill(.white)
                        .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
                        .frame(width: 343, height: 291)
                }
                
                myView(text: "알림 설정")
                    .padding(.top, 10)
                myView(text: "문의 하기")
            }.navigationBarBackButtonHidden()
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                })
        }
        
        
        
    }
}

#Preview {
    my()
}
