//
//  LunchView.swift
//  Fitness App
//
//  Created by Alexander on 15.05.2022.
//

import SwiftUI

struct LunchView: View {
    
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
    
    @Binding var k: Int8
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode> // ДЛЯ КНОПКИ НАЗАД
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading) {
                ScrollView(showsIndicators: false) {
                    BLDView(k: $k)
                }
            }
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
}
