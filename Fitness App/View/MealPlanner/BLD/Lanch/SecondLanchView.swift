//
//  SecondLanchView.swift
//  Fitness App
//
//  Created by Alexander on 17.05.2022.
//

import SwiftUI

struct SecondLanchView: View {
    
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
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode> // ДЛЯ КНОПКИ НАЗАД
    
    @Binding var k1: Bool
    @Binding var k2: Bool
    @Binding var k3: Bool
    @Binding var k4: Bool
    @Binding var k5: Bool
    @Binding var k6: Bool
    @Binding var k7: Bool
    @Binding var k8: Bool
    @Binding var k9: Bool
    @Binding var k10: Bool
    @Binding var k11: Bool
    @Binding var k12: Bool
    @Binding var k13: Bool
    @Binding var k14: Bool
    @Binding var k15: Bool
    @Binding var k16: Bool
    @Binding var k17: Bool
    @Binding var k18: Bool
    @Binding var k19: Bool
    @Binding var k20: Bool
    @Binding var k21: Bool
    @Binding var k22: Bool
    @Binding var k23: Bool
    @Binding var k24: Bool
    @Binding var k25: Bool
    @Binding var k26: Bool
    @Binding var k27: Bool
    @Binding var k28: Bool
    @Binding var k29: Bool
    @Binding var k30: Bool
    @Binding var k31: Bool
    @Binding var k32: Bool
    @Binding var k33: Bool
    @Binding var k34: Bool
    @Binding var k35: Bool
    @Binding var k36: Bool
    
    @Binding var ArrayIngridients: [String]
    
    // ИНГРИДИЕНТЫ ДЛЯ РЕЦОПТОВ НА ОБЕД
    var Pumpkin = ["k4", "k8", "k10", "k21", "k27", "k36"]
    var Vegetables = ["k1", "k11", "k29", "k36"]
    var Rice2 = ["k4", "k6", "k7", "k33", "k36"]
    var Chicken1 = ["k4", "k27", "k33"]
    var Chicken2 = ["k4", "k7", "k26", "k34", "k36"]
    var Egg = ["k1", "k3", "k27", "k34", "k36"]
    
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack() {
                Text("")
                Text("Вот, что мы подобрали для Вас")
                    .font(MontserratSemiBold_16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                Text("")
                HStack {
                    Text("Для того, чтобы изменить ингредиенты вернитесь на раздел назад")
                        .font(MontserratRegular_12)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                }
                .frame(height: 54)
                .frame(width: (UIScreen.main.bounds.width-55), alignment: .center)
                .background(Color(uiColor: BlueButton_Layer))
                .cornerRadius(12)
                .padding(.bottom, 15)
            
                ScrollView(showsIndicators: false) {
                    
                    
                   
                    
                    
                    
                    let l1 = CalcIngridients(ArrayIngridients: ArrayIngridients, Ingridients: Pumpkin)
                    if l1 == ArrayIngridients.count {
                        PumpkinSoup()
                    }

                    let l2 = CalcIngridients(ArrayIngridients: ArrayIngridients, Ingridients: Vegetables)
                    if l2 == ArrayIngridients.count {
                        VegetablesWithMazzarella()
                    }

                    let l3 = CalcIngridients(ArrayIngridients: ArrayIngridients, Ingridients:  Rice2)
                    if l3 == ArrayIngridients.count {
                        RiceWithMushroom()
                    }

                    let l4 = CalcIngridients(ArrayIngridients: ArrayIngridients, Ingridients: Chicken1)
                    if l4 == ArrayIngridients.count {
                        ChickenRoll()
                    }

                    let l5 = CalcIngridients(ArrayIngridients: ArrayIngridients, Ingridients: Chicken2)
                    if l5 == ArrayIngridients.count {
                        ChickenMuffin()
                    }

                    let l6 = CalcIngridients(ArrayIngridients: ArrayIngridients, Ingridients: Egg)
                    if l6 == ArrayIngridients.count {
                        EggPot()
                    }

                    if ((l1 != ArrayIngridients.count) && (l2 != ArrayIngridients.count) && (l3 != ArrayIngridients.count) && (l4 != ArrayIngridients.count) && (l5 != ArrayIngridients.count) && (l6 != ArrayIngridients.count)) {
                        NotIngridients()
                    }
                    Spacer()
                }
            }
            .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
        }
        .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
        .navigationBarHidden(false)
        .navigationTitle("Обед")
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
    func CalcIngridients(ArrayIngridients: [String], Ingridients: [String]) -> Int {
        var l = 0
        for i in ArrayIngridients {
            if Ingridients.contains(i) {
                l += 1
            }
        }
        return l
    }
}

