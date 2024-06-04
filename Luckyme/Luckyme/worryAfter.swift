//
//  worryAfter.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI



struct worryAfter: View {
    @Binding var negative: String
    
    let think1 = ["물이 딱 반 정도 남았네! 다 먹기엔 너무 많고 덜 먹기엔 너무 적고 그래서 딱 반만 있었으면 좋겠다고 생각했는데 완전 럭키비키잖아🍀", "성적이 안나와도 더 노력하면 다음 번에 더 높은 성적을 받을 수 있으니 완전 럭키비키잖아🍀", "돈이 없다면 이제 더 현명하게 돈을 다루는 방법을 배울 수 있는 기회야.\n완전 럭키비키잖아🍀","지금 딱 낮잠자서 나머지 시간을 활용할 수 있으니 다행이지 뭐야😆\n완전 럭키비키잖아🍀"]

    let think2 = ["물이 반 밖에 안남았을 때는 사오면 된다", "지금 공부 안 하면 더울 때 더운 데서 일하고 추울 때 추운 데서 일한다.", "지금이 기회다.\n더 늦었다는 생각이 들기 전에 빨리 돈을 모아라.", "낮잠 한 번은 상관 없다. 인생은 한 방이 있는 것이 아니다."]

    let think3 = ["오케이! 물이 반 정도 남았군. 충분해! Bravo!", "오케이! 성적이 낮군. 이제 내 수준을 알았어. 더 노력하면 돼. Bravo!", "돈이 없는 이런 시련을 극복하는 방법을 찾아낸다면, 정말 대단한 일을 해낸다고 생각해! Bravo!", "오케이! 낮잠 잔 덕분에 이제 안졸린다. 할 일을 하자.  Bravo!"
]

    let think4 = ["물이 반은 남았어. 더 마시고 싶으면 또 사와야지 뭐 어떡해", "내가 공부를 적게 한 걸 어떡해. 지금은 반성하고 앞으로 나아가는 거야.", "내가 다 써버린 걸 어떡해. 그래도 이번 달엔 더 절약해봐야지.", "이미 자버린 걸 어떡해. 그럼 남은 시간에 할 일을 해야지."]
    
    // MARK: 사고 변환 함수
    func changeThink(negative: String) -> (String, [String]) {
        var positive: [String] = []
        var category: String = ""
        if negative.contains("물"){
            category = "물"
            positive.append(think1[0])
            positive.append(think2[0])
            positive.append(think3[0])
            positive.append(think4[0])
        }
        if negative.contains("공부"){
            category = "공부"
            positive.append(think1[1])
            positive.append(think2[1])
            positive.append(think3[1])
            positive.append(think4[1])
            
        }
        if negative.contains("돈"){
            category = "돈"
            positive.append(think1[2])
            positive.append(think2[2])
            positive.append(think3[2])
            positive.append(think4[2])
        }
        if negative.contains("잠"){
            category = "잠"
            positive.append(think1[3])
            positive.append(think2[3])
            positive.append(think3[3])
            positive.append(think4[3])
        }
        
        return (category, positive)
    }
    
    @State var lucky: [String]
    
    var body: some View {
        NavigationStack{
            let results = changeThink(negative: negative)
            let _ = lucky.append((results.0))
            TabView{
                TextComponent(think: thinks[0], result: results.1[0], lucky: $lucky)
                TextComponent(think: thinks[1], result: results.1[1], lucky: $lucky)
                TextComponent(think: thinks[2], result: results.1[2], lucky: $lucky)
                TextComponent(think: thinks[3], result: results.1[3], lucky: $lucky)
            }
            .padding(.vertical, 70)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarBackButtonHidden()
            NavigationLink(destination: lucky_card(lucky: $lucky)){
                YellowBtn(text: "행운 부적으로 이동하기")
            }
        }
    }
}

#Preview {
    worryAfter(negative: .constant("잠"), lucky: ["잠"])
}

struct TextComponent: View {
    @State var isOn : Bool = false

    @State var think: String
    @State var result: String

    @Binding var lucky: [String]
    
    var body: some View {
        ZStack{
            VStack(spacing: -44){
                Circle().fill(.black)
                    .frame(width: 88, height: 88)
                    .zIndex(1.0)
                Rectangle().fill(.white)
                    .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
                    .frame(width: 308, height: 399)
            }
            .overlay{
                VStack(alignment: .leading, spacing: 6){
                    Text(result)
                        .lineSpacing(6)
                        .font(.system(size: 24, weight: .medium))
                        .frame(width: 252, height: 265, alignment: .leading)
                        .position(x: 150, y: 230)
                    HStack{
                        Text(think)
                            .font(.system(size: 14, weight: .medium))
                        Spacer()
                        Button{
                            isOn.toggle()
                            lucky.append(result)
                            let _ = print(lucky)
                        } label:{
                            if isOn {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.black)
                            } else {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 28, height: 28)
                            }}}
                    .padding(.bottom, 28)
                    .padding(.horizontal, 22)
                } }}
    }
}
