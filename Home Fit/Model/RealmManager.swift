import Foundation
import RealmSwift
import SwiftUI

class RealmManager: ObservableObject {
    
    private(set) var localRealm: Realm?
    @Published var TaskEatBreakfast2: [Eat2] = []
    @Published var TaskEatLanch2: [Eat2] = []
    @Published var TaskEatDinner2: [Eat2] = []
    
    @Published var data: [CGFloat] = []
    @Published var Date: [String] = []
    
    
    static var shared = RealmManager()
    
    init() {
        openRealm()
        getEat()
    }
    
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error openning Realm: \(error)")
        }
    }
    
    func addEat(EatTitle: String, EatImage: String, EatCallories: Int, EatDate: Date) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    
                    
                    let newEat = Eat2(value: ["EatTitle": EatTitle, "EatImage": EatImage, "EatCallories": EatCallories, "EatDate": EatDate])
                    localRealm.add(newEat)

                    print("Added new EatB in Realm: \(newEat)")
                    
                    getEat()
                    
                }
            } catch {
                print("Error openning Realm: \(error)")
            }
        }
    }
    
//    func addDD () {
//        if let localRealm = localRealm {
//            do {
//                try localRealm.write {
//                    localRealm.add(Date)
//                    localRealm.add(data)
//
////                    print("Added new EatB in Realm: \(ne)")
//                    
//                   // getEat()
//                    
//                }
//            } catch {
//                print("Error openning Realm: \(error)")
//            }
//        }
//    }
    
    func getEat() {
        if let localRealm = localRealm {
            
            let allEat = localRealm.objects(Eat2.self)
            TaskEatBreakfast2 = []
            TaskEatLanch2 = []
            TaskEatDinner2 = []
            allEat.forEach { eat in
                if (eat.EatTitle == "Полезные банановые панкейки" || eat.EatTitle == "Полезная ватрушка с творогом" || eat.EatTitle == "Омлет с овощами" || eat.EatTitle == "Молочная рисовая каша" || eat.EatTitle == "Овсяноблин с разными начинками" || eat.EatTitle == "Тост с яйцом-пашот и авакодо" || eat.EatImage == "Rectangle5919") {
                    TaskEatBreakfast2.append(eat)
                }
                if (eat.EatTitle == "Тыквенный суп-пюре" || eat.EatTitle == "Овощи с моцареллой" || eat.EatTitle == "Рис с грибами" || eat.EatTitle == "Куриные рулетики с зеленью" || eat.EatTitle == "Куриные маффины с шампиньонами" || eat.EatTitle == "Яйцо в горшочке" || eat.EatImage == "Rectangle5919-1") {
                    TaskEatLanch2.append(eat)
                }
                if (eat.EatTitle == "Куриное суфле" || eat.EatTitle == "Фаршированные шампиньоны" || eat.EatTitle == "Фаршированная курина грудка" || eat.EatTitle == "Салат из творога и яиц" || eat.EatTitle == "Ассорти из запеченных овощей" || eat.EatTitle == "Куриные котлеты" || eat.EatImage == "Rectangle5919-2") {
                    TaskEatDinner2.append(eat)
                }
            }
        }
    }
    
//    func updateEat(id: ObjectId, Date: Date) {
//        if let localRealm = localRealm {
//            do {
//                let EatToUpdate = localRealm.objects(Eat2.self).filter(NSPredicate(format: "id == %@", id))
//                guard !EatToUpdate.isEmpty else { return }
//
//                try localRealm.write {
//                    EatToUpdate[0].EatDate = Date
//                    getEat()
//                    print("Updated Eat with id: \(id)! Completed status: \(Date)")
//                }
//
//            } catch {
//                print("Error openning Realm: \(id) to Realm: \(error)")
//            }
//        }
//    }
    
    func deleteEat(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let EatToDelete = localRealm.objects(Eat2.self).filter(NSPredicate(format: "id == %@", id))
                guard !EatToDelete.isEmpty else { return }
                
                try localRealm.write {
                    localRealm.delete(EatToDelete)
                    getEat()
                    print("Deleted Eat with id: \(id)")
                }
            } catch {
                print("Error deleting Eat \(id) from Realm: \(error)")
            }
        }
    }
}

//class DD: Object, _Persistable{
//    @Persisted var Date: String
//    @Persisted var data: CGFloat
//}

class DD: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var data1: Int
    @Persisted var Date1: String
}
