//
//  ContentView.swift
//  ios_hw4
//
//  Created by User10 on 2020/11/1.
//

import SwiftUI
import MediaPlayer
struct ContentView: View {
    @State private var name = ""
    @State private var eatdinner = false
    @State private var showSecondPage = false
    @State private var showAlert = false
    @State private var typePick = 0
    @State private var people = 1.0
    @State private var selectDate = Date()
    @State private var showSheet = false
    @State private var isPlay = false
    let player = AVPlayer(url: URL(string:"https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview128/v4/de/40/a4/de40a4ef-7ca1-5caf-3b89-9ffb301f1055/mzaf_4213742263692215867.plus.aac.ep.m4a")!)
    let today = Date()
    let location = ["愛河", "龍虎塔", "六合夜市", "蓮池潭", "彩虹教堂", "駁二藝術特區","草衙道","MLD台鋁","衛武營國家藝術文化中心","崗山之眼"]
    var year: Int {
        Calendar.current.component(.year, from: selectDate)
    }
    var img: String = "title"
    
    var body: some View {
        Image("高雄")
         .resizable()
         .scaledToFit()
        DisclosureGroup("高雄景點") {
                    VStack(alignment: .leading) {
                        ForEach(location.indices) { (index) in
                            Text("\(index+1):\(location[index])")
                        }
                    }
                }
                .padding()
        Form{
            Name(name: self.$name)
            DatePicker("想要什麼時候去吃", selection: self.$selectDate, in: self.today..., displayedComponents: .date)
            PeopleStepper(people: self.$people)
            PeopleSlider(people: self.$people)
            Toggle("都決定好了幫我挑個晚餐！！", isOn : $eatdinner)
            
            if(eatdinner) {
                TypePicker(type: self.$typePick)
            }
            
        }
        VStack {
                    Image("幾分之幾")
                        .resizable()
                        .scaledToFit()
                    Toggle("播放歌曲", isOn: $isPlay)
                        .onChange(of: isPlay, perform: { value in
                            if value {
                                player.play()
                            } else {
                                player.pause()
                            }
                        })
                }
                .padding()
            Button(action: {
                if(self.eatdinner) {
                    self.showSecondPage = true
                }
                else {
                    self.showAlert = true
                }
            }) {
                Text("吃晚餐囉")
                    .font(.headline)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(30)
                    .foregroundColor(.black)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.yellow, lineWidth: 5))
            }.alert(isPresented: $showAlert) { () -> Alert in
                return Alert(title: Text("不點晚餐是不是"),message: Text("好啊不點幫你選擇晚餐就自己去吃啊！"))
            }
            .sheet(isPresented: self.$showSecondPage) {
                DinnerView(name: self.$name, type: self.$typePick, people: self.people)
            }
    }
}
struct Name: View {
    @Binding var name: String
    
    var body: some View {
        TextField("請問你的小名是?", text: self.$name)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.yellow, lineWidth: 3))
    }
}
struct TypePicker: View {
    @Binding var type: Int
    
    let types=["米飯類", "麵類", "燒烤", "點心"]
    
    var body: some View {
        Picker("晚餐類別",selection: self.$type){
            ForEach(0 ..< types.count) { (index) in
                Text(self.types[index])
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}
struct PeopleStepper: View {
    @Binding var people: Double
    
    var body: some View {
        Stepper("總共有幾個人要去吃飯呢？" + String(format: "%.1f", people), value: $people, in: 1 ... 10)
    }
}
struct PeopleSlider: View {
    @Binding var people: Double
    
    var body: some View {
        Slider(value: $people, in: 1...10,step: 1.0, minimumValueLabel: Text("1人"), maximumValueLabel:Text("10人")){
            Text("總共有幾個人要去吃飯呢？")
            
        }.accentColor(.green)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
