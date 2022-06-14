//
//  ProfileView.swift
//  Fitness App
//
//  Created by Alexander on 05.05.2022.
//

import Foundation
import SwiftUI

struct MealPlannerView: View {
    
    @StateObject var CalendarModel: CalendarR = CalendarR()
    @EnvironmentObject var realManager: RealmManager
    
    let MontserratBold_16 = Font.custom("Montserrat-Bold", size: 16)
    let MontserratBold_14 = Font.custom("Montserrat-Bold", size: 14)
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    let MontserratSemiBold_14 = Font.custom("Montserrat-SemiBold", size: 14)
    let MontserratSemiBold_16 = Font.custom("Montserrat-SemiBold", size: 16)
    let MontserratRegular_11 = Font.custom("Montserrat-Regular", size: 11)
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratRegular_14 = Font.custom("Montserrat-Regular", size: 14)
    let MontserratMedium_12 = Font.custom("Montserrat-Medium", size: 12)
    let MontserratMedium_16 = Font.custom("Montserrat-Medium", size: 16)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    let RedMenu = UIColor(r: 242, g: 143, b: 143)
    let BlueButton = UIColor(r: 154, g: 192, b: 255)
    let RedButton = UIColor(r: 242, g: 143, b: 143)
    let PurpleButton = UIColor(r: 179, g: 127, b: 244)
    let BlueButton_Layer = UIColor(r: 154, g: 192, b: 255, a: 0.2)
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    
    @State var k: Int8 = 0
    @State var selection: Int? = nil
    
    @State var c = 1
    
    @Binding var name: String
    @Binding var activeLevel: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var height: String
    @Binding var gender: String
    @Binding var moodColor: String
    
