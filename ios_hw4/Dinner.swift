//
//  Dinner.swift
//  ios_hw4
//
//  Created by User10 on 2020/11/1.
//

import Foundation
struct dinner{
    var name:String
    var description:String
    var image:String
    var score:Double
    var link:String
}
let rice  = [
    dinner(name:"喬品賣炒飯", description:"""
        地點就在85大樓旁邊，真的就是旁邊，不要錯過了～
        如果確定要用餐最好提前預訂，不然不是等很久，就是沒東西可以賣你
        內用也可以預訂喔～店家會留位置給你，雖然生意很好但我覺得態度也很親切呢！
        """,image:"rice0",score:8,link:"https://nigi33kimo.pixnet.net/blog/post/108266308"),
    dinner(name:"米糕世家", description:"""
        這裡主要提供的主食為：米糕、雞肉飯、肉燥飯、豬腳飯。
        還有一些湯類、燙青菜、各式小菜，價格都很平價。
        用餐時先填寫 點菜單，然後再到櫃台買單。
        """,image:"rice1",score:9,link:"https://nigi33kimo.pixnet.net/blog/post/106112918")
    
    ]
let noddle = [
    dinner(name:"鳳邑麵線",description:"""
        2008年，鳳山建城220年，舉辦「發現鳳山美食小吃」比賽，
        榮獲麵食麵點類第一名，更是所有各類美食的總冠軍。
        一舉將老店聲名燒到沸騰，近年來幾乎上遍各大旅遊美食節目。
        """,image:"noddle0",score:10,link:"https://nigi33kimo.pixnet.net/blog/post/109455377-%e3%80%90%e9%ab%98%e9%9b%84%e3%80%91%e9%b3%b3%e9%82%91%e9%ba%b5%e7%b7%9a-%e8%87%aa%e7%94%b1%e4%ba%8c%e5%ba%97~%e5%86%a0%e8%bb%8d%e7%9a%84%e6%bb%8b%e5%91%b3"),
    dinner(name:"勇伯豬舌冬粉",description:"""
        這家已有一甲子歷史的在地老店，
        賣的菜色都是再尋常不過的鄉土料理，卻能歷久不衰；
        包括豬舌冬粉、豬心冬粉、花枝丸都是熱門餐點。
        """,image:"noddle1",score:7,link:"https://nigi33kimo.pixnet.net/blog/post/111611548")
]
let barbecue = [
    dinner(name:"仁武烤鴨",description:"""
        高雄知名『仁武烤鴨』開店近30年，名聲遠播，
        不僅本地人愛吃，也吸引很多外地客光顧。
        每次只要路過此地段，會發現店門口前總是大塞車。
        """,image:"barbecue0",score:7,link:"https://nigi33kimo.pixnet.net/blog/post/103369780"),
    dinner(name:"黑輪伯黑輪攤",description:"""
        香腸肥瘦適當，有微微的炭火味，外皮烤得脆嫩，
        配著大腸吃最棒了。香腸一支15元。
        黑輪咬起來很紮實，且很有彈性，
        味道與7-11就是不一樣，因為這裡的香味較重。
        """,image:"barbecue1",score:9,link:"https://nigi33kimo.pixnet.net/blog/post/100583595")
]
let dessert = [
    dinner(name:"渡船頭海之冰",description:"""
        開業於1990年的渡船頭海之冰，
        是大碗冰的創始店，跟『大碗公』很容易混淆。
        迄今30年，在高雄僅有海之冰這麼一間，無分店、無加盟。
        我想辛苦是有回報的，店面規模越開越大，
        就算坊間有其他店抄襲，
        不過渡船頭海之冰始終最得人心。
        吸引國內外觀光客慕名而來，
        一到假日總是座無虛席、大排長龍。
        """,image:"dessert0",score:10,link:"https://nigi33kimo.pixnet.net/blog/post/119523193"),
    dinner(name:"宏美冰果店",description:"""
        宏美冰果店將店面翻修，在裝潢設計中注入年輕氣息，
        提供更好的用餐環境給客人，
        除了冰品、飲料，還有鍋燒麵、厚片吐司，
        平時的價格讓學生或附近的住家隨時想吃就吃。
        """,image:"dessert1",score:8,link:"https://nigi33kimo.pixnet.net/blog/post/118936878")
]
