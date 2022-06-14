import SwiftUI

struct CheeseCake: View {
    
    let MontserratBold = Font.custom("Montserrat-Bold", size: 16)
    let MontserratSemiBold_10 = Font.custom("Montserrat-SemiBold", size: 10.4)
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    let MontserratSemiBold_14 = Font.custom("Montserrat-SemiBold", size: 14)
    let MontserratSemiBold_16 = Font.custom("Montserrat-SemiBold", size: 16)
    let MontserratRegular_8 = Font.custom("Montserrat-Regular", size: 8)
    let MontserratRegular_11 = Font.custom("Montserrat-Regular", size: 11)
    let MontserratRegular_10 = Font.custom("Montserrat-Regular", size: 10)
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratMedium_16 = Font.custom("Montserrat-Medium", size: 16)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    let RedMenu = UIColor(r: 242, g: 143, b: 143)
    let RedBack = UIColor(r: 252, g: 233, b: 233)
    let BlueButton = UIColor(r: 154, g: 192, b: 255)
    let BlueButton_Layer = UIColor(r: 154, g: 192, b: 255, a: 0.2)
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    
    var body: some View {
        HStack() {
            Image("CheeseCake")
                .resizable()
                .frame(width: 117, height: 117, alignment: .leading)
                .padding(.leading, 10)
                .padding(.trailing, 15)
            VStack(alignment: .leading) {
                Text("Полезная ватрушка с творогом")
                    .font(MontserratSemiBold_12)
                    .padding(.bottom, 2)
                Text("154 ккал/100 г")
                    .font(MontserratRegular_8)
                    .padding(.bottom, 2)
                NavigationLink(destination: CheeseCakeFunc()) {
                    Text("Смотреть")
                        .frame(width: 102, height: 26)
                        .font(MontserratSemiBold_10)
                        .foregroundColor(.white)
                        .background(Color(uiColor: RedMenu))
                        .cornerRadius(44)
                }
            }
            Spacer()
        }
        .frame(height: 139)
        .frame(width: (UIScreen.main.bounds.width-55), alignment: .center)
        .background(Color(uiColor: RedBack))
        .cornerRadius(24)
    }
}

struct CheeseCakeFunc: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HeaderView()
                CheeseCakeView()
            }
            
        }
        .coordinateSpace(name: "SCROLL")
        .ignoresSafeArea(.container, edges: .vertical)
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let size = proxy.size
            let height = (size.height + minY)
            
            Image("CheeseCakes")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: height, alignment: .top)
                .overlay(content:  {
                    ZStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 12) {
                            Button() {
                                self.mode.wrappedValue.dismiss()
                            } label: {
                                Image("Back-Navs")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 110)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                })
                .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
                .offset(y: -minY)
        }
        .frame(height: 250)
    }
}

struct CheeseCakeView: View {
    
