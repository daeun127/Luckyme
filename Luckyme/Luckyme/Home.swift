//
//  Home.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabBar()
    }
}

struct TabBar: View {
    var body: some View {
        TabView{
            worryAfter()
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
            custom_mind()
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
#Preview {
    Home()
}
