//
//  ContentView.swift
//  MailDemoApp
//
//  Created by Ozan Kocakaya on 13.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var showComposeMessageView : Bool = false
    var body: some View {
        
        TabView {
            
            // Ersten Tab
            NavigationView {
                
                List(0..<4) {
                    _ in // "_" Indikator, der zählt 0. mal, 1. mal,..
                    
                    NavigationLink(destination: Text("Nachrichtentext")) {
                        SingleMessageView()
                        
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Inbox")
                .navigationBarItems(trailing:
                                        Button(action: {
                    showComposeMessageView.toggle()
                    
                }, label: {
                    Image(systemName: "square.and.pencil")
                    
                })
                                    )
            }
            
            .sheet(isPresented: $showComposeMessageView, content: {
                ZStack {
                    Color.blue
                    Text("gag")
                }
            })
            .tabItem {
                Image(systemName: "envelope.fill")
                Text("Inbox")
            }
            
            // Zweiter Tab
            Text("Sent")
                .tabItem {
                    Image(systemName: "paperplane.fill")
                    Text("Sent")
              
                }
            
        }
        
    }
    
}

struct SingleMessageView: View {
    var body: some View {
        
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 42, height: 42)
                .foregroundColor(.blue)
            
            VStack (alignment: .leading){
                HStack {
                    Text("Absender")
                        .font(Font.headline)
                    
                    Spacer()
                    
                    Text("17.08.2023")
                        .font(Font.subheadline.monospacedDigit())
                        .foregroundColor(.secondary)
                    
                }
                    
                    
                    Text("Betreffzeile")
                        .font(Font.subheadline)
                        .lineLimit(1)
            }
        }
    }
}

//Vorschau
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
