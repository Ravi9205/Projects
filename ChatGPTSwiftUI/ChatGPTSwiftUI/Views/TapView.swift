//
//  TapView.swift
//  ChatGPTSwiftUI
//
//  Created by Ravi Dwivedi on 08/12/23.
//

import Foundation
import SwiftUI


struct TapView: UIViewRepresentable {
    var tappedCallback: (() -> Void)

    func makeUIView(context: UIViewRepresentableContext<TapView>) -> TapView.UIViewType {
        let v = UIView(frame: .zero)
        let gesture = SingleTouchDownGestureRecognizer(target: context.coordinator,
                                                       action: #selector(Coordinator.tapped))
        v.addGestureRecognizer(gesture)
        return v
    }

    class Coordinator: NSObject {
        var tappedCallback: (() -> Void)

        init(tappedCallback: @escaping (() -> Void)) {
            self.tappedCallback = tappedCallback
        }

        @objc func tapped(gesture:UITapGestureRecognizer) {
            self.tappedCallback()
        }
    }

    func makeCoordinator() -> TapView.Coordinator {
        return Coordinator(tappedCallback:self.tappedCallback)
    }

    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<TapView>) {
    }
}

class SingleTouchDownGestureRecognizer: UIGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if self.state == .possible {
            self.state = .recognized
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .failed
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .failed
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
