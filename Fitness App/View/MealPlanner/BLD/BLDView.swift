//
//  BLDView.swift
//  Fitness App
//
//  Created by Alexander on 15.05.2022.
//

import SwiftUI

struct BLDView: View {
    
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
    let BlueButton_Layer = UIColor(r: 154, g: 192, b: 255, a: 0.2)
    let BlueButton_2 = UIColor(r: 194, g: 217, b: 255)
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    
    @State var k1: Bool = false // Помидор !!!
    @State var k2: Bool = false // Огурец
    @State var k3: Bool = false // Кукуруза
    @State var k4: Bool = false // Лук репчатый
    @State var k5: Bool = false // Картофель
    @State var k6: Bool = false // Морковь
    @State var k7: Bool = false // Грибы
    @State var k8: Bool = false // Петрушка !!!
    @State var k9: Bool = false // Укроп !!!
    @State var k10: Bool = false // Тыква
    @State var k11: Bool = false // Кабачок !!!
    @State var k12: Bool = false // Яблоко
    @State var k13: Bool = false // Банан !!!
    @State var k14: Bool = false // Апельсин
    @State var k15: Bool = false // Клубника
    @State var k16: Bool = false // Авокадо !!!
    @State var k17: Bool = false // Черника
    @State var k18: Bool = false // Груша
    @State var k19: Bool = false // Лимон !!!
    @State var k20: Bool = false // Мука !!!
    @State var k21: Bool = false // Хлеб !!!
    @State var k22: Bool = false // Макароны
    @State var k23: Bool = false // Ветчина
    @State var k24: Bool = false // Колбача
    @State var k25: Bool = false // Мясо
    @State var k26: Bool = false // Птица
    @State var k27: Bool = false // Молоко !!!
    @State var k28: Bool = false // Творог !!!
    @State var k29: Bool = false // Сыр !!!
    @State var k30: Bool = false // Геркулес
    @State var k31: Bool = false // Овсяные хлопья !!!
    @State var k32: Bool = false // Крупа перловая
    @State var k33: Bool = false // Рис !!!
    @State var k34: Bool = false // Яйца !!!
    @State var k35: Bool = false // Сахар !!!
    @State var k36: Bool = false // Соль !!!
    
    @Binding var k: Int8 // ЗАВТРАК/ОБЕД/УЖИН
    
    @State var ArrayIngridients: [String] = [] //МАССИВ ВЫБРАНЫХ ИНГРИДИЕНТОВ

