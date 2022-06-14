import Foundation
import SwiftUI

struct DropDown2: View {
    
    @State var expand = false
    
    @Binding var activeEat: String
    
    @State var active0 = "Завтрак"
    @State var active1 = "Обед"
    @State var active2 = "Ужин"
    
    @Binding var c: Int
    
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratRegular_10 = Font.custom("Montserrat-Regular", size: 10)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    let Gray2 = UIColor(r: 173, g: 164, b: 165)
    
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 0) {
                HStack{
                    Text(activeEat)
                        .font(MontserratRegular_10)
                        .padding(.leading, 12)
                    Spacer()
                    Image(systemName: expand ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 10.5, height: 5.25)
                        .foregroundColor(Color(uiColor: .black))
                        
                        .padding(.trailing, 12)
                }
                .frame(width: 87,height: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 1))
                .background(Color.white)
                .onTapGesture {
                    withAnimation() {
                        self.expand.toggle()
                    }
                }
                .padding(.bottom, 5)
                if expand {
                    //Group {
                        if activeEat == "Завтрак" {
                            Button() {
                                withAnimation() {
                                    self.expand.toggle()
                                    c = 2
                                }
                                activeEat = "Обед"
                            } label: {
                                HStack {
                                    Text("Обед")
                                        .padding()
                                        .font(MontserratRegular_10)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                    
                            }
                            .frame(width: 87,height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .padding(.bottom, 5)
                            
                            Button() {
                                withAnimation() {
                                    self.expand.toggle()
                                    c = 3
                                }
                                activeEat = "Ужин"
                            } label: {
                                HStack {
                                    Text("Ужин")
                                        .padding()
                                        .font(MontserratRegular_10)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                    
                            }
                            .frame(width: 87,height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .padding(.bottom, 5)
                        }
                        
                        if activeEat == "Обед" {
                            Button() {
                                withAnimation() {
                                    self.expand.toggle()
                                    c = 1
                                }
                                activeEat = "Завтрак"
                            } label: {
                                HStack {
                                    Text("Завтрак")
                                        .padding()
                                        .font(MontserratRegular_10)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                    
                            }
                            .frame(width: 87,height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .padding(.bottom, 5)
                            
                            Button() {
                                withAnimation() {
                                    self.expand.toggle()
                                    c = 3
                                }
                                activeEat = "Ужин"
                            } label: {
                                HStack {
                                    Text("Ужин")
                                        .padding()
                                        .font(MontserratRegular_10)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                    
                            }
                            .frame(width: 87,height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .padding(.bottom, 5)
                        }
                       
                        if activeEat == "Ужин" {
                            Button() {
                                withAnimation() {
                                    self.expand.toggle()
                                    c = 1
                                }
                                activeEat = "Завтрак"
                            } label: {
                                HStack {
                                    Text("Завтрак")
                                        .padding()
                                        .font(MontserratRegular_10)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .frame(width: 87,height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .padding(.bottom, 5)
                            
                            Button() {
                                withAnimation() {
                                    self.expand.toggle()
                                    c = 2
                                }
                                activeEat = "Обед"
                            } label: {
                                HStack {
                                    Text("Обед")
                                        .padding()
                                        .font(MontserratRegular_10)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .frame(width: 87,height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .padding(.bottom, 5)
                        }
                    //}
                }
            }
        }
        .zIndex(9)
    }
}

