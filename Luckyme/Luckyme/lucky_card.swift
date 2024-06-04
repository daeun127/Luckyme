//
//  lucky_card.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

struct lucky_card: View {
    @Binding var lucky: [String]
    
    func stringDate()-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: Date())
        
        return dateString
    }
    
    var body: some View {
        NavigationStack{
            
            HStack{
                Text("행운 부적")
                    .font(.system(size: 30, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal, 24)
            
            ScrollView(.vertical, showsIndicators: false){
                if lucky[0] != ""{
                    let str_Date = stringDate()
                    ForEach(1..<lucky.count){ i in
                        LuckyComponent(text: lucky[i], category: lucky[0], date: str_Date)
                    }
                }
            }
            .padding(.horizontal, 24)
        }
        
    }
}

#Preview {
    lucky_card(lucky: .constant(["잠", "지금 딱 낮잠자서 나머지 시간을 활용할 수 있으니 다행이지 뭐야😆\n완전 럭키비키잖아🍀", "오케이! 낮잠 잔 덕분에 이제 안졸린다. 할 일을 하자.  Bravo!"]))
}

struct LuckyComponent: View {
    var text: String
    var category: String
    var date: String
    
    var body: some View {
        NavigationLink(destination: lucky_card_2()){
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
                            .font(.system(size: 11, weight: .regular))
                    }
                }
                .zIndex(1.0)
                .padding(24)
                Rectangle().fill(.white)
                    .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
            }
        }
        .padding(.bottom, 16)
        .foregroundStyle(.black)
        .navigationBarBackButtonHidden()
    }
}
