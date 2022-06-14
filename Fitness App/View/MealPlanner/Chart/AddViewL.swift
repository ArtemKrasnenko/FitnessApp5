import SwiftUI

struct AddViewL: View {
    
    @ObservedObject var CalendarModel: CalendarR
    @EnvironmentObject var realManager: RealmManager
    
    @Binding var showingL: Bool
    @Binding var nameProduct: String
    @Binding var calloriesProduct: String
    
    var isFocused : FocusState<Bool>.Binding
    
    let MontserratBold = Font.custom("Montserrat-Bold", size: 16)
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    let MontserratSemiBold_14 = Font.custom("Montserrat-SemiBold", size: 14)
    let MontserratSemiBold_16 = Font.custom("Montserrat-SemiBold", size: 16)
    let MontserratRegular_11 = Font.custom("Montserrat-Regular", size: 11)
    let MontserratRegular_10 = Font.custom("Montserrat-Regular", size: 10)
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratRegular_14 = Font.custom("Montserrat-Regular", size: 14)
    let MontserratMedium_16 = Font.custom("Montserrat-Medium", size: 16)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    let RedMenu = UIColor(r: 242, g: 143, b: 143)
    let BlueButton = UIColor(r: 154, g: 192, b: 255)
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    
    var body: some View {
        let TaskEatLanchFull = [
            ["Тыквенный суп-пюре", "PumpkinSoup", 67, CalendarModel.currentDay],
            ["Овощи с моцареллой", "VegetablesWithMazzarella", 108, CalendarModel.currentDay],
            ["Рис с грибами", "RiceWithMushroom", 56, CalendarModel.currentDay],
            ["Куриные рулетики с зеленью", "ChickenRoll", 99, CalendarModel.currentDay],
            ["Куриные маффины с шампиньонами", "ChickenMuffin", 95, CalendarModel.currentDay],
            ["Яйцо в горшочке", "EggPot", 82, CalendarModel.currentDay]
        ]
        VStack() {
            HStack {
                Text("Добавить к обеду")
                    .padding(.top, 30)
                    .font(MontserratBold)
                Spacer()
            }
            .padding(.bottom, 15)
               
            TextField("Наименование", text: $nameProduct)
                .font(MontserratRegular_12)
                .padding()
                .frame(height: 48)
                .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                .background(Color(uiColor: BorderColor))
                .cornerRadius(14)
                .focused(isFocused)
            
            TextField("Колличество каллорий", text: $calloriesProduct)
                .keyboardType(.numberPad)
                .font(MontserratRegular_12)
                .padding()
                .frame(height: 48)
                .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                .background(Color(uiColor: BorderColor))
                .cornerRadius(14)
                .padding(.bottom, 15)
           
                Button {
                    self.showingL.toggle()
                    if nameProduct != "" && calloriesProduct != "" {
                        realManager.addEat(EatTitle: nameProduct, EatImage: "Rectangle5919-1", EatCallories: Int(calloriesProduct) ?? 0, EatDate: CalendarModel.currentDay)
                    }
                    CalendarModel.currentDay = Date()
                } label: {
                    Text("Добавить")
                        .font(MontserratRegular_14)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width-60, height: 48)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            
            .padding(.bottom, 15)
            
            Text("или")
                .font(MontserratRegular_12)
                .foregroundColor(Color(uiColor: GrayMenu))
                .padding(.bottom, 15)
            
            Button {
                self.showingL.toggle()
                let a = TaskEatLanchFull.randomElement()!
                realManager.addEat(EatTitle: a[0] as! String, EatImage: a[1] as! String, EatCallories: a[2] as! Int, EatDate: a[3] as! Date)
                CalendarModel.currentDay = Date()
            } label: {
                Text("Сгенерировать полезный рецепт")
                    .font(MontserratRegular_14)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width-60)
                    .frame(width: UIScreen.main.bounds.width-60, height: 48)
                    .background(Color(uiColor: BlueButton))
                    .cornerRadius(14)
            }
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width-60)
    }
}



