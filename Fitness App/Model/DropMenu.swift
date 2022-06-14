//
//  DropMenu.swift
//  Fitness App
//
//  Created by Alexander on 09.05.2022.
//

import Foundation
import SwiftUI

struct DropDown: View {
    
    @State var expand = false
    @Binding var activeLevel: String
    
    @State var active0 = "Минимальный"
    @State var active1 = "Низкий"
    @State var active2 = "Средний"
    @State var active3 = "Высокий"
    @State var active4 = "Очень высокий"
    
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    let Gray2 = UIColor(r: 173, g: 164, b: 165)
    
    var body: some View {
        VStack (alignment: .center, spacing: 0, content: {
            HStack{
                Text(activeLevel)
                    .font(MontserratRegular_12)
                    .padding()
                Spacer()
                Image(systemName: expand ? "chevron.up" : "chevron.down")
                    .resizable()
                    .frame(width: 10.5, height: 5.25)
                    .foregroundColor(Color(uiColor: Gray2))
                    .padding()
            }
            .frame(height: 48)
            .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
            .background(Color(uiColor: BorderColor))
            .cornerRadius(14)
            .onTapGesture {
                withAnimation() {
                    self.expand.toggle()
                }
            }
            .padding(.bottom, 2)
            if expand {
                Group {
                    if activeLevel != active0 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            
                            activeLevel = "Минимальный"
                        } label: {
                            HStack {
                                Text("Минимальный")
                                    .padding()
                                Spacer()
                            }
                                
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                        .cornerRadius(14, corners: [.topLeft, .topRight])
                    }
                    
                    if activeLevel != active1 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            
                            activeLevel = "Низкий"
                        } label: {
                            HStack {
                                Text("Низкий")
                                    .padding()
                                Spacer()
                            }
                                
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                        .cornerRadius(14, corners: [.topLeft, .topRight])
                    }
                   
                    if activeLevel != active2 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            activeLevel = "Средний"
                        } label: {
                            HStack {
                                Text("Средний")
                                    .padding()
                                Spacer()
                            }
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                    }
                    
                    if activeLevel != active3 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            activeLevel = "Высокий"
                        } label: {
                            HStack {
                                Text("Высокий")
                                    .padding()
                                Spacer()
                            }
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                    }
                    
                    if activeLevel != active4 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            activeLevel = "Очень высокий"
                        } label: {
                            HStack {
                                Text("Очень высокий")
                                    .padding()
                                Spacer()
                            }
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                        .cornerRadius(14, corners: [.bottomLeft, .bottomRight])
                    }
                }
            }
            
        })
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DropDown10: View {
    
    @State var expand = false
    @Binding var activeLevel: String
    
    @State var active0 = "Минимальный"
    @State var active1 = "Низкий"
    @State var active2 = "Средний"
    @State var active3 = "Высокий"
    @State var active4 = "Очень высокий"
    
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    let Gray2 = UIColor(r: 123, g: 111, b: 114, a: 0.5)
    
    var body: some View {
        VStack (alignment: .center, spacing: 0, content: {
            HStack{
                if activeLevel == "" {
                    Image("Group-1")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .padding()
                    Text("Уровень активности")
                        .font(MontserratRegular_12)
                        .foregroundColor(Color(uiColor: Gray2))
                        .padding(.leading, -10)
                }
                else {
                    Image("Group-1")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .padding()
                    Text(activeLevel)
                        .font(MontserratRegular_12)
                        .foregroundColor(Color(uiColor: Gray2))
                        .padding(.leading, -10)
                }
                Spacer()
                Image(systemName: expand ? "chevron.up" : "chevron.down")
                    .resizable()
                    .frame(width: 10.5, height: 5.25)
                    .foregroundColor(Color(uiColor: Gray2))
                    .padding()
            }
            .frame(height: 48)
            .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
            .background(Color(uiColor: BorderColor))
            .cornerRadius(14)
            .onTapGesture {
                withAnimation() {
                    self.expand.toggle()
                }
            }
            .padding(.bottom, 2)
            if expand {
                Group {
                    if activeLevel != active0 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            
                            activeLevel = "Минимальный"
                        } label: {
                            HStack {
                                Text("Минимальный")
                                    .padding()
                                    .foregroundColor(Color(uiColor: Gray2))
                                Spacer()
                            }
                                
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                        .cornerRadius(14, corners: [.topLeft, .topRight])
                    }
                    
                    if activeLevel != active1 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            
                            activeLevel = "Низкий"
                        } label: {
                            HStack {
                                Text("Низкий")
                                    .foregroundColor(Color(uiColor: Gray2))
                                    .padding()
                                Spacer()
                            }
                                
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                        .cornerRadius(14, corners: [.topLeft, .topRight])
                    }
                   
                    if activeLevel != active2 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            activeLevel = "Средний"
                        } label: {
                            HStack {
                                Text("Средний")
                                    .foregroundColor(Color(uiColor: Gray2))
                                    .padding()
                                Spacer()
                            }
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                    }
                    
                    if activeLevel != active3 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            activeLevel = "Высокий"
                        } label: {
                            HStack {
                                Text("Высокий")
                                    .foregroundColor(Color(uiColor: Gray2))
                                    .padding()
                                Spacer()
                            }
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                    }
                    
                    if activeLevel != active4 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            activeLevel = "Очень высокий"
                        } label: {
                            HStack {
                                Text("Очень высокий")
                                    .foregroundColor(Color(uiColor: Gray2))
                                    .padding()
                                Spacer()
                            }
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                        .cornerRadius(14, corners: [.bottomLeft, .bottomRight])
                    }
                }
            }
            
        })
    }
}

