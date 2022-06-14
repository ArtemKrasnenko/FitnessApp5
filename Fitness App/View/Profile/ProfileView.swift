//
//  ProfileView.swift
//  Fitness App
//
//  Created by Alexander on 05.05.2022.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var realManager: RealmManager
    
    let MontserratBold = Font.custom("Montserrat-Bold", size: 16)
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    let MontserratSemiBold_14 = Font.custom("Montserrat-SemiBold", size: 14)
    let MontserratSemiBold_16 = Font.custom("Montserrat-SemiBold", size: 16)
    let MontserratRegular_11 = Font.custom("Montserrat-Regular", size: 11)
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratMedium = Font.custom("Montserrat-Medium", size: 12)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    let RedMenu = UIColor(r: 242, g: 143, b: 143)
    let BlueButton = UIColor(r: 154, g: 192, b: 255)
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    
    @State var isOn: Bool = false // ДЛЯ ПОЛЗУНКА
    
    @Binding var name: String
    @Binding var activeLevel: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var height: String
    @Binding var gender: String
    @Binding var moodColor: String
    
    private let defaults = UserDefaults.standard
    
    var body: some View {

        
        ZStack(alignment: .top) {
            // ФОН
            VStack(spacing: -1) {
                Spacer()
                Image("urban")
                    .resizable()
                    .frame(width: 255, height: 291)
                    .frame(width: UIScreen.main.bounds.width-120, alignment: .center)
                    .padding(.bottom, 17)
                    
                Image("Line")
                    .resizable()
                    .frame(width: 1000, height: 1.5)
                    .padding(.top, -17)
                
            }
            
            
            VStack(spacing: 15) {
                Text("")
                Text("")
                Text("Профиль")
                    .font(MontserratBold)
                
                // ИМЯ + ЗАГОЛОВОК
                HStack() {
                    if moodColor == "Фиолетовый" {
                        Image("EllipsePurple_")
                            .resizable()
                            .frame(width: 55, height: 55)
                    }
                    if moodColor == "Красный" {
                        Image("EllipseRed_")
                            .resizable()
                            .frame(width: 55, height: 55)
                    }
                    if moodColor == "Синий" {
                        Image("EllipseBlue_")
                            .resizable()
                            .frame(width: 55, height: 55)
                    }
                    if moodColor == "Зеленый" {
                        Image("EllipseGreen_")
                            .resizable()
                            .frame(width: 55, height: 55)
                    }
                    if moodColor == "Желтый" {
                        Image("EllipseYellow_")
                            .resizable()
                            .frame(width: 55, height: 55)
                    }
                    
                    HStack() {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(name)
                                .font(MontserratSemiBold_12)
                            Text(gender)
                                .font(MontserratRegular_11)
                                .foregroundColor(Color(uiColor: GrayMenu))
                        }
                        Spacer()
                    }
                    .padding(.leading, 5)
                    Spacer()
                    NavigationLink(destination: EditProfileView(name: $name, activeLevel: $activeLevel, age: $age, weight: $weight, height: $height, gender: $gender, moodColor: $moodColor)) {
                        Text("Изменить")
                            .font(MontserratMedium)
                            .foregroundColor(.white)
                            .frame(width: 95, height: 30)
                            .background(Color(uiColor: BlueButton))
                            .cornerRadius(99)
                    }
                }
                .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                
                // РОСТ + ВЕС + ВОЗРАСТ
                HStack {
                    // ВОЗРАСТ
                    VStack {
                        VStack {
                            Text(age)
                                .font(MontserratSemiBold_14)
                                .foregroundColor(Color(uiColor: BlueText))
                            Spacer()
                                .frame(height: 5)
                            Text("Возраст")
                                .font(MontserratRegular_12)
                                .foregroundColor(Color(uiColor: GrayMenu))
                        }
                        .frame(height: 65)
                        .frame(width: (UIScreen.main.bounds.width-60-16)/3, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    }
                    
                    Spacer()

                    // РОСТ
                    VStack {
                        VStack {
                            Text(height + "см")
                                .font(MontserratSemiBold_14)
                                .foregroundColor(Color(uiColor: BlueText))
                            Spacer()
                                .frame(height: 5)
                            Text("Рост")
                                .font(MontserratRegular_12)
                                .foregroundColor(Color(uiColor: GrayMenu))
                        }
                        
                        .frame(height: 65)
                        .frame(width: (UIScreen.main.bounds.width-60-16)/3, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    }
                    
                    Spacer()
                    
                    // ВЕС
                    VStack {
                        Text(weight + "кг")
                            .font(MontserratSemiBold_14)
                            .foregroundColor(Color(uiColor: BlueText))
                        Spacer()
                            .frame(height: 5)
                        Text("Вес")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                    }
                    .frame(height: 65)
                    .frame(width: (UIScreen.main.bounds.width-60-16)/3, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
                .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                
                // СУТОЧНАЯ НОРМА КАЛОРИЙ
                HStack {
                    VStack {
                        dynamic let callories: Int = Calc(activeLevel: activeLevel, age: age, weight: weight, height: height, gender: gender)
                        Text(String(callories))
                            .font(MontserratSemiBold_14)
                            .foregroundColor(Color(uiColor: BlueText))
                        Spacer()
                            .frame(height: 5)
                        Text("Примерная суточная норма калорий")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                    }
                    .frame(height: 65)
                    .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.horizontal)
                }
                
                // СТАТИСТИКА ВЕСА
                HStack {
                    Text("Статистика веса")
                        .font(MontserratSemiBold_14)
                        .foregroundColor(Color(uiColor: RedMenu))
                        .padding(.leading)
                    Spacer()
                    NavigationLink(destination: StatisticsWeightView().environmentObject(realManager)) {
                        VStack {
                            Text("Посмотреть")
                                .font(MontserratMedium)
                                .foregroundColor(.white)
                        }
                        .frame(width: 126, height: 30)
                        .background(Color(uiColor: RedMenu))
                        .cornerRadius(50)
                        .padding()
                    }
                }
                .frame(height: 57)
                .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.horizontal)
                
                // УВЕДОМЛЕНИЯ
                VStack {
                    HStack {
                        Text("Уведомления")
                            .font(MontserratSemiBold_16)
                            .padding()
                        Spacer()
                    }
                    .padding(.vertical, -10)
                    HStack {
                        Image("Notification")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading)
                        Text("Всплывающее уведомление")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                        Spacer()
                        ToggleView(isOn: $isOn) {
                            Color(uiColor: RedMenu)
                        }
                        .frame(width: 36, height: 18)
                        .padding()
                    }
                }
                .frame(height: 99)
                .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.horizontal)
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
    }
}