    @State var activeEat: String = "Завтрак"
    var body: some View {
        ZStack(alignment: .top) {
            // ФОН
            VStack(spacing: -1) {
                Spacer()
                Image("Line")
                    .resizable()
                    .frame(width: 1000, height: 1.5)
                    .padding(.top, -17)
            }
            
            VStack(spacing: 15) {
                Text("")
                Text("")
                Text("Планировщик еды")
                    .font(MontserratBold_16)
                    .frame(width: (UIScreen.main.bounds.width), alignment: .center)
                    .padding(.bottom, 5)
                    .background(Color.white)
                    

                ScrollView(showsIndicators: false) {
                    VStack {
                        // ГРАФИК ПРИЕМА ПИЩИ
                        ZStack {
                            Color(uiColor: BlueButton_Layer)
                            HStack {
                                Text("График приема пищи")
                                    .font(MontserratSemiBold_14)
                                    .padding(.leading)
                                Spacer()
                                NavigationLink(destination: ChartMealPlannerView(CalendarModel: CalendarModel, name: $name, activeLevel: $activeLevel, age: $age, weight: $weight, height: $height, gender: $gender, moodColor: $moodColor).environmentObject(realManager), tag: 30, selection: $selection) {
                                    Button {
                                        self.selection = 30
//                                        realManager.getEat()
                                    } label: {
                                        Text("Проверить")
                                            .font(MontserratMedium_12)
                                            .foregroundColor(.white)
                                            .frame(width: 94, height: 28)
                                            .background(Color(uiColor: BlueButton))
                                            .cornerRadius(50)
                                    }
                                }
                                .padding(.trailing)
                            }
                        }
                        .frame(height: 57)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .cornerRadius(16)
                        .padding(.bottom, 15)
                        
                        // РАЦИОН НА СЕГОДНЯ
                        VStack {
                            HStack {
                                Text("Рацион на сегодня")
                                    .font(MontserratSemiBold_16)
                                    .padding(.top, 5)
                                Spacer()
                            }
                            .padding(.bottom, 10)
                            if c == 1 {
                                if let eats = CalendarModel.filteredEatB {
                                    if eats.isEmpty {
                                        Text("Для того, чтобы составить свой рацион\nперейдите в раздел 'График приема пищи'")
                                            .font(MontserratRegular_12)
                                            .multilineTextAlignment(.center)
                                            .frame(height: 54)
                                            .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                                            .background(Color(uiColor: BlueButton_Layer))
                                            .cornerRadius(12)
                                    }
                                    else {
                                        ForEach(eats) { eat in
                                            EatCardView(eat: eat)
                                        }
                                    }
                                }
                                else {
                                    ProgressView()
                                        .offset(y: -100)
                                }
                            }
                            if c == 2 {
                                if let eats = CalendarModel.filteredEatL {
                                    if eats.isEmpty {
                                        Text("Для того, чтобы составить свой рацион\nперейдите в раздел 'График приема пищи'")
                                            .font(MontserratRegular_12)
                                            .multilineTextAlignment(.center)
                                            .frame(height: 54)
                                            .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                                            .background(Color(uiColor: BlueButton_Layer))
                                            .cornerRadius(12)
                                    }
                                    else {
                                        ForEach(eats) { eat in
                                            EatCardView(eat: eat)
                                        }
                                    }
                                }
                                else {
                                    ProgressView()
                                        .offset(y: -100)
                                }
                            }
                            if c == 3 {
                                if let eats = CalendarModel.filteredEatD {
                                    if eats.isEmpty {
                                        Text("Для того, чтобы составить свой рацион\nперейдите в раздел 'График приема пищи'")
                                            .font(MontserratRegular_12)
                                            .multilineTextAlignment(.center)
                                            .frame(height: 54)
                                            .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                                            .background(Color(uiColor: BlueButton_Layer))
                                            .cornerRadius(12)
                                    }
                                    else {
                                        ForEach(eats) { eat in
                                            EatCardView(eat: eat)
                                        }
                                    }
                                }
                                else {
                                    ProgressView()
                                        .offset(y: -100)
                                }
                            }
                        }
                        .overlay(DropDown2(activeEat: $activeEat, c: $c), alignment: .topTrailing)
                        .frame(width: UIScreen.main.bounds.width-63, alignment: .center)
                        .padding(.bottom, 15)
                       
                        // СГЕНЕРИРУЙ СВОЙ ЗДОРОВЫЙ РАЦИОН
                        HStack {
                            Text("Сгенерируй свой здоровый рацион")
                                //.padding(.leading, -8)
                                .font(MontserratSemiBold_16)
                            Spacer()
                        }
                        .padding(.bottom, 15)
                            
                        
                        ZStack(alignment: .leading) {
                            Image("Breakfast-Card")
                                .resizable()
                                .frame(height: 154)
                                .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                            VStack(alignment: .leading) {
                                Text("Завтрак")
                                    .font(MontserratMedium_16)
                                    .padding(.bottom, 1)
                                Text("Самый важный прием пищи")
                                    .font(MontserratRegular_14)
                                    .foregroundColor(Color(uiColor: GrayMenu))
                                    .padding(.bottom, 15)
                                NavigationLink(destination: BreakfastView(k: $k), tag: 1, selection: $selection) {
                                    Button {
                                        k = 1
                                        self.selection = 1
                                    } label: {
                                        Text("Выбрать")
                                            .font(MontserratMedium_12)
                                            .foregroundColor(.white)
                                            .frame(width: 112, height: 34)
                                            .background(Color(uiColor: BlueButton))
                                            .cornerRadius(57)
                                    }
                                }
                                
                            }
                            .padding(.leading, 30)
                        }
                        .padding(.bottom, 8)
                        
                        ZStack(alignment: .leading) {
                            Image("Breakfast-Card-2")
                                .resizable()
                                .frame(height: 154)
                                .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                            VStack(alignment: .leading) {
                                Text("Обед")
                                    .font(MontserratMedium_16)
                                    .padding(.bottom, 1)
                                Text("Дневной прием пищи")
                                    .font(MontserratRegular_14)
                                    .foregroundColor(Color(uiColor: GrayMenu))
                                    .padding(.bottom, 15)
                                    .multilineTextAlignment(.leading)
                                NavigationLink(destination: LunchView(k: $k), tag: 2, selection: $selection) {
                                    Button {
                                        k = 2
                                        self.selection = 2
                                    } label: {
                                        Text("Выбрать")
                                            .font(MontserratMedium_12)
                                            .foregroundColor(.white)
                                            .frame(width: 112, height: 34)
                                            .background(Color(uiColor: RedButton))
                                            .cornerRadius(57)
                                    }
                                }
                                
                            }
                            .padding(.leading, 30)
                        }
                        .padding(.bottom, 8)
                        
                        ZStack(alignment: .leading) {
                            Image("Breakfast-Card-3")
                                .resizable()
                                .frame(height: 154)
                                .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                            VStack(alignment: .leading) {
                                Text("Ужин")
                                    .font(MontserratMedium_16)
                                    .padding(.bottom, 1)
                                Text("Последний прием пищи")
                                    .font(MontserratRegular_14)
                                    .foregroundColor(Color(uiColor: GrayMenu))
                                    .padding(.bottom, 15)
                                
                                NavigationLink(destination: DinnerView(k: $k), tag: 3, selection: $selection) {
                                    Button {
                                        k = 3
                                        self.selection = 3
                                    } label: {
                                        Text("Выбрать")
                                            .font(MontserratMedium_12)
                                            .foregroundColor(.white)
                                            .frame(width: 112, height: 34)
                                            .background(Color(uiColor: PurpleButton))
                                            .cornerRadius(57)
                                    }
                                }
                            }
                            .padding(.leading, 30)
                        }
                        .padding(.bottom, 8)
                        
                        Spacer()
                    }
                    .frame(width: (UIScreen.main.bounds.width-55), alignment: .center)
                }
                .padding(.bottom, 100)
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
    func EatCardView(eat: Eat2) -> some View {
        ZStack {
            HStack {
                Image(eat.EatImage)
                    .resizable()
                    .frame(width: 61.5, height: 61.5)
                    .padding(10)
                VStack(alignment: .leading) {
                    Text(eat.EatTitle)
                        .font(MontserratSemiBold_12)
                        .padding(.trailing, -20)
                }.zIndex(1)
                Spacer()
                ZCalendar()
                    .frame(width: 100)
                    .zIndex(2)
            }
            .frame(height: 80)
            .frame(width: (UIScreen.main.bounds.width-63), alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 1)
            )
        }
    }
}
