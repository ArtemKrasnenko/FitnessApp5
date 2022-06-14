//
//  ChartMealPlannerView.swift
//  Fitness App
//
//  Created by Alexander on 13.05.2022.
//

import SwiftUI
import RealmSwift

struct ChartMealPlannerView: View {
    
    @ObservedObject var CalendarModel: CalendarR
    
    @EnvironmentObject var realManager: RealmManager
    
    
    @FocusState var isFocused: Bool
    
    @State var showingB = false
    @State var showingL = false
    @State var showingD = false
    
    @State var nameProduct: String = ""
    @State var calloriesProduct: String = ""
    
    @Binding var name: String
    @Binding var activeLevel: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var height: String
    @Binding var gender: String
    @Binding var moodColor: String
    
    let BlueButton_Layer = UIColor(r: 154, g: 192, b: 255, a: 0.2)
    let MontserratBold = Font.custom("Montserrat-Bold", size: 16)
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    let MontserratSemiBold_14 = Font.custom("Montserrat-SemiBold", size: 14)
    let MontserratSemiBold_16 = Font.custom("Montserrat-SemiBold", size: 16)
    let MontserratRegular_11 = Font.custom("Montserrat-Regular", size: 11)
    let MontserratRegular_10 = Font.custom("Montserrat-Regular", size: 10)
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratMedium_16 = Font.custom("Montserrat-Medium", size: 16)
    let MontserratMedium_12 = Font.custom("Montserrat-Medium", size: 12)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    let RedMenu = UIColor(r: 242, g: 143, b: 143)
    let BlueButton = UIColor(r: 154, g: 192, b: 255)
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    let Purple = UIColor(r: 179, g: 127, b: 244)
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>  // ДЛЯ КНОПКИ НАЗАД
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                // КАЛЕНДАРЬ
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(CalendarModel.currentWeek, id: \.self) { day in
                            VStack(spacing: 10) {
                                Text(CalendarModel.extractDate(date: day, format: "EEE"))
                                    .font(MontserratRegular_12)
                                Text(CalendarModel.extractDate(date: day, format: "dd"))
                                    .font(MontserratSemiBold_12)
                            }
                            .frame(width: 60, height: 80)
                            .foregroundColor(CalendarModel.isToday(date: day) ? Color.white : Color(uiColor: GrayMenu))
                            .background(
                                ZStack {
                                    if CalendarModel.isToday(date: day) {
                                        Color(uiColor: BlueButton)
                                    }
                                    else {
                                        Color(uiColor: BorderColor)
                                    }
                                }
                            )
                            .contentShape(Capsule())
                            .onTapGesture {
                                withAnimation() {
//                                    realManager.currentDay = day
                                    CalendarModel.currentDay = day
                                }
                            }
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    
                }
                
