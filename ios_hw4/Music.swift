//
//  Music.swift
//  IOS HW4
//
//  Created by User10 on 2020/10/18.
//

import SwiftUI
import AVFoundation
import MediaPlayer

struct Music: View {
    @State var play = true
    //@State var looper: AVPlayerLooper?
    let player = AVPlayer()
    let commandCenter = MPRemoteCommandCenter.shared()
    var body: some View {
        HStack{
            Image("刻在你心底的名字")
                .resizable()
                .frame(width:50,height:50)
                .scaledToFill()
                .padding(.trailing,40)
            Text("刻在你心底的名字")
                .font(.system(size:22))
                .bold()
                .foregroundColor(Color.white)
            Spacer()
            Button(action: {
                let fileUrl=Bundle.main.url(forResource:"刻在你心底的名字",withExtension: "mp3")
                let playerItem = AVPlayerItem(url: fileUrl!)
                self.player.replaceCurrentItem(with: playerItem)
                //self.looper = AVPlayerLooper(player: self.player, templateItem: playerItem)
                self.play.toggle()
                if self.play{
                    self.player.pause()
                }
                else{
                    self.player.play()
                }
                self.commandCenter.playCommand.addTarget {  event in
                    if self.player.rate == 0.0 {
                        self.player.play()
                        return .success
                    }
                    return .commandFailed
                }
                
                self.commandCenter.pauseCommand.addTarget {  event in
                    if self.player.rate == 1.0 {
                        self.player.pause()
                        return .success
                    }
                    return .commandFailed
                }
                
            }){
                Image(systemName: play ? "play.circle" : "pause.circle")
                    .resizable()
                    .frame(width:40,height:40)
                    .foregroundColor(Color.purple)
            }
        }
        .padding(10)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .leading, endPoint: .trailing))
    }
}

struct Music_Previews: PreviewProvider {
    static var previews: some View {
        Music()
    }
}