    var body: some View {
    
        // ГЕНЕРАТОР ЗДОРОВЫХ БЛЮД
        VStack {
            Group {
                Text("")
                Text("Генератор здоровых блюд")
                    .font(MontserratSemiBold_16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    Text("Выберите ингредиенты,\nкоторые есть у вас дома ")
                        .font(MontserratRegular_12)
                }
                .frame(height: 54)
                .frame(width: (UIScreen.main.bounds.width-55), alignment: .center)
                .background(Color(uiColor: BlueButton_Layer))
                .cornerRadius(12)
            }
        }
        .padding(.bottom, 25)
        
        // ОВОЩИ
        VStack {
            Text("Овощи")
                .font(MontserratSemiBold_16)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        if k1 == false {
                            Button {
                                withAnimation() {
                                    k1 = true
                                }
                                ArrayIngridients.append("k1")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Помидор")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 102, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k1 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k1"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Помидор")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 102, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k2 == false {
                            Button {
                                withAnimation() {
                                    k2 = true
                                }
                                ArrayIngridients.append("k2")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Огурец")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 102, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k2 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k2"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Огурец")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 102, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k3 == false {
                            Button {
                                withAnimation() {
                                    k3 = true
                                }
                                ArrayIngridients.append("k3")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Кукуруза")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 98, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k3 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k3"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Кукуруза")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 98, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        Spacer()
                    }
                    
                    HStack {
                        if k4 == false {
                            Button {
                                withAnimation() {
                                    k4 = true
                                }
                                ArrayIngridients.append("k4")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Лук репчатый")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 129, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k4 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k4"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Лук репчатый")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 129, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k5 == false {
                            Button {
                                withAnimation() {
                                    k5 = true
                                }
                                ArrayIngridients.append("k5")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Картофель")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 111, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k5 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k5"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Картофель")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 111, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                       Spacer()
                    }
                    
                    HStack {
                        if k6 == false {
                            Button {
                                withAnimation() {
                                    k6 = true
                                }
                                ArrayIngridients.append("k6")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Морковь")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 99, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k6 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k6"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Морковь")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 99, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k7 == false {
                            Button {
                                withAnimation() {
                                    k7 = true
                                }
                                ArrayIngridients.append("k7")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Грибы")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 87, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k7 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k7"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Грибы")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 87, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k8 == false {
                            Button {
                                withAnimation() {
                                    k8 = true
                                }
                                ArrayIngridients.append("k8")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Петрушка")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 106, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k8 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k8"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Петрушка")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 106, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                       Spacer()
                    }
                    
                    HStack {
                        if k9 == false {
                            Button {
                                withAnimation() {
                                    k9 = true
                                }
                                ArrayIngridients.append("k9")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Укроп")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 88, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k9 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k9"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Укроп")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 88, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k10 == false {
                            Button {
                                withAnimation() {
                                    k10 = true
                                }
                                ArrayIngridients.append("k10")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Тыква")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 87, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k10 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k10"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Тыква")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 87, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k11 == false {
                            Button {
                                withAnimation() {
                                    k11 = true
                                }
                                ArrayIngridients.append("k11")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Кабачок")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 98, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k11 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k11"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Кабачок")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 98, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                       Spacer()
                    }
                }
            }
        }
        .padding(.bottom, 25)
        .padding(.leading, 1)
        
        // ФРУКТЫ
        VStack {
            Text("Фрукты")
                .font(MontserratSemiBold_16)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        if k12 == false {
                            Button {
                                withAnimation() {
                                    k12 = true
                                }
                                ArrayIngridients.append("k12")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Яблоко")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 95, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k12 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k12"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Яблоко")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 95, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k13 == false {
                            Button {
                                withAnimation() {
                                    k13 = true
                                }
                                ArrayIngridients.append("k13")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Банан")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 86, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k13 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k13"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Банан")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 86, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k14 == false {
                            Button {
                                withAnimation() {
                                    k14 = true
                                }
                                ArrayIngridients.append("k14")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Апельсин")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 103, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k14 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k14"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Апельсин")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 103, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        Spacer()
                    }
                    
                    HStack {
                        if k15 == false {
                            Button {
                                withAnimation() {
                                    k15 = true
                                }
                                ArrayIngridients.append("k15")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Клубника")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 103, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k15 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k15"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Клубника")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 103, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k16 == false {
                            Button {
                                withAnimation() {
                                    k16 = true
                                }
                                ArrayIngridients.append("k16")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Авокадо")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 99, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k16 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k16"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Авокадо")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 99, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k17 == false {
                            Button {
                                withAnimation() {
                                    k17 = true
                                }
                                ArrayIngridients.append("k17")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Черника")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 98, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k17 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k17"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Черника")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 98, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                       Spacer()
                    }
                    
                    HStack {
                        if k18 == false {
                            Button {
                                withAnimation() {
                                    k18 = true
                                }
                                ArrayIngridients.append("k18")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Груша")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 88, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k18 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k18"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Груша")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 88, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k19 == false {
                            Button {
                                withAnimation() {
                                    k19 = true
                                }
                                ArrayIngridients.append("k19")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Лимон")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 90, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k19 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k19"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Лимон")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 90, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        
                       Spacer()
                    }
                }
            }
        }
        .padding(.bottom, 25)
        .padding(.leading, 1)
        
        // МУЧНОЕ
        VStack {
            Text("Мучное")
                .font(MontserratSemiBold_16)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        if k20 == false {
                            Button {
                                withAnimation() {
                                    k20 = true
                                }
                                ArrayIngridients.append("k20")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Мука")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 84, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k20 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k20"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Мука")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 84, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k21 == false {
                            Button {
                                withAnimation() {
                                    k21 = true
                                }
                                ArrayIngridients.append("k21")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Хлеб")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 84, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k21 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k21"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Хлеб")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 84, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k22 == false {
                            Button {
                                withAnimation() {
                                    k22 = true
                                }
                                ArrayIngridients.append("k22")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Макароны")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 109, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k22 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k22"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Макароны")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 109, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
        .padding(.bottom, 25)
        .padding(.leading, 1)
        
        //МЯСНЫЕ ПРОДУКТЫ
        VStack {
            Text("Мясные продукты")
                .font(MontserratSemiBold_16)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        if k23 == false {
                            Button {
                                withAnimation() {
                                    k23 = true
                                }
                                ArrayIngridients.append("k23")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Ветчина")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 97, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k23 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k23"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Ветчина")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 97, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k24 == false {
                            Button {
                                withAnimation() {
                                    k24 = true
                                }
                                ArrayIngridients.append("k24")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Колбаса")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 96, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k24 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k24"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Колбаса")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 96, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k25 == false {
                            Button {
                                withAnimation() {
                                    k25 = true
                                }
                                ArrayIngridients.append("k25")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Мясо")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 80, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k25 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k25"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Мясо")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 80, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        Spacer()
                    }
                    
                    HStack {
                        if k26 == false {
                            Button {
                                withAnimation() {
                                    k26 = true
                                }
                                ArrayIngridients.append("k26")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Птица")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 86, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k26 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k26"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Птица")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 86, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
        .padding(.bottom, 25)
        .padding(.leading, 1)
        
        //МОЛОЧНЫЕ ПРОДУКТЫ
        VStack {
            Text("Молочные продукты")
                .font(MontserratSemiBold_16)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        if k27 == false {
                            Button {
                                withAnimation() {
                                    k27 = true
                                }
                                ArrayIngridients.append("k27")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Молоко")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 94, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k27 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k27"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Молоко")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 94, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k28 == false {
                            Button {
                                withAnimation() {
                                    k28 = true
                                }
                                ArrayIngridients.append("k28")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Творог")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 91, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k28 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k28"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Творог")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 91, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k29 == false {
                            Button {
                                withAnimation() {
                                    k29 = true
                                }
                                ArrayIngridients.append("k29")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Сыр")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 77, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k29 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k29"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Сыр")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 77, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
        .padding(.bottom, 25)
        .padding(.leading, 1)
        
        //КРУПЫ
        VStack {
            Text("Крупы")
                .font(MontserratSemiBold_16)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        if k30 == false {
                            Button {
                                withAnimation() {
                                    k30 = true
                                }
                                ArrayIngridients.append("k30")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Геркулес")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 101, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k30 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k30"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Геркулес")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 101, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k31 == false {
                            Button {
                                withAnimation() {
                                    k31 = true
                                }
                                ArrayIngridients.append("k31")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Овсяные хлопья")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 139, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k31 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k31"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Овсяные хлопья")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 139, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        Spacer()
                    }
                    
                    HStack {
                        if k32 == false {
                            Button {
                                withAnimation() {
                                    k32 = true
                                }
                                ArrayIngridients.append("k32")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Крупа перловая")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 137, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k32 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k32"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Крупа перловая")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 137, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k33 == false {
                            Button {
                                withAnimation() {
                                    k33 = true
                                }
                                ArrayIngridients.append("k33")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Рис")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 74, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k33 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k33"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Рис")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 74, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
        .padding(.bottom, 25)
        .padding(.leading, 1)
        
        //ДРУГОЕ
        VStack {
            Text("Другое")
                .font(MontserratSemiBold_16)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                Group {
                    HStack {
                        if k34 == false {
                            Button {
                                withAnimation() {
                                    k34 = true
                                }
                                ArrayIngridients.append("k34")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Яйца")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 82, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k34 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k34"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Яйца")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 82, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k35 == false {
                            Button {
                                withAnimation() {
                                    k35 = true
                                }
                                ArrayIngridients.append("k35")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Сахар")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 86, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k35 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k35"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Сахар")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 86, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        
                        if k36 == false {
                            Button {
                                withAnimation() {
                                    k36 = true
                                }
                                ArrayIngridients.append("k36")
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Соль")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 81, height: 39)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            }
                        }
                        else {
                            Button {
                                withAnimation() {
                                    k36 = false
                                }
                                ArrayIngridients = ArrayIngridients.filter(){$0 != "k36"}
                            } label: {
                                HStack {
                                    Image("+")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                    Text("Соль")
                                        .font(MontserratRegular_11)
                                }
                                .foregroundColor(.black)
                                .frame(width: 81, height: 39)
                                .background(Color(uiColor: BlueButton_2))
                                .cornerRadius(13)
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
        .padding(.bottom, 25)
        .padding(.leading, 1)
        
        //СГЕНЕРИРОВАТЬ
        Group {
            VStack {
                if k == 1 {
                    NavigationLink(destination: SecondBreakfastView(k1: $k1,
                                                                    k2: $k2,
                                                                    k3: $k3,
                                                                    k4: $k4,
                                                                    k5: $k5,
                                                                    k6: $k6,
                                                                    k7: $k7,
                                                                    k8: $k8,
                                                                    k9: $k9,
                                                                    k10: $k10,
                                                                    k11: $k11,
                                                                    k12: $k12,
                                                                    k13: $k13,
                                                                    k14: $k14,
                                                                    k15: $k15,
                                                                    k16: $k16,
                                                                    k17: $k17,
                                                                    k18: $k18,
                                                                    k19: $k19,
                                                                    k20: $k20,
                                                                    k21: $k21,
                                                                    k22: $k22,
                                                                    k23: $k23,
                                                                    k24: $k24,
                                                                    k25: $k25,
                                                                    k26: $k26,
                                                                    k27: $k27,
                                                                    k28: $k28,
                                                                    k29: $k29,
                                                                    k30: $k30,
                                                                    k31: $k31,
                                                                    k32: $k32,
                                                                    k33: $k33,
                                                                    k34: $k34,
                                                                    k35: $k35,
                                                                    k36: $k36,
                                                                    ArrayIngridients: $ArrayIngridients)) {
                        Text("Сгенерировать")
                            .font(MontserratBold)
                            .foregroundColor(.white)
                            .frame(height: 60)
                            .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                            .background(Color(uiColor: RedMenu))
                            .cornerRadius(99)
                    }
                }
                if k == 2 {
                    NavigationLink(destination: SecondLanchView(k1: $k1,
                                                                    k2: $k2,
                                                                    k3: $k3,
                                                                    k4: $k4,
                                                                    k5: $k5,
                                                                    k6: $k6,
                                                                    k7: $k7,
                                                                    k8: $k8,
                                                                    k9: $k9,
                                                                    k10: $k10,
                                                                    k11: $k11,
                                                                    k12: $k12,
                                                                    k13: $k13,
                                                                    k14: $k14,
                                                                    k15: $k15,
                                                                    k16: $k16,
                                                                    k17: $k17,
                                                                    k18: $k18,
                                                                    k19: $k19,
                                                                    k20: $k20,
                                                                    k21: $k21,
                                                                    k22: $k22,
                                                                    k23: $k23,
                                                                    k24: $k24,
                                                                    k25: $k25,
                                                                    k26: $k26,
                                                                    k27: $k27,
                                                                    k28: $k28,
                                                                    k29: $k29,
                                                                    k30: $k30,
                                                                    k31: $k31,
                                                                    k32: $k32,
                                                                    k33: $k33,
                                                                    k34: $k34,
                                                                    k35: $k35,
                                                                    k36: $k36,
                                                                    ArrayIngridients: $ArrayIngridients)) {
                        Text("Сгенерировать")
                            .font(MontserratBold)
                            .foregroundColor(.white)
                            .frame(height: 60)
                            .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                            .background(Color(uiColor: RedMenu))
                            .cornerRadius(99)
                    }
                }
                if k == 3 {
                    NavigationLink(destination: SecondDinnerView(k1: $k1,
                                                                    k2: $k2,
                                                                    k3: $k3,
                                                                    k4: $k4,
                                                                    k5: $k5,
                                                                    k6: $k6,
                                                                    k7: $k7,
                                                                    k8: $k8,
                                                                    k9: $k9,
                                                                    k10: $k10,
                                                                    k11: $k11,
                                                                    k12: $k12,
                                                                    k13: $k13,
                                                                    k14: $k14,
                                                                    k15: $k15,
                                                                    k16: $k16,
                                                                    k17: $k17,
                                                                    k18: $k18,
                                                                    k19: $k19,
                                                                    k20: $k20,
                                                                    k21: $k21,
                                                                    k22: $k22,
                                                                    k23: $k23,
                                                                    k24: $k24,
                                                                    k25: $k25,
                                                                    k26: $k26,
                                                                    k27: $k27,
                                                                    k28: $k28,
                                                                    k29: $k29,
                                                                    k30: $k30,
                                                                    k31: $k31,
                                                                    k32: $k32,
                                                                    k33: $k33,
                                                                    k34: $k34,
                                                                    k35: $k35,
                                                                    k36: $k36,
                                                                    ArrayIngridients: $ArrayIngridients)) {
                        Text("Сгенерировать")
                            .font(MontserratBold)
                            .foregroundColor(.white)
                            .frame(height: 60)
                            .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                            .background(Color(uiColor: RedMenu))
                            .cornerRadius(99)
                    }
                }
            }
        
            Spacer()
        }
    }
}