struct DropDown11: View {
    
    @State var expand = false
    @Binding var gender: String
    
    @State var active0 = "Мужской"
    @State var active1 = "Женский"
    
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    let Gray2 = UIColor(r: 123, g: 111, b: 114, a: 0.5)
    
    var body: some View {
        VStack (alignment: .center, spacing: 0, content: {
            HStack{
                if gender == "" {
                    Image("3 User")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding()
                    Text("Выбери пол")
                        .font(MontserratRegular_12)
                        .foregroundColor(Color(uiColor: Gray2))
                        .padding(.leading, -15)
                }
                else {
                    Image("3 User")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding()
                    Text(gender)
                        .font(MontserratRegular_12)
                        .foregroundColor(Color(uiColor: Gray2))
                        .padding(.leading, -15)
                }
                Spacer()
                Image(systemName: expand ? "chevron.up" : "chevron.down")
                    .resizable()
                    .frame(width: 10.5, height: 5.25)
                    .foregroundColor(Color(uiColor: Gray2))
                    .padding()
            }
            .frame(height: 48)
            .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
            .background(Color(uiColor: BorderColor))
            .cornerRadius(14)
            .onTapGesture {
                withAnimation() {
                    self.expand.toggle()
                }
            }
            .padding(.bottom, 2)
            if expand {
                Group {
                    if gender != active0 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            
                            gender = "Мужской"
                        } label: {
                            HStack {
                                Text("Мужской")
                                    .padding()
                                    .foregroundColor(Color(uiColor: Gray2))
                                Spacer()
                            }
                                
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                        .cornerRadius(14, corners: [.topLeft, .topRight])
                    }
                    
                    if gender != active1 {
                        Button() {
                            withAnimation() {
                                self.expand.toggle()
                            }
                            
                            gender = "Женский"
                        } label: {
                            HStack {
                                Text("Женский")
                                    .foregroundColor(Color(uiColor: Gray2))
                                    .padding()
                                Spacer()
                            }
                                
                        }
                        .font(MontserratRegular_12)
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .foregroundColor(.black)
                        .cornerRadius(14, corners: [.topLeft, .topRight])
                    }
                }
            }
            
        })
    }
}
