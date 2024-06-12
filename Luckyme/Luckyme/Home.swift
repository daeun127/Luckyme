//
//  Home.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack{
            Header()
            Spacer()
            Text("Home")
                .font(Font.custom("Lexend-SemiBold", size: 39.0))
            WhiteBtn(text: "마인드 체인지 하러가기")
            Spacer()
        }
    }
}

#Preview {
    Home()
}
