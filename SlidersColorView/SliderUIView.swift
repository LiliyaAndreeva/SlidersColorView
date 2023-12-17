//
//  SliderUIView.swift
//  SlidersColorView
//
//  Created by Лилия Андреева on 15.12.2023.
//

import SwiftUI

struct SliderUIView: View {
    @Binding var value: Int
   
    let color: Color
    
    var body: some View {
        
        HStack {
            Text("0")
                .padding(
                    EdgeInsets(
                        top: 8,
                        leading: 20,
                        bottom: 8,
                        trailing: 0
                    )
                )
            Slider(value: Binding<Double>(
                get: { Double(value) },
                set: { value = Int($0.rounded())
                }
            ),
                   in: 0...255, step: 1)
           // .present()
            .tint(color)
            .padding(EdgeInsets(
                top: 8,
                leading: 10,
                bottom: 8,
                trailing: 0
            )
            )
            TextField("0", value: $value, format: .number)
                .bordered()
        }
    }
}
    

    
#Preview {
    ZStack{
        Color(.systemBackground)
        SliderUIView(value: .constant(56),   color: .red)
    }
}

struct BorderedModelForTextfield: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .frame(width: 50)
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(
                top: 8,
                leading: 5,
                bottom: 8,
                trailing: 10
            )
            )
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(
            content: self,
            modifier: BorderedModelForTextfield()
        )
    }
}

//struct BorderedModelForSliders: ViewModifier {
//    let color: Color
//    
//    func body(content: Content) -> some View {
//        content
//            .tint(color)
//            .padding(EdgeInsets(
//                top: 8,
//                leading: 10,
//                bottom: 8,
//                trailing: 0
//            )
//            )
//    }
//}
//
//extension Slider {
//    
//    func present() -> some View {
//        ModifiedContent(
//            content: self,
//            modifier: BorderedModelForSliders(color: BorderedModelForSliders.init(color: <#T##Color#>))
//        )
//    }
//}

