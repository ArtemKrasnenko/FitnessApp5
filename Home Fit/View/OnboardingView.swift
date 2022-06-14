import SwiftUI

struct OnboardingView: View {
    
    @Binding var name: String
    @Binding var activeLevel: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var height: String
    @Binding var gender: String
    @Binding var moodColor: String
    
    @Binding var showingOnboarding: Bool
    
    @State var showingPage2: Bool = false
    
    var body: some View {
        Page1(name: $name, activeLevel: $activeLevel, age: $age, weight: $weight, height: $height, gender: $gender, moodColor: $moodColor, showingOnboarding: $showingOnboarding, showingPage2: $showingPage2)
    }
}

struct Page1: View {
    
    @Binding var name: String
    @Binding var activeLevel: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var height: String
    @Binding var gender: String
    @Binding var moodColor: String
    
    @Binding var showingOnboarding: Bool
    
    let MontserratBold_36 = Font.custom("Montserrat-Bold", size: 36)
    let MontserratBold_16 = Font.custom("Montserrat-Bold", size: 16)
    let MontserratRegular_18 = Font.custom("Montserrat-Regular", size: 18)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    
    let Pink = UIColor(r: 242, g: 143, b: 143)
    
    @Binding var showingPage2: Bool
    
    @State var appeared: Double = 0
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack {
                    Text("Home")
                        .font(MontserratBold_36)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color(uiColor: Pink))
                    Text("Fit")
                        .font(MontserratBold_36)
                }
                .padding(.top, -40)
                
                Text("С любовью к себе")
                    .font(MontserratRegular_18)
                    .foregroundColor(Color(uiColor: GrayMenu))
                    .padding(.top, -20)
                    .padding(.bottom, 40)
                
                Image("woman")
                    .resizable()
                    .frame(height: 439)
                    .frame(width: UIScreen.main.bounds.width+10)
                Spacer()
                
                NavigationLink(destination: Page2(name: $name, activeLevel: $activeLevel, age: $age, weight: $weight, height: $height, gender: $gender, moodColor: $moodColor, showingOnboarding: $showingOnboarding)) {
                    Text("Начать")
                        .foregroundColor(.black)
                        .font(MontserratBold_16)
                        .frame(height: 60)
                        .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 99)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                
            }
        }
        .navigationBarHidden(true)
    }
}

struct Page2: View {
    
    @Binding var name: String
    @Binding var activeLevel: String
    @Binding var age: String
    @Binding var weight: String
    @Binding var height: String
    @Binding var gender: String
    @Binding var moodColor: String
    
    @Binding var showingOnboarding: Bool
    
    let MontserratBold_20 = Font.custom("Montserrat-Bold", size: 20)
    let MontserratBold_16 = Font.custom("Montserrat-Bold", size: 16)
    let MontserratSemiBold_12 = Font.custom("Montserrat-SemiBold", size: 18)
    let MontserratRegular_12 = Font.custom("Montserrat-Regular", size: 12)
    let MontserratRegular_18 = Font.custom("Montserrat-Regular", size: 18)
    let GrayMenu = UIColor(r: 123, g: 111, b: 114)
    //let Gray2 = UIColor(r: 173, g: 164, b: 165)

    let Pink = UIColor(r: 242, g: 143, b: 143)
    let BorderColor = UIColor(r: 247, g: 248, b: 248)
    
    var body: some View {
        VStack {
            Image("coffee")
                .resizable()
                .frame(height: 340)
                .frame(width: UIScreen.main.bounds.width+10)
            Text("Расскажи немного о себе")
                .font(MontserratBold_20)
                .padding(.top, -60)
            
            VStack {
                Group {
                    HStack {
                        Image("Group 10287")
                            .resizable()
                            .frame(width: 13, height: 14)
                            .padding()
                        TextField("Как тебя зовут?", text: $name)
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.leading, -10)
                    }
                    .frame(height: 48)
                    .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                    .background(Color(uiColor: BorderColor))
                    .cornerRadius(14)
                    
                    DropDown11(gender: $gender)
                    
                    DropDown10(activeLevel: $activeLevel)
                    
                    HStack {
                        Image("Calendar")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .padding()
                            .padding(.leading, -4)
                        TextField("Сколько тебе лет?", text: $age)
                            .font(MontserratRegular_12)
                            .foregroundColor(Color(uiColor: GrayMenu))
                            .padding(.leading, -15)
                    }
                    .frame(height: 48)
                    .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                    .background(Color(uiColor: BorderColor))
                    .cornerRadius(14)
                    
                    HStack {
                        HStack {
                            Image("weight-scale 1")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding()
                            TextField("Твой вес", text: $weight)
                                .font(MontserratRegular_12)
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .padding(.leading, -10)
                        }
                        .frame(height: 48)
                        .background(Color(uiColor: BorderColor))
                        .cornerRadius(14)
                        
                        Text("кг")
                            .font(MontserratSemiBold_12)
                            .foregroundColor(.white)
                            .frame(width: 48, height: 48)
                            .background(Color(uiColor: Pink))
                            .cornerRadius(14)
                    }
                    .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                    
                    HStack {
                        HStack {
                            Image("Swap")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding()
                            TextField("Твой рост", text: $height)
                                .font(MontserratRegular_12)
                                .foregroundColor(Color(uiColor: GrayMenu))
                                .padding(.leading, -10)
                        }
                        .frame(height: 48)
                        .background(Color(uiColor: BorderColor))
                        .cornerRadius(14)
                        
                        Text("см")
                            .font(MontserratSemiBold_12)
                            .foregroundColor(.white)
                            .frame(width: 48, height: 48)
                            .background(Color(uiColor: Pink))
                            .cornerRadius(14)
                    }
                    .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                }
            }
            .padding(.top, -30)
            
            Spacer()
            
            Button {
                showingOnboarding.toggle()
            } label: {
                Text("Далее")
                    .foregroundColor(.black)
                    .font(MontserratBold_16)
                    .frame(height: 60)
                    .frame(width: UIScreen.main.bounds.width-60, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
        .padding(.top, -30)
        .navigationBarHidden(true)
    }
}
