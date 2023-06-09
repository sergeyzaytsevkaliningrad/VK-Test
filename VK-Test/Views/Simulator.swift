//
//  Simulator.swift
//  VK-Test
//
//  Created by Сергей Зайцев on 10.05.2023.
//

import SwiftUI

struct Simulator: View {
    
    @Environment (\.dismiss) var dismiss
    
    var subject = Subjects()
    
    @Binding var subjectsCount: Int
    @Binding var infectedCount: Int
    @Binding var timeCount: Int
    
    @State var infected: Bool = false
    
    var body: some View {
        VStack{
            
            HStack(spacing: scaleScreen(15)){
                
                VStack{
                    
                    Text("Обновление")
                        .font(.footnote)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding()
                    
                    Text("1")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding()
                }.frame(width: scaleScreen(110),height: scaleScreen(110))
                    .background(Gradient(colors: [Color.white, Color.blue]))
                    .cornerRadius(30)
                
                VStack{
                    
                    Text("Зараженных")
                        .font(.footnote)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding()
                    
                    Text("100")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding()
                }.frame(width: scaleScreen(110),height: scaleScreen(110))
                    .background(Gradient(colors: [Color.white, Color.blue]))
                    .cornerRadius(30)
                
                VStack{
                    
                    Text("Здоровых")
                        .font(.footnote)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding()
                    
                    Text("10")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding()
                }.frame(width: scaleScreen(110),height: scaleScreen(110))
                    .background(Gradient(colors: [Color.white, Color.blue]))
                    .cornerRadius(30)
                
                
                
            }.padding()
            
            Button {
                dismiss()
            } label: {
                
                HStack{
                    Text("Назад")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding()
                }.frame(width: scaleScreen(334),height: scaleScreen(66))
                    .background(Gradient(colors: [Color.white, Color.blue]))
                    .cornerRadius(20)
            }
            
            Spacer()
            
            ScrollView{
                
                ForEach(1..<subjectsCount + 1){ _ in
                        
                        
                        Button {
                            self.infected.toggle()
                        } label: {
                            Image(systemName: infected ? "person" : "person.fill")
                                .resizable()
                                .frame(width: scaleScreen(70),height: scaleScreen(70))
                                .padding()
                        }
                        
                    }
            }.frame(width: scaleScreen(334))
                .background(Color.white.opacity(0.1))
                .cornerRadius(10)
                .padding()
        }.background(Color.blackMain)
            .navigationBarBackButtonHidden(true)
    }
}

//struct Simulator_Previews: PreviewProvider {
//    static var previews: some View {
//        Simulator(subjectsCount: <#Binding<Int>#>, infectedCount: <#Binding<Int>#>, timeCount: <#Binding<Int>#>)
//    }
//}

