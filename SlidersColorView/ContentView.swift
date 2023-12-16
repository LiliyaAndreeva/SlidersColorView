//
//  ContentView.swift
//  SlidersColorView
//
//  Created by Лилия Андреева on 15.12.2023.
//

import SwiftUI

struct ContentView: View {
    private enum Field: Int, CaseIterable {
          case amount
          case str
      }
    
    @FocusState private var focusedField: Field?
    @State private var redSlidersValue = Int.random(in: 0...255)
    @State private var greenSlidersValue = Int.random(in: 0...255)
    @State private var blueSlidersValue = Int.random(in: 0...255)
    @State private var alertPresented = false
    @State private var middleValue = 0
    
    @State private var currentColor: Color = .red

    var body: some View {
        ZStack{
            Color.clear.ignoresSafeArea()
            
            VStack {
                ColorsViewSwiftUIView(
                    color: $currentColor
                )
                
                VStack{
                    SliderUIView(
                        value: $redSlidersValue,
                        color: .red)
                    SliderUIView(
                        value: $greenSlidersValue,
                        color: .green
                    )
                    SliderUIView(
                        value: $blueSlidersValue,
                        color: .blue
                    )
                }
                .alert(isPresented: $alertPresented) {
                    Alert(
                        title: Text("Invalid Value"),
                        message: Text("Value should be between 0 and 255"),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .keyboardType(.numberPad)
                .focused($focusedField, equals: .amount)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            focusedField = nil
                            updateColor()
                            actionButton()
                        }
                    }
                }
                .padding()
            }
        }.onAppear {
            updateColor()
        }
        .onChange(of: [redSlidersValue, greenSlidersValue, blueSlidersValue]) { newValue, _ in
            updateColor()
        }
    }
}
    
extension ContentView {
    private func actionButton() {
        if redSlidersValue >= 0 && redSlidersValue <= 255 &&
            greenSlidersValue >= 0 && greenSlidersValue <= 255 &&
            blueSlidersValue >= 0 && blueSlidersValue <= 255 {
            
            alertPresented = false
            updateColor()
        } else {
            alertPresented = true
        }
        
        //        redSlidersValue = middleValue
        
    }
    
    private func updateColor() {
        currentColor = Color(
            red: Double(redSlidersValue) / 255,
            green: Double(greenSlidersValue) / 255 ,
            blue: Double(blueSlidersValue) / 255
        )
    }
}


#Preview {
    ContentView()
}