func Calc(activeLevel: String, age: String, weight: String, height: String, gender: String) -> Int {
    
    var stage1: Float = 0.0
    var stage2: Float = 0.0
    var stage3: Float = 0.0
    var stage4: Float = 0.0
    var stage5: Float = 0.0
    var stage6: Float = 0.0
    var stage7: Float = 0.0
    var stage8: Int = 8

    var genderInt: Float = 0.0
    var activeLevelInt: Float = 0.0
    
    
    if gender == "Мужчина"{
        genderInt = -5
    }
    else {
        genderInt = 161
    }

    if activeLevel == "Минимальный" {
        activeLevelInt = 1.2
    }
    else if activeLevel == "Низкий" {
        activeLevelInt = 1.38
    }
    else if activeLevel == "Средний" {
        activeLevelInt = 1.46
    }
    else if activeLevel == "Высокий" {
        activeLevelInt = 1.64
    }
    else if activeLevel == "Очень высокий" {
        activeLevelInt = 1.9
    }

    stage1 = (Float(weight) ?? 0) * 10
    stage2 = (Float(height) ?? 0) * 6.25
    stage3 = stage1 + stage2
    stage4 = (Float(age) ?? 0) * 5
    stage5 = stage3 - stage4
    stage6 = stage5 - genderInt
    stage7 = stage6 * activeLevelInt
    stage8 = Int(stage7)
    return stage8
}
