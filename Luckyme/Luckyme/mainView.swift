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
    
    var body: some View {
        NavigationStack{
            Header()
            TabView{
                Home()
                    .tabItem{
                        Image(systemName: "star")
                        Text("홈")
                            .font(.system(size: 12.5, weight: .regular))
                    }
                worryBefore()
                    .tabItem{
                        Image(systemName: "star")
                        Text("마인드 체인지")
                            .font(.system(size: 12.5, weight: .regular))
                    }
                custom_mind(mindName: $mind, mindDesc: $desc)
                    .tabItem{
                        Image(systemName: "star")
                        Text("커스텀 마인드")
                            .font(.system(size: 12.5, weight: .regular))
                    }
                lucky_card()
                    .tabItem{
                        Image(systemName: "star")
                        Text("행운 부적")
                            .font(.system(size: 12.5, weight: .regular))
                    }
            }
        }
            
        
    }
}

struct Header: View {
    var body: some View {
        HStack(){
            Text("Luckyme")
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
