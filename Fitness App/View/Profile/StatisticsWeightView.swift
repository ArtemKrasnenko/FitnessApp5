import SwiftUI
import RealmSwift

struct StatisticsWeightView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    
    let BlueButton_Layer = UIColor(r: 154, g: 192, b: 255, a: 0.2)
    let MontserratBold = Font.custom("Montserrat-Bold", size: 16)
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    let MontserratSemiBold_14 = Font.custom("Montserrat-SemiBold", size: 14)
    let MontserratSemiBold_16 = Font.custom("Montserrat-SemiBold", size: 16)
    let MontserratRegular_11 = Font.custom("Montserrat-Regular", size: 11)
    let MontserratRegular_10 = Font.custom("Montserrat-Regular", size: 10)
    let MontserratRegular_14 = Font.custom("Montserrat-Regular", size: 14)
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratMedium_16 = Font.custom("Montserrat-Medium", size: 16)
    let MontserratMedium_12 = Font.custom("Montserrat-Medium", size: 12)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    let RedMenu = UIColor(r: 242, g: 143, b: 143)
    let BlueButton = UIColor(r: 154, g: 192, b: 255)
    let BlueText = UIColor(r: 109, g: 158, b: 238)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    let Purple = UIColor(r: 179, g: 127, b: 244)
    
    @State var WeightStatistics: String = ""
    
    @State var data: [CGFloat] = []
    @State var Date: [String] = []
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>  // ДЛЯ КНОПКИ НАЗАД
    
    var body: some View {
        ZStack {
            VStack {
                LineGraph(data: $data, Date: $Date)
                    .frame(height: 220)
                    .padding(.top, 25)
            
                HStack {
                    Text("Добавить")
                        .font(MontserratBold)
                        .padding(.top, 15)
                    Spacer()
                }
                .padding(.bottom, 10)
                HStack {
                    TextField("Кг", text: $WeightStatistics)
                        .font(MontserratRegular_12)
                        .padding()
                        .keyboardType(.numberPad)
                    Button {
                        if let n = NumberFormatter().number(from: WeightStatistics) {
                            let f = CGFloat(truncating: n)
                            data.append(f)
                        }
                        let d = Foundation.Date().formatted(date: .abbreviated, time: .omitted)
                        Date.append(d)
                        WeightStatistics = ""
                    } label: {
                        Text("Ввести")
                            .font(MontserratRegular_12)
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                .frame(height: 48)
                .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                .background(Color(uiColor: BorderColor))
                .cornerRadius(14)
                .padding(.bottom, 15)
                
                Button {
                    
                } label: {
                    Text("Обновить данные")
                        .foregroundColor(Color(uiColor: .black))
                        .font(MontserratRegular_14)
                        .frame(width: UIScreen.main.bounds.width-60, height: 48)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
        
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width-60)
        .navigationBarHidden(false)
        .navigationTitle("Статистика веса")
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
