//
//  ColorsViewSwiftUIView.swift
//  SlidersColorView
//
//  Created by Лилия Андреева on 15.12.2023.
//

import SwiftUI

struct ColorsViewSwiftUIView: View {
    @Binding var color: Color
   
    
    var body: some View {
        Rectangle()
            .foregroundStyle(color)
            .frame(
                width: 300,
                height: 150
            )
            .overlay(
                Rectangle()
                    .stroke(
                        Color.white,
                        lineWidth: 5
                    )
            )
            .shadow(
                color: .white,
                radius: 5
            )
        
            .padding(
                EdgeInsets(
                    top: 30,
                    leading: 30,
                    bottom: 70,
                    trailing: 30
                )
            )
    }
}
        

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ColorsViewSwiftUIView(color: .constant(.red))
    }
}
