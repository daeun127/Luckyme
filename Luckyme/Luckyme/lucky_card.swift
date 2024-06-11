//
//  lucky_card.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

struct lucky_card: View {
    
    func stringDate()-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd hh:mm"
        let dateString = dateFormatter.string(from: Date())
        
        return dateString
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.pointYellow
                    .ignoresSafeArea()
                VStack{
                    Header()
                    HStack{
                        Text("행운 부적")
                            .font(.system(size: 30, weight: .semibold))
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        if lucky[0] != "" {
                            let str_Date = stringDate()
                            ForEach(1..<lucky.count, id: \.self){ i in
                                LuckyComponent(text: lucky[i], category: lucky[0], date: str_Date)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 40)
                }
            }
            
            
        }
        
    }
}

#Preview {
    lucky_card()
}

struct LuckyComponent: View {
    var text: String
    var category: String
    var date: String
    
    var body: some View {
        NavigationLink(destination: lucky_card_2(text: text)){
            ZStack{
                VStack(alignment: .center, spacing: 11){
                    Text(text)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 18, weight: .semibold))
                        .lineLimit(3)
                        .lineSpacing(3)
                    HStack{
                        Spacer()
                        Text("\(category) / \(date)")
                        .font(.system(size: 11, weight: .regular))}}
                .zIndex(1.0)
                .padding(24)
                Rectangle().fill(.white)
                    .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
            }}
        .padding(.bottom, 16)
        .foregroundStyle(.black)
        .navigationBarBackButtonHidden()
    }
}
