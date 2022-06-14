import SwiftUI
import RealmSwift

class CalendarR: ObservableObject {
    
    var realManager = RealmManager.shared
    
    init() {
        ferchCurrentWeek()
//        realManager.getEat()
        filterTodayEat()
    }
    
    @Published var currentWeek: [Date] = [] // Дни недели
    @Published var currentDay: Date = Date()
    @Published var filteredEatB: [Eat2]?
    @Published var filteredEatL: [Eat2]?
    @Published var filteredEatD: [Eat2]?

    
    
    
    // Текущая неделя
    func ferchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekday, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (0...6).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    // Формат даты
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    // Сегодня
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
    // Фильтр по дням
    func filterTodayEat() {
//        DispatchQueue.global(qos: .userInitiated).async {
        realManager.getEat()

        let calendar = Calendar.current
    
        let filteredB = self.realManager.TaskEatBreakfast2.filter {
            return calendar.isDate($0.EatDate, inSameDayAs: self.currentDay)
        }

        let filteredL = self.realManager.TaskEatLanch2.filter {
            return calendar.isDate($0.EatDate, inSameDayAs: self.currentDay)
        }
            
        let filteredD = self.realManager.TaskEatDinner2.filter {
            return calendar.isDate($0.EatDate, inSameDayAs: self.currentDay)
        }

        //            DispatchQueue.main.async {

                withAnimation() {
                    self.filteredEatB = filteredB
                    self.filteredEatL = filteredL
                    self.filteredEatD = filteredD

//                }
//            }
        }
    }
}

class Eat2: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var EatTitle: String
    @Persisted var EatImage: String
    @Persisted var EatCallories: Int
    @Persisted var EatDate: Date
}
