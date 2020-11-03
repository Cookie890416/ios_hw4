//
//  DinnerView.swift
//  ios_hw4
//
//  Created by User10 on 2020/11/1.
//

import SwiftUI

struct DinnerView: View {
    @Binding var name: String
    @Binding var type: Int
    @State var people :Double
    var body: some View {
        
        ScrollView{
            VStack{
                Spacer()
                Spacer()
                Text("你好，\(name)😊\n推薦您這頓晚餐")
                
                    .font(.system(size: 23))
                detailView(type: self.type)
            }
        }
    }
}
struct detailView: View {
    var type: Int
    
    var body: some View {
        
        let pick = self.choose( type: type)
        
        return VStack{
            if type == 0 {
                
                information(pick: pick, type: 0)
                
            }
            else if type == 1 {
                
                information(pick: pick, type: 1)
                
            }
            else if type == 2 {
                
                information(pick: pick, type: 2)
                
            }
            else if type == 3 {
                
                information(pick: pick, type: 3)
                
            }
            else if type == 4 {
                
                information(pick: pick, type: 4)
                
            }
            
            
        }
        .background(Color(red:91/255, green:179/255, blue:199/255))
    }
    
    func choose(type: Int) -> Int{
        var randNum: Range<Int> = 0 ..< 1
        var pickindex = 0
        
        if type == 0{
            for _ in 0 ..< rice.count {
                randNum = 0 ..< rice.count
            }
        }
        else if type == 1{
            for _ in 0 ..< noddle.count {
                randNum = 0 ..< noddle.count
            }
        }
        else if type == 2{
            for _ in 0 ..< barbecue.count {
                randNum = 0 ..< barbecue.count
            }
        }
        else if type == 3{
            for _ in 0 ..< dessert.count {
                randNum = 0 ..< dessert.count
            }
        }
        pickindex = randNum.randomElement()!
        return pickindex
    }
}

struct information: View{
    let pick: Int
    let type: Int
    let classfication = [rice, noddle, barbecue, dessert]
    @State private var showImg = true
    
    var body: some View {
        VStack{
            
            if(showImg) {
                Image(classfication[type][pick].image)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width:300, height:400)
                    .transition(.opacity)
                    .contextMenu {
                        Button(action: {
                            self.showImg = false
                        }) {
                            Text("我不想看到圖片")
                            Image(systemName: "eye.slash")
                        }
                        Button(action: {}) {
                            Text("沒事按好玩的")
                            Image(systemName: "flame")
                        }
                }
                .onAppear {
                    self.showImg = true
                    
                }
                .onDisappear {
                    self.showImg = false
                }
            }
            
            
            Text(classfication[type][pick].name)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(40)
                
            
            Spacer()
            
            Text("系統評分：" + String(format: "%.1f", classfication[type][pick].score))
                .font(.system(size: 20))
                .foregroundColor(.red)
            
            
            Spacer()
            
            Text(classfication[type][pick].description)
            
            Button("點這裡看詳細資訊"){
                if let url = URL(string: self.classfication[self.type][self.pick].link) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:])
                    }
                }
            }.frame(width:180,height:20)
            .padding()
            .font(.system(size: 20))
            .background(Color(red:61/255, green:61/255, blue:61/255))
            .cornerRadius(15)
            .foregroundColor(.red)
            .padding(5)
            
            
        }
        .animation(.easeInOut(duration:1.5))
    }
}

struct DinnerView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
