//
//  NotIngridients.swift
//  Fitness App
//
//  Created by Alexander on 16.05.2022.
//

import SwiftUI

struct NotIngridients: View {
    
    let MontserratRegular_10 = Font.custom("Montserrat-Regular", size: 10)
    
    var body: some View {
        VStack() {
            Text("Мы пока что не придумали,\nчто можно сделать из этих ингредиентов :)")
                .font(MontserratRegular_10)
                .padding(.bottom, 25)
                .padding(.top, 60)
                .multilineTextAlignment(.center)
            Image("NotIngridients")
                .resizable()
                .frame(height: 250)
                .frame(width: (UIScreen.main.bounds.width), alignment: .center)
                
        }
    }
}

