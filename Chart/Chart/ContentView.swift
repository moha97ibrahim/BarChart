//
//  ContentView.swift
//  Chart
//
//  Created by Mohammed Ibrahim on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    let month = ["JAN", "FEB", "MAR","APR","MAY","JUN",
    "JUL","AUG","SEP","OCT","NOV","DEC"]
    let data = [25,100,37,87,20,92,43,15,40,60,80,50]
    
    @State private var ChartAnim = false
    @State private var TextAnim = false
    @State private var move = -1
    
    var body: some View {
        ZStack(alignment: .top) {
                    Color.purple
                        .ignoresSafeArea()
            VStack{
                HStack(alignment : .top){
                    VStack(alignment : .leading){
                        Text("BAR")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading)
                            .foregroundColor(.yellow)
                            .animation(.ripple(index: 10))
                        Text("Chart")
                            .font(.headline)
                            .padding(.leading)
                            .foregroundColor(.white)
                            .animation(.ripple(index: 10))
                            .onAppear(){
                                self.ChartAnim.toggle()
                            }
                        if(ChartAnim){
                            HStack(alignment:.bottom){
                                ForEach(0..<12){ value in
                                    VStack{
                                        VStack{
                                            Text("\(data[value])")
                                                .font(.footnote)
                                                .bold()
                                                .foregroundColor(.purple)
                                                .rotationEffect(.degrees(-90))
                                                .offset(y: data[value] < Int(2.4) ? 0 : 35)
                                                .zIndex(1)
                                            Capsule()
                                                .fill(LinearGradient(gradient: Gradient(colors: value==self.move ? [Color.yellow, Color.purple] : [Color.white, Color.purple]) , startPoint: .top, endPoint: .bottom))
                                                .frame(width: 20, height: CGFloat(Double(data[value])*2.5))
                                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                                                .shadow(color: Color.purple.opacity(0.7), radius: 10, x: -5, y: -5)
                                                .shadow(radius: 20)
                                                .animation(.ripple(index: 10))
                                            
                                        }
                                        .offset(y: value==self.move ? -10 : 0)
                                        .onTapGesture{
                                            self.move = value
                                        }
                                        Text("\(month[value])")
                                            .font(.footnote)
                                            .foregroundColor(value==self.move ? .yellow : .white)
                                            .frame(height: 20)
                                            .animation(.ripple(index: 10))
                                    }
                                    
                                }
                                
                            }
                            .transition(.slide)
                            .animation(.ripple(index: 10))
                            .onAppear(){
                                self.TextAnim.toggle()
                            }
                    }
                    }
                }
                    VStack(alignment : .leading){
                        Text("Lorem Ipsum")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.yellow)
                            .animation(.ripple(index: 10))
                        Text("      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                            .font(.body)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .animation(.ripple(index: 10))
                        
                            
                    }
                    .padding()
                    .transition(.slide)
                    .animation(.easeIn(duration:0.5))
            }
        }
    }
}

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
