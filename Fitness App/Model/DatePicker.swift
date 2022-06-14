import SwiftUI
//
//struct DatePicker: View {
//
//    @State var currentTime = Date()
//    var closedRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
//
//    func formatDate() -> String {
//        let components = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: currentTime)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//        let day = components.day ?? 0
//        let month = components.month ?? 0
//        let year = components.year ?? 0
//
//        return "\(day)-\(month)-\(year) (\(hour):\(minute))"
//    }
//
//    var body: some View {
//        VStack {
//            Form {
//                DatePicker("Pick a time:", selection: $currentTime, displayedComponents: .hourAndMinute)
//            }
//        }
//    }
//}

struct ZCalendar: View {
    @State var date = Date()
    @State var isPickerVisible = false
    
    let MontserratRegular_11 = Font.custom("Montserrat-Regular", size: 14)
    
    @State var currentTime = Date()
    var closedRange = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    
    func formatDate() -> String {
        let components = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: currentTime)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let day = components.day ?? 0
        let month = components.month ?? 0
        let year = components.year ?? 0
        
        return "\(day)-\(month)-\(year) (\(hour):\(minute))"
    }
    
    var body: some View {
        ZStack {
            Button(action: {
                isPickerVisible = true
            }, label: {
                Image("Reminders")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .padding(.trailing, 20)
            })
            .padding(.trailing, -40)
            .zIndex(4)
            if isPickerVisible{
                VStack{
                    DatePicker("", selection: $currentTime, displayedComponents: .hourAndMinute)
                        .transformEffect(.init(scaleX: 0.8, y: 0.8))
                        .padding(.bottom, -10)
                    Button {
                        isPickerVisible = false
                    } label: {
                        Text("Готово")
                            .font(MontserratRegular_11)
                    }
                    .padding(.leading, -10)
                }
                .frame(width: 60, height: 50)
                .background(Color.white)
                .zIndex(5)
            }
            
        }
        //.sheet(isPresented: $isPickerVisible, content: {DatePicker("", selection: $date).datePickerStyle(GraphicalDatePickerStyle())})
    }
}
