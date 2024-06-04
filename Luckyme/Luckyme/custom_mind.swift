//
//  custom_mind.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

var thinks: [String] = ["럭키걸 사고", "마이웨이 사고", "득도적 사고", "월급쟁이 사고"]
var descs: [String] = ["상황에 대한 특별하고 창의적인 해석을 통해 일상의 작은 부분에서도 긍정적이고 특별한 의미를 발견하고 즐길 수 있게 하는 사고 방식. \n \n단순히 긍정적으로 생각하는 것을 넘어, 상황 자체를 마치 특별한 이벤트처럼 느끼고, 그 속에서 긍정적이고 즐거운 감정을 최대한으로 끌어낸다.", "친근감과 유머를 바탕으로 친밀감이 높은 관계에서 나오는 솔직하고 편안한 사고 방식.\n\n 표면적으로는 부정적인 태도의 사고지만 기대와 현실 사이에서 실망한 상황에서 유머를 찾아 현재 가지고 있는 부정적인 감정을 전환할 수 있도록 돕는다.", "강한 자기 확신을 기반으로 자기 생각을 여과 없이 꺼내며 항상 논리적으로 일의 장점을 설명하는 사고 방식.\n\n자신감이 넘치며 다양한 상황에서 긍정적인 태도로 의견을 당당시 제시한다. 논리적 접근 방식으로 상황의 긍정적인 면을 설득하고, 현재의 복잡한 문제를 해결하는 데 기여할 수 있다.", "현재의 어려운 상황을 그대로 받아들이면서도, 해결책을 찾거나 적응해 나가려는 사고 방식.\n\n부정적인 감정을 회피하거나 부정하지 않으며 건강하게 처리하고, 그럼에도 불구하고 전진하려는 태도가 내적 강인함과 사회 적응력을 개발할 수 있게 돕는다."]

struct custom_mind: View {
    @Binding var mindName : String
    @Binding var mindDesc : String
    
    let think1 = (thinks[0],"완전 럭키비키잖아")
    let think2 = (thinks[1], "터진 입이라 내뱉었다")
    let think3 = (thinks[2], "오~케이! Bravoooo")
    let think4 = (thinks[3], "그치만 어쩌겠어.해야지")
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:15){
                    HStack(spacing: 15){
                        thinkView(think: think1.0, desc: think1.1)
                        thinkView(think: think2.0, desc: think2.1)
                    }
                    HStack(spacing: 15){
                        thinkView(think: think3.0, desc: think3.1)
                        thinkView(think: think4.0, desc: think4.1)
                    }
                    if !mindName.isEmpty {
                        let _ = thinks.append(mindName)
                        let _ = descs.append(mindDesc)
                        thinkView(think: mindName, desc: "")
                    }
                }
            }
            .frame(width: 340, height: 386, alignment: .center)
            NavigationLink(destination: make_custom_mind()){
                YellowBtn(text: "나만의 마인드 만들기")
            }
            .padding(.top, 29)
        }.navigationBarBackButtonHidden()
        
        
    }
}

struct thinkView: View {
    var think: String
    var desc: String
    
    var body: some View {
        NavigationLink(destination: custom_mind_info(think: think, desc: descs[thinks.firstIndex(of: think)!])){
            ZStack{
                VStack(spacing: 9){
                    Circle()
                        .frame(width: 74, height: 74)
                    Text(think)
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity, maxHeight: 29)
                    Text(desc)
                        .font(.system(size: 11, weight: .regular))
                }
                Rectangle()
                    .stroke(.black, style: StrokeStyle(lineWidth: 2.5))
                    .foregroundStyle(.white)
            }
            .frame(width: 148, height: 185)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    custom_mind(mindName: .constant(""), mindDesc: .constant(""))
}
