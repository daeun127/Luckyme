//
//  lucky_card_2.swift
//  Luckyme
//
//  Created by DaeunLee on 6/2/24.
//

import SwiftUI

struct lucky_card_2: View {
    var text: String
    var body: some View {
        NavigationStack{
            ZStack{
                Color.pointYellow
                    .ignoresSafeArea()
                VStack{
                    Header()
                    Spacer()
                    card(text: text)
                        .frame(width: 310, height: 465)
                        .border(Color.black, width: 2.5)
                    HStack{
                        Spacer()
                        Button{
                            let image = convertToUIImage(view: card(text: text))
                            shareImage(image: image)
                        }label:{
                            Image("btn_share")
                        }
                    }
                    .padding(.trailing, 44)
                    .padding(.top, 10)
                    Spacer()
                }
            }
            
            }
    }
    
}

struct card: View {
    var bg: [String] = ["bg1", "bg2", "bg3", "bg4"]
    var text: String
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    Image(img.randomElement()!)
                        .resizable()
                        .scaledToFit()
                        .zIndex(1)
                        .frame(width: 63, height: 63, alignment: .center)
                        .overlay{
                            Circle().fill(Color.clear)
                                .stroke(Color.white, lineWidth: 2.5)
                        }
                    Rectangle().fill(.white)
                        .frame(width: 258, height: 2, alignment: .center)
                }
                .padding(.top, 20)
                Spacer()
                Text(text)
                    .font(.system(size: 16, weight: .semibold))
                    .lineSpacing(6)
                    .foregroundStyle(.white)
                    .padding(.top, -16)
                    .frame(width: 200, height: 300, alignment: .center)
                Spacer()
                Rectangle().fill(.white)
                    .frame(width: 258, height: 2, alignment: .center)
                    .padding(.bottom, 60)
            }
        }
        .background{
            Image(bg.randomElement()!)
                .resizable()
                .frame(width: 310, height: 465, alignment: .center)
        }
        .navigationBarBackButtonHidden()
            
    }
}

func convertToUIImage(view: card) -> UIImage {
    let controller = UIHostingController(rootView: view)
    let view = controller.view
    
    let targetSize = CGSize(width: 310, height: 465)
    view?.bounds = CGRect(origin: .zero, size: targetSize)
    view?.backgroundColor = .clear
    
    let renderer = UIGraphicsImageRenderer(size: targetSize)
    return renderer.image { _ in
        view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
    }
}

func getCurrentWindow() -> UIWindow? {
    let scenes = UIApplication.shared.connectedScenes
    let windowScene = scenes.first { $0 is UIWindowScene } as? UIWindowScene
    return windowScene?.windows.first { $0.isKeyWindow }
}

func shareImage(image: UIImage) {
    let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    if let currentController = getCurrentWindow()?.rootViewController {
        currentController.present(activityController, animated: true, completion: nil)
    }
}

#Preview {
    lucky_card_2(text: "성적이 안나와도 더 노력하면 다음 번에 더 높은 성적을 받을 수 있으니 완전 럭키비키잖아🍀")
}
