//
//  StartScreen.swift
//  VK-Test
//
//  Created by Сергей Зайцев on 09.05.2023.
//

import SwiftUI

struct StartScreen: View {
    
    @State var subjectsCount: Int = 100
    @State var infectedCount: Int = 1
    @State var timeCount: Int = 1
    
    private var subjects: [Subjects] = []
//    private var indexesForReload: [Int] = []
    
    static var infected: NumberFormatter {
            let formatter = NumberFormatter()
        formatter.minimumFractionDigits = .zero
            return formatter
        }
    
    var body: some View {
        NavigationView {
            VStack{
                
                VStack{
                    
                    Text("Virus \n         Simulator")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    
                    VStack(spacing: scaleScreen(20)){
                        HStack{
                            
                            Text("Количество людей")
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .padding()
                            
                            Spacer()
                            
                            TextField("", value: $subjectsCount, formatter: StartScreen.infected)
                            //                            Text("\(subjectsCount)")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                            
                        }
                        .frame(width: scaleScreen(343),height: scaleScreen(80))
                            .background(Color.backGroundGradient)
                            .cornerRadius(30)//Color.purple)
                        
                        HStack{
                            
                            Text("Количество зараженных")
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .padding()
                            
                            Spacer()
                            
                            Text("\(infectedCount)")
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .padding()
                        }.padding()
                        .frame(width: scaleScreen(343),height: scaleScreen(80))
                            .background(Color.backGroundGradient)
                            .cornerRadius(30)//Color.purple)
                        
                        HStack{
                            
                            Text("Период пересчета")
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                                .padding()
                            
                            Spacer()
                            
    //                        TextField("", text: timeCount)
                            Text("\(timeCount)")
                                .font(.title3)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .padding()
                        }.padding()
                        .frame(width: scaleScreen(343),height: scaleScreen(80))
                            .background(Color.backGroundGradient)
                            .cornerRadius(30)//Color.purple)
                        
                        Spacer()
                    }.padding()
                    
                }
                .padding(.top, scaleScreen(50))
                
                Spacer()
                
                NavigationLink(destination: Simulator(subjectsCount: $subjectsCount, infectedCount: $infectedCount, timeCount: $timeCount)){
                        Text("Начать моделирование")
                            .font(.title3)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .padding()
                    }
                    .frame(width: scaleScreen(343),height: scaleScreen(70))
                    .background(Color.backGroundGradient)
                    .cornerRadius(30)//Color.purple)
                    .padding(.bottom, scaleScreen(36))

                
                
            }.padding()
                .background(.black.opacity(0.9))
            .ignoresSafeArea(.all)
        }
        
//        .padding()
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
