//
//  ContentView.swift
//  Fitness App
//
//  Created by Alexander on 05.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var realManager = RealmManager()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    @AppStorage("showingOnboarding") var showingOnboarding: Bool = true
    //@State var showingOnboarding: Bool = true
    
    @State var currentTab: Tab = .MealPlanner
    
    @AppStorage("name") var name: String = ""
    @AppStorage("activeLevel") var activeLevel: String = ""
    @AppStorage("age") var age: String = ""
    @AppStorage("weight") var weight: String = ""
    @AppStorage("height") var height: String = ""
    @AppStorage("gender") var gender: String = ""
    @AppStorage("moodColor") var moodColor: String = "Фиолетовый"
    
    
    // Colors
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    let RedMenu = UIColor(r: 242, g: 143, b: 143)
    
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $currentTab) {
                MealPlannerView(name: $name, activeLevel: $activeLevel, age: $age, weight: $weight, height: $height, gender: $gender, moodColor: $moodColor)
                    .environmentObject(realManager)
                    .tabItem {
                        Image(systemName: "heart.circle")
                        Text("Планировщик еды")
                    }
                    
                    .tag(Tab.MealPlanner)

                ProfileView(name: $name, activeLevel: $activeLevel, age: $age, weight: $weight, height: $height, gender: $gender, moodColor: $moodColor)
                    .environmentObject(realManager)
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Профиль")
                    }
                    .tag(Tab.Profile)
            }
            .accentColor(Color(uiColor: RedMenu))
        }
        .fullScreenCover(isPresented: $showingOnboarding) {
            OnboardingView(name: $name, activeLevel: $activeLevel, age: $age, weight: $weight, height: $height, gender: $gender, moodColor: $moodColor, showingOnboarding: $showingOnboarding)
        }
    }
}
        

        
//        GeometryReader { proxy in // Меню снизу
//            HStack(spacing: 0) {
//                ForEach(Tab.allCases, id: \.rawValue) { tab in
//                    Button {
//                        withAnimation(.easeInOut(duration: 0.2)) {
//                            currentTab = tab
//                        }
//                    } label: {
//                        Image(tab.rawValue)
//                            .renderingMode(.template)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 22)
//                            .frame(maxWidth: .infinity)
//                            .foregroundColor(currentTab == tab ? Color(uiColor: RedMenu) : Color(uiColor: GrayMenu))
//                    }
//
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//        .frame(height: 25)
        
   

extension View {
    func applyBG()->some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color(.white)
                    .ignoresSafeArea()
            }
    }
}

extension UIColor {
    convenience init(r: CGFloat,g:CGFloat,b:CGFloat,a:CGFloat = 1) {
        self.init(
            red: r / 255.0,
            green: g / 255.0,
            blue: b / 255.0,
            alpha: a
        )
    }
}

