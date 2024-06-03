//
//  lucky_card_2.swift
//  Luckyme
//
//  Created by DaeunLee on 6/2/24.
//

import SwiftUI

struct lucky_card_2: View {
    var body: some View {
        card()
            .frame(width: 300, height: 300)
        Button{
            let image = convertToUIImage(view: card())
            shareImage(image: image)
        }label:{
            Image(systemName: "heart.fill")
        }
    }
    
}

struct card: View {
    var body: some View {
        ZStack{
            Image(systemName: "heart.fill")
            
            Text("qwertasdfgjdkldf")
        }.navigationBarBackButtonHidden()
    }
}

func convertToUIImage(view: card) -> UIImage {
    let controller = UIHostingController(rootView: view)
    let view = controller.view
    
    let targetSize = CGSize(width: 300, height: 300) // 원하는 크기
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
    lucky_card_2()
}