                VStack(spacing: 18) {
                    // ЗАВТРАК
                    VStack() {
                        HStack {
                            Text("Завтрак")
                                .padding(.top, 20)
                                .font(MontserratSemiBold_16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            //СЧЕТЧИК КАЛЛОРИЙ
                            let calloriesBreakfast = EatCalloriessB(eat: realManager.TaskEatBreakfast2)
                            HStack {
                                Text(String(calloriesBreakfast))
                                    .font(MontserratSemiBold_12)
                                    .foregroundColor(Color(uiColor: GrayMenu))
                                    .padding(.top, 20)
                                Text("калорий")
                                    .font(MontserratSemiBold_12)
                                    .foregroundColor(Color(uiColor: GrayMenu))
                                    .padding(.top, 20)
                            }
                        }
                        // CАМИ РЕЦЕПТЫ ВЫБРАННЫЕ НА ЗАВТРАК
                        VStack() {
                            if let eats = CalendarModel.filteredEatB {
                                if eats.isEmpty {
                                }
                                else {
                                    ForEach(eats) { eat in
                                        if !eat.isInvalidated {
                                            EatRowB(CalendarModel: CalendarModel, ID: eat.id, title: eat.EatTitle, image: eat.EatImage)
                                                .environmentObject(realManager)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width-60)
                                }
                            }
                            else {
                                ProgressView()
                                    .offset(y: -100)
                            }
                            
                           
                        }
                        HStack {
                            Button {
                                self.showingB = true
                                isFocused = true
                                nameProduct = ""
                                calloriesProduct = ""
                                
                            } label: {
                                Image("Group")
                                    .resizable()
                                    .frame(width: 59, height: 59, alignment: .leading)
                            }
                            .padding(.top, 10)
                            
                            Spacer()
                        }
                        .sheet(isPresented: $showingB) {
                            AddViewB(CalendarModel: CalendarModel, showingB: $showingB, nameProduct: $nameProduct, calloriesProduct: $calloriesProduct, isFocused: $isFocused)
                                .environmentObject(realManager)
                        }
                    }
                    
                    // ОБЕД
                    VStack() {
                        HStack {
                            Text("Обед")
                                .padding(.top, 20)
                                .font(MontserratSemiBold_16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            //СЧЕТЧИК КАЛЛОРИЙ
                            let calloriesBreakfast = EatCalloriessL(eat: realManager.TaskEatLanch2)
                            HStack {
                                Text(String(calloriesBreakfast))
                                    .font(MontserratSemiBold_12)
                                    .foregroundColor(Color(uiColor: GrayMenu))
                                    .padding(.top, 20)
                                Text("калорий")
                                    .font(MontserratSemiBold_12)
                                    .foregroundColor(Color(uiColor: GrayMenu))
                                    .padding(.top, 20)
                            }
                        }
                        // CАМИ РЕЦЕПТЫ ВЫБРАННЫЕ НА ЗАВТРАК
                        VStack() {
                            if let eats = CalendarModel.filteredEatL {
                                if eats.isEmpty {
                                }
                                else {
                                    ForEach(eats) { eat in
                                        if !eat.isInvalidated {
                                            EatRowL(CalendarModel: CalendarModel, ID: eat.id, title: eat.EatTitle, image: eat.EatImage)
                                                .environmentObject(realManager)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width-60)
                                }
                            }
                            else {
                                ProgressView()
                                    .offset(y: 100)
                            }
                        }
                        HStack {
                            Button {
                                self.showingL = true
                                isFocused = true
                                nameProduct = ""
                                calloriesProduct = ""
                            } label: {
                                Image("Group")
                                    .resizable()
                                    .frame(width: 59, height: 59, alignment: .leading)
                            }
                            .padding(.top, 10)
                            
                            Spacer()
                        }
                        .sheet(isPresented: $showingL) {
                            AddViewL(CalendarModel: CalendarModel, showingL: $showingL, nameProduct: $nameProduct, calloriesProduct: $calloriesProduct, isFocused: $isFocused)
                        }
                        .environmentObject(RealmManager())
                    }
                    
                    // УЖИН
                    VStack() {
                        HStack {
                            Text("Ужин")
                                .padding(.top, 20)
                                .font(MontserratSemiBold_16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            //СЧЕТЧИК КАЛЛОРИЙ
                            let calloriesBreakfast = EatCalloriessD(eat: realManager.TaskEatDinner2)
                            HStack {
                                Text(String(calloriesBreakfast))
                                    .font(MontserratSemiBold_12)
                                    .foregroundColor(Color(uiColor: GrayMenu))
                                    .padding(.top, 20)
                                Text("калорий")
                                    .font(MontserratSemiBold_12)
                                    .foregroundColor(Color(uiColor: GrayMenu))
                                    .padding(.top, 20)
                            }
                        }
                        // CАМИ РЕЦЕПТЫ ВЫБРАННЫЕ НА ЗАВТРАК
                        VStack() {
                            if let eats = CalendarModel.filteredEatD {
                                if eats.isEmpty {
                                }
                                else {
                                    ForEach(eats){ eat in
                                        if !eat.isInvalidated {
                                            EatRowD(CalendarModel: CalendarModel, ID: eat.id, title: eat.EatTitle, image: eat.EatImage)
                                                .environmentObject(realManager)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width-60)
                                }
                            }
                            else {
                                ProgressView()
                                    .offset(y: 100)
                            }
                        }
                        HStack {
                            Button {
                                self.showingD = true
                                isFocused = true
                                nameProduct = ""
                                calloriesProduct = ""
                            } label: {
                                Image("Group")
                                    .resizable()
                                    .frame(width: 59, height: 59, alignment: .leading)
                            }
                            .padding(.top, 10)
                            
                            Spacer()
                        }
                        .sheet(isPresented: $showingD) {
                            AddViewD(CalendarModel: CalendarModel, showingD: $showingD, nameProduct: $nameProduct, calloriesProduct: $calloriesProduct, isFocused: $isFocused)
                        }
                        .environmentObject(RealmManager())
                    }
                }
                .frame(width: UIScreen.main.bounds.width-60)
                .onChange(of: CalendarModel.currentDay) { newValue in
                    CalendarModel.filterTodayEat()
                }
            }
        }
        VStack {
            VStack {
                HStack {
                    Text("Калории")
                        .font(MontserratMedium_12)
                    Spacer()
                    Text(String(EatCalloriessD(eat: realManager.TaskEatDinner2) + EatCalloriessL(eat: realManager.TaskEatLanch2) + EatCalloriessB(eat: realManager.TaskEatBreakfast2)) + " калорий")
                        .font(MontserratRegular_10)
                        .foregroundColor(Color(uiColor: GrayMenu))
                }
                ZStack {
                    Color(uiColor: BorderColor)
                        .frame(height: 10)
                        .cornerRadius(99)
                    HStack {
                        Color(uiColor: Purple)
                            .frame(height: 10)
                            .cornerRadius(99)
                            .frame(width: SummCallories(), alignment: .trailing)
                        Spacer()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width-60)
                }
            }
            .padding()
            .frame(height: 63)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding(.bottom, 5)
            Text("Ваша примерная суточная норма калорий: " + String(Calc(activeLevel: activeLevel, age: age, weight: weight, height: height, gender: gender)))
                .font(MontserratRegular_11)
                .foregroundColor(Color(uiColor: GrayMenu))
        }
        .frame(width: UIScreen.main.bounds.width-60)
        .navigationBarHidden(false)
        .navigationTitle("График приема пищи")
            .font(MontserratBold)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button() {
            self.mode.wrappedValue.dismiss()
            CalendarModel.currentDay = Date()
        } label: {
            Image("Back-Navs")
                .resizable()
                .frame(width: 32, height: 32)
        })
    }
    
    
    // ДЛЯ ШКАЛЫ КАЛЛОРИЙ
    func SummCallories() -> CGFloat {
        let sum = CGFloat(EatCalloriessD(eat: realManager.TaskEatDinner2) + EatCalloriessL(eat: realManager.TaskEatLanch2) + EatCalloriessB(eat: realManager.TaskEatBreakfast2))
        let sum2 = CGFloat(UIScreen.main.bounds.width-60) * sum / CGFloat(Calc(activeLevel: activeLevel, age: age, weight: weight, height: height, gender: gender))
        var w: CGFloat = sum2
        if w > UIScreen.main.bounds.width-60 {
            w = UIScreen.main.bounds.width-60
        }
        return w
    }
    
    // CЧЕТЧИК КАЛОРИЙ
    func EatCalloriessB(eat: [Eat2]) -> Int {
        var calloriesB = 0

        if let eats = CalendarModel.filteredEatB {
            if eats.isEmpty {
                
                calloriesB = 0
            }
            else {
                for i in eats {
                    calloriesB += i.EatCallories
                }
            }
        }
        return calloriesB
    }
    
    func EatCalloriessL(eat: [Eat2]) -> Int {
        var calloriesL = 0
        if let eats = CalendarModel.filteredEatL {
            if eats.isEmpty {
                
                calloriesL = 0
            }
            else {
                for i in eats {
                    calloriesL += i.EatCallories
                }
            }
        }
        return calloriesL
    }
    
    func EatCalloriessD(eat: [Eat2]) -> Int {
        var calloriesD = 0
        if let eats = CalendarModel.filteredEatD {
            if eats.isEmpty {
                
                calloriesD = 0
            }
            else {
                for i in eats {
                    calloriesD += i.EatCallories
                }
            }
        }
        return calloriesD
    }
    
    // ДАТА СВЕРХУ
    func HeaderView() -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
    }
    
    func EatCardView3(eat: Eat2) -> some View {
        HStack {
            Image(eat.EatImage)
                .resizable()
                .frame(width: 59, height: 59, alignment: .leading)
            VStack(alignment: .leading) {
                Text(eat.EatTitle)
                    .font(MontserratSemiBold_12)
            }
            Spacer()
        }
    }
    
    // КАРТОЧКА ДЛЯ ЕДЫ В КАЛЕНДАРЕ
    func EatCardView2() -> some View {
        ForEach(realManager.TaskEatBreakfast2) { eats in
            if !eats.isInvalidated {
                EatRowB(CalendarModel: CalendarModel, ID: eats.id, title: eats.EatTitle, image: eats.EatImage)
                    .environmentObject(realManager)
            }
        }
        .frame(width: UIScreen.main.bounds.width-60)
    }
}


