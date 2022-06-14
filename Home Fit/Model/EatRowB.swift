import SwiftUI
import RealmSwift

struct EatRowB: View {
    
    @EnvironmentObject var realManager: RealmManager
    
    @ObservedObject var CalendarModel: CalendarR
    
    var ID: ObjectId
    var title: String
    var image: String
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 12.8)
    var body: some View {
        if let eats = CalendarModel.filteredEatB {
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
                    if title == "Полезные банановые панкейки" {
                        NavigationLink(destination: BananaPancakesFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Полезная ватрушка с творогом" {
                        NavigationLink(destination: CheeseCakeFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Омлет с овощами" {
                        NavigationLink(destination: OmeletFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Молочная рисовая каша" {
                        NavigationLink(destination: RicePorridgeFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Овсяноблин с разными начинками" {
                        NavigationLink(destination: OatmealFunc()) {
                            Image("Icon-Arrow-2")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    if title == "Тост с яйцом-пашот и авакодо" {
                        NavigationLink(destination: ToastWithEggFunc()) {
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

