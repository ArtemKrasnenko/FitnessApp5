import SwiftUI
import RealmSwift

struct EatRowD: View {
    
    @EnvironmentObject var realManager: RealmManager
    
    @ObservedObject var CalendarModel: CalendarR
    
    var ID: ObjectId
    var title: String
    var image: String
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    var body: some View {
        if let eats = CalendarModel.filteredEatD {
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
                    if title == "Куриное суфле" {
                        NavigationLink(destination: ChickenSouffleFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Фаршированные шампиньоны" {
                        NavigationLink(destination: StuffedСhampignonFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Фаршированная курина грудка" {
                        NavigationLink(destination: StuffedChickenFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Салат из творога и яиц" {
                        NavigationLink(destination: CottageCheeseFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Ассорти из запеченных овощей" {
                        NavigationLink(destination: AssortedVegetableFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Куриные котлеты" {
                        NavigationLink(destination: ChickenCutletFunc()) {
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

