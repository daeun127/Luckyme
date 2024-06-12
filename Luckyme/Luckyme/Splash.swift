//
//  Splash.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

struct Splash: View {
    @State private var isActive: Bool = false
    @State private var displayText: String = ""
    @State private var index: Int = 0
    @State private var backgroundColor: Color = .mainPurple
    private let fullText: String = "Luckyme"
    
    var body: some View {
        if isActive {
            mainView(mind: .constant(""), desc: .constant(""))
        } else {
            ZStack {
                /// 배경색 설정
                backgroundColor
                    .ignoresSafeArea()
                VStack {
                    /// 타이핑 효과 적용 텍스트
                    Text(displayText)
                        .font(Font.custom("Lexend-SemiBold", size: 39.0))
                        .tracking(2)
                        .foregroundColor(.white)
                        .onAppear {
                            startTypingEffect()
                        }
                }
            }
        }
    }
    
    private func startTypingEffect() {
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
            
            if index < fullText.count {
                let nextIndex = fullText.index(fullText.startIndex, offsetBy: index)
                displayText.append(fullText[nextIndex])
                index += 1
                /// 마지막 글자가 표시될 때 배경색 변경
                if index == fullText.count {
                    withAnimation(.snappy) {
                        backgroundColor = .mainPink
                    }
                }
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation(.linear(duration: -5)) {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    Splash()
}

