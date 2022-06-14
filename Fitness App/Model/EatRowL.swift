import SwiftUI
import RealmSwift

struct EatRowL: View {
    
    @EnvironmentObject var realManager: RealmManager
    
    @ObservedObject var CalendarModel: CalendarR
    
    var ID: ObjectId
    var title: String
    var image: String
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    var body: some View {
        if let eats = CalendarModel.filteredEatL {
            if eats.isEmpty {
            }
            else {
                HStack {
                    Image(image)
                        .resizable()
                        .frame(width: 59, height: 59, alignment: .leading)
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(MontserratSemiBold_12)
                    }
                    Spacer()
                    Button {
                        realManager.deleteEat(id: ID)
                    } label: {
                        Image("Icon-Arrow")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    if title == "Тыквенный суп-пюре" {
                        NavigationLink(destination: PumpkinSoupFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Овощи с моцареллой" {
                        NavigationLink(destination: VegetablesWithMazzarellaFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Рис с грибами" {
                        NavigationLink(destination: RiceWithMushroomFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Куриные рулетики с зеленью" {
                        NavigationLink(destination: ChickenRollFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Куриные маффины с шампиньонами" {
                        NavigationLink(destination: ChickenMuffinFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Яйцо в горшочке" {
                        NavigationLink(destination: EggPotFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width-60)
            }
        }
    }
}