    let MontserratBold = Font.custom("Montserrat-Bold", size: 16)
    let MontserratSemiBold_10 = Font.custom("Montserrat-SemiBold", size: 10.4)
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    let MontserratSemiBold_14 = Font.custom("Montserrat-SemiBold", size: 14)
    let MontserratSemiBold_16 = Font.custom("Montserrat-SemiBold", size: 16)
    let MontserratRegular_8 = Font.custom("Montserrat-Regular", size: 8)
    let MontserratRegular_11 = Font.custom("Montserrat-Regular", size: 11)
    let MontserratRegular_10 = Font.custom("Montserrat-Regular", size: 10)
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratMedium_16 = Font.custom("Montserrat-Medium", size: 16)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    let RedMenu = UIColor(r: 242, g: 143, b: 143)
    let RedBack = UIColor(r: 252, g: 233, b: 233)
    let BlueButton = UIColor(r: 154, g: 192, b: 255)
    let BlueButton_Layer = UIColor(r: 154, g: 192, b: 255, a: 0.2)
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                // ЗАГОЛОВОК
                Text("Полезная ватрушка с творогом")
                    .font(MontserratSemiBold_16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Text("Ватрушки с творогом — вкуснейшая ароматная выпечка с нежной творожной начинкой. Традиционное угощение русской и украинской кулинарных школ, ставшее известной на весь мир. Представляет из себя небольшую круглую лепёшку из сдобного дрожжевого теста с начинкой из творога внутри.")
                    .font(MontserratRegular_12)
                    .foregroundColor(Color(uiColor: GrayMenu))
                
                // ИНГРИДИЕНТЫ
                VStack(alignment: .leading) {
                    Text("Ингредиенты")
                        .font(MontserratSemiBold_16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    HStack {
                        VStack {
                            Text("творог")
                                .font(MontserratRegular_12)
                            Text("300 г")
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .font(MontserratRegular_10)
                        }
                        .foregroundColor(.black)
                        .frame(width: 70, height: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0.7)
                        )
                        VStack {
                            Text("мука")
                                .font(MontserratRegular_12)
                            Text("150 г")
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .font(MontserratRegular_10)
                        }
                        .foregroundColor(.black)
                        .frame(width: 58, height: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0.7)
                        )
                        VStack {
                            Text("яйцо")
                                .font(MontserratRegular_12)
                            Text("2 шт")
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .font(MontserratRegular_10)
                        }
                        .foregroundColor(.black)
                        .frame(width: 57, height: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0.7)
                        )
                        VStack {
                            Text("сахар")
                                .font(MontserratRegular_12)
                            Text("по вкусу")
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .font(MontserratRegular_10)
                        }
                        .foregroundColor(.black)
                        .frame(width: 70, height: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0.7)
                        )
                    }
                    
                    HStack {
                        VStack {
                            Text("йогурт")
                                .font(MontserratRegular_12)
                            Text("2 ст.л.")
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .font(MontserratRegular_10)
                        }
                        .foregroundColor(.black)
                        .frame(width: 69, height: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0.7)
                        )
                        VStack {
                            Text("масло растительное")
                                .font(MontserratRegular_12)
                            Text("1,5 ч.л.")
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .font(MontserratRegular_10)
                        }
                        .foregroundColor(.black)
                        .frame(width: 148, height: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0.7)
                        )
                    }
                }
                
                // ПРИГОТОВЛЕНИЕ
                VStack(alignment: .leading) {
                    Text("Приготовление")
                        .font(MontserratSemiBold_16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    HStack {
                        VStack {
                            Text("01.")
                                .foregroundColor(Color(uiColor: BlueButton))
                                .font(MontserratSemiBold_14)
                            Spacer()
                        }
                        Text("Подготовьте ингредиенты. Прогрейте духовку, установите температуру 180 градусов.")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.bottom, 10)
                    }
                    HStack {
                        VStack {
                            Text("02.")
                                .foregroundColor(Color(uiColor: BlueButton))
                                .font(MontserratSemiBold_14)
                            Spacer()
                        }
                        Text("В миску выложите 200 грамм творога, добавьте яйцо и заменитель сахара. ")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.bottom, 10)
                    }
                    HStack {
                        VStack {
                            Text("03.")
                                .foregroundColor(Color(uiColor: BlueButton))
                                .font(MontserratSemiBold_14)
                            Spacer()
                        }
                        Text("В большой миске разминаем банан вилкой. Делать это блендером не советуем, банан буквально превращается в жидкость, а нам нужна густая масса.")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.bottom, 10)
                    }
                    HStack {
                        VStack {
                            Text("04.")
                                .foregroundColor(Color(uiColor: BlueButton))
                                .font(MontserratSemiBold_14)
                            Spacer()
                        }
                        Text("Добавьте муку, перемешайте все хорошо.")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.bottom, 10)
                    }
                    HStack {
                        VStack {
                            Text("05.")
                                .foregroundColor(Color(uiColor: BlueButton))
                                .font(MontserratSemiBold_14)
                            Spacer()
                        }
                        Text("Сформируйте лепешки, выложите на противень. Сделайте в каждой лепешке углубление.")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.bottom, 10)
                    }
                    HStack {
                        VStack {
                            Text("06.")
                                .foregroundColor(Color(uiColor: BlueButton))
                                .font(MontserratSemiBold_14)
                            Spacer()
                        }
                        Text("Оставшийся творог смешайте с йогуртом и заменителем сахара.")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.bottom, 10)
                    }
                    HStack {
                        VStack {
                            Text("07.")
                                .foregroundColor(Color(uiColor: BlueButton))
                                .font(MontserratSemiBold_14)
                            Spacer()
                        }
                        Text("Выложите начинку в ватрушки, смажьте слегка желтком. Выпекайте ватрушки 20-25 минут.")
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.bottom, 20)
                    }
                    
                    Button() {
                        
                    } label: {
                        Text("Добавить в график")
                            .font(MontserratBold)
                            .foregroundColor(Color(uiColor: .white))
                            .frame(height: 60)
                            .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
                            .background(Color(uiColor: BlueButton))
                            .cornerRadius(99)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
        .frame(width: (UIScreen.main.bounds.width-60), alignment: .center)
    }
}
