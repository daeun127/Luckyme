//
//  mainView.swift
//  Luckyme
//
//  Created by DaeunLee on 6/2/24.
//

import SwiftUI

struct mainView: View {
    @Binding var mind: String
    @Binding var desc: String
    @State private var selectedTab = 0  // 현재 선택된 탭을 추적하기 위한 상태 변수
    
    init(mind: Binding<String>, desc: Binding<String>) {
            self._mind = mind
            self._desc = desc
            UITabBar.appearance().backgroundColor = .white
            UITabBar.appearance().scrollEdgeAppearance = .init()        }
    
    var body: some View {
            TabView(selection: $selectedTab) {
                Home()
                    .tabItem {
                        Image(selectedTab == 0 ? "home_c" : "home")
                        Text("홈")
                            .font(.system(size: 12.5, weight: .regular))
                    }
                    .tag(0)
                
                worryBefore()
                    .tabItem {
                        Image(selectedTab == 1 ? "chm_c" : "chm")
                        Text("마인드 체인지")
                            .font(.system(size: 12.5, weight: .regular))
                    }
                    .tag(1)
                
                custom_mind(mindName: $mind, mindDesc: $desc)
                    .tabItem {
                        Image(selectedTab == 2 ? "cusm_c" : "cusm")
                        Text("커스텀 마인드")
                            .font(.system(size: 12.5, weight: .regular))
                    }
                    .tag(2)
                
                lucky_card()
                    .tabItem {
                        Image(selectedTab == 3 ? "cl_c" : "cl")
                        Text("행운 부적")
                            .font(.system(size: 12.5, weight: .regular))
                    }
                    .tag(3)
            }
            .tint(.mainPink)
       
    }
}



struct Header: View {
    var body: some View {
        HStack(){
            Image("Luckyme")
            Spacer()
            myPageIcon()
            
        }
        .padding(.horizontal, 24)
        .frame(width: 393, height: 80, alignment: .center)
        
    }
}

#Preview {
    mainView(mind: .constant(""), desc: .constant(""))
}




