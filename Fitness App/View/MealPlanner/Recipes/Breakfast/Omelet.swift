import SwiftUI

struct Omelet: View {
    
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
            Image("Omelet")
                .resizable()
                .frame(width: 117, height: 117, alignment: .leading)
                .padding(.leading, 10)
                .padding(.trailing, 15)
            VStack(alignment: .leading) {
                Text("Омлет с овощами")
                    .font(MontserratSemiBold_12)
                    .padding(.bottom, 2)
                Text("108 ккал/100 г")
                    .font(MontserratRegular_8)
                    .padding(.bottom, 2)
                NavigationLink(destination: OmeletFunc()) {
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

struct OmeletFunc: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HeaderView()
                OmeletView()
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
            
            Image("Omelets")
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

struct OmeletView: View {
    
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
                Text("Омлет с овощами")
                    .font(MontserratSemiBold_16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Text("Элементарное в приготовлении и вкусное блюдо на скорую руку. Вся суть рецепта — соединить яйца с овощной стружкой и обжарить до готовности полученную массу.\n\nНачинку можно менять на личное усмотрение — смело пускаем в ход овощи, зелень, отварное или запечённое мясо. Если дополним яично-кабачковый блин куриным филе — получим отличный низкоуглеводный ужин богатый белком. А с сыром и помидором — прекрасный вариант для завтрака.")
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
                            Text("сыр")
                                .font(MontserratRegular_12)
                            Text("40 г")
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .font(MontserratRegular_10)
                        }
                        .foregroundColor(.black)
                        .frame(width: 54, height: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0.7)
                        )
                        VStack {
                            Text("соль")
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
                        VStack {
                            Text("помидор")
                                .font(MontserratRegular_12)
                            Text("50 г")
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .font(MontserratRegular_10)
                        }
                        .foregroundColor(.black)
                        .frame(width: 82, height: 45)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0.7)
                        )
                    }
                    
                    HStack {
                        VStack {
                            Text("кабачок")
                                .font(MontserratRegular_12)
                            Text("100 г")
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .font(MontserratRegular_10)
                        }
                        .foregroundColor(.black)
                        .frame(width: 76, height: 45)
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
                        Text("Молодой тонкокорый кабачок натираем крупной стружкой, не отжимаем. Добавляем яйца, солим, перчим и перемешиваем.")
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
                        Text("Для начинки натираем крупно сыр. Помидор нарезаем тонкими дольками или мелкими кубиками.")
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
                        Text("Прогреваем сковороду, слегка смазав топленым или другим пригодным для жарки маслом. Выливаем яично-кабачковую массу и распределяем по всей площади в единый блин. В данном примере используется сковорода диаметром 23 см, если мерить по дну.")
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
                        Text("Как только нижняя сторона омлета слегка зарумянится, накрываем сковороду крышкой и держим на медленном огне. Доводим до готовности — на поверхности омлета не должно остаться влажных участков. На половину подсушенного кабачкового блина выкладываем помидоры и стружку сыра.")
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
                        Text("Сворачиваем омлет, накрывая свободным краем начинку. Держим на медленном огне под крышкой буквально пару минут — до расплавления сыра.")
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

