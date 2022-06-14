//
//  EditProfileView.swift
//  Fitness App
//
//  Created by Alexander on 06.05.2022.
//

import Foundation
import SwiftUI

struct EditProfileView: View {
    
    let MontserratBold = Font.custom("Montserrat-Bold", size: 16)
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    let MontserratSemiBold_14 = Font.custom("Montserrat-SemiBold", size: 14)
    let MontserratSemiBold_16 = Font.custom("Montserrat-SemiBold", size: 16)
    let MontserratRegular_11 = Font.custom("Montserrat-Regular", size: 11)
    let MontserratRegular_10 = Font.custom("Montserrat-Regular", size: 10)
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratMedium_16 = Font.custom("Montserrat-Medium", size: 16)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    let RedMenu = UIColor(r: 242, g: 143, b: 143)
    let BlueButton = UIColor(r: 154, g: 192, b: 255)
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    
    @Binding var name: String
    @Binding var activeLevel: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var height: String
    @Binding var gender: String
    @Binding var moodColor: String
    
    @State private var selection = 1 // ДЛЯ ЗАВТРАКА ОБЕДА УЖИНА (ПЕРЕХОД ПО КНОПКАМ)
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>  // ДЛЯ КНОПКИ НАЗАД
    
    private let defaults = UserDefaults.standard
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Group {
                    Text("")
                    Text("Имя")
                        .font(MontserratRegular_12)
                        .foregroundColor(Color(uiColor: GrayMenu))
                        .padding(.horizontal, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField(name, text: $name)
                        .font(MontserratRegular_12)
                        .padding()
                        .frame(height: 48)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .background(Color(uiColor: BorderColor))
                        .cornerRadius(14)
                    Text("")
                    Text("Пол")
                        .font(MontserratRegular_12)
                        .foregroundColor(Color(uiColor: GrayMenu))
                        .padding(.horizontal, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack {
                        if gender == "Мужчина" {
                            Button {
                                gender = "Мужчина"
                            } label: {
                                
                                Image("Eclipse_Active")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    
                            }
                            .padding(.leading, 35)
                        }
                        else {
                            Button {
                                gender = "Мужчина"
                            } label: {
                                Image("Eclipse_")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    
                            }
                            .padding(.leading, 35)
                        }
                        Text("Мужской")
                            .font(MontserratRegular_10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        if gender == "Женщина" {
                            Button {
                                gender = "Женщина"
                            } label: {
                                Image("Eclipse_Active")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    
                            }
                            .padding(.leading, 35)
                        }
                        else {
                            Button {
                                gender = "Женщина"
                            } label: {
                                Image("Eclipse_")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    
                            }
                            .padding(.leading, 35)
                        }
                        Text("Женский")
                            .font(MontserratRegular_10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                Group {
                    Text("")
                    Text("Уровень активности")
                        .font(MontserratRegular_12)
                        .foregroundColor(Color(uiColor: GrayMenu))
                        .padding(.horizontal, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                DropDown(activeLevel: $activeLevel)
                    
                Text("")
                HStack {
                    VStack {
                        Text("Возраст")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.leading, 30)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField(age, text: $age)
                            .font(MontserratRegular_12)
                            .multilineTextAlignment(.center)
                            .frame(height: 48)
                            .frame(width: (UIScreen.main.bounds.width-60-110)/3, alignment: .center)
                            .background(Color(uiColor: BorderColor))
                            .cornerRadius(14)
                            //.frame(maxWidth: .infinity, alignment: .center)
                    }
                    Spacer()
                    VStack {
                        Text("Рост")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.leading, 30)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextField(height, text: $height)
                            .font(MontserratRegular_12)
                            .multilineTextAlignment(.center)
                            .frame(height: 48)
                            .frame(width: (UIScreen.main.bounds.width-60-110)/3, alignment: .center)
                            .background(Color(uiColor: BorderColor))
                            .cornerRadius(14)
                            //.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    VStack {
                        Text("Вес")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.leading, 30)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField(weight, text: $weight)
                            .font(MontserratRegular_12)
                            .multilineTextAlignment(.center)
                            .frame(height: 48)
                            .frame(width: (UIScreen.main.bounds.width-60-110)/3, alignment: .center)
                            .background(Color(uiColor: BorderColor))
                            .cornerRadius(14)
                            //.frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                
                Group {
                    Text("")
                    Text("Цвет твоего настроения")
                        .font(MontserratRegular_12)
                        .foregroundColor(Color(uiColor: GrayMenu))
                        .padding(.horizontal, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("")
                }
                HStack {
                    Group {
                        if moodColor == "Фиолетовый" {
                            Button {
                                moodColor = "Фиолетовый"
                            } label: {
                                Image("EllipsePurple_")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                        else {
                            Button {
                                moodColor = "Фиолетовый"
                            } label: {
                                Image("EllipsePurple")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                        
                        Spacer()
                        
                        if moodColor == "Красный" {
                            Button {
                                moodColor = "Красный"
                            } label: {
                                Image("EllipseRed_")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                        else {
                            Button {
                                moodColor = "Красный"
                            } label: {
                                Image("EllipseRed")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                        
                        Spacer()
                        
                        if moodColor == "Синий" {
                            Button {
                                moodColor = "Синий"
                            } label: {
                                Image("EllipseBlue_")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                        else {
                            Button {
                                moodColor = "Синий"
                            } label: {
                                Image("EllipseBlue")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                        
                        Spacer()
                        
                        if moodColor == "Зеленый" {
                            Button {
                                moodColor = "Зеленый"
                            } label: {
                                Image("EllipseGreen_")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                        else {
                            Button {
                                moodColor = "Зеленый"
                            } label: {
                                Image("EllipseGreen")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                        
                        Spacer()
                        
                        if moodColor == "Желтый" {
                            Button {
                                moodColor = "Желтый"
                            } label: {
                                Image("EllipseYellow_")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                        else {
                            Button {
                                moodColor = "Желтый"
                            } label: {
                                Image("EllipseYellow")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .padding(.horizontal, 7)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width-60)
                .padding(.bottom, 20)
                
                
                Spacer()
            }
        }
        .navigationBarHidden(false)
        .navigationTitle("Редактировать профиль")
            .font(MontserratBold)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image("Back-Navs")
                .resizable()
                .frame(width: 32, height: 32)
        })
    }
    func save() {
        defaults.set(name, forKey: "name")
        defaults.set(age, forKey: "age")
        defaults.set(activeLevel, forKey: "activeLevel")
        defaults.set(weight, forKey: "weight")
        defaults.set(height, forKey: "height")
    }

    func load() {
        let savedName = defaults.string(forKey: "name")
        let savedAge = defaults.string(forKey: "age")
        let savedActiveLevel = defaults.string(forKey: "activeLevel")

        age = savedAge ?? ""
        name = savedName ?? ""
        activeLevel = savedActiveLevel ?? ""
    }

}
    
