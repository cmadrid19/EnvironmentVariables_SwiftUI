//
//  ContentView.swift
//  EnvironmentVariables
//
//  Created by Maxim Macari on 11/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showModal = false
    
    /*
     Environment property
     - Used to read value stored in a Views environment:
     Init it indicating which value to read using the environment key path in the property declaration.
     */
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.locale) var locale
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Distribution: \(String(describing: horizontalSizeClass))")
                Text("Scheme color: \(String(describing: colorScheme))")
                Text("Layout direction: \(String(describing: layoutDirection))")
                Text("Locale: \(String(describing: locale))")
                Text("First day of the week: \(String(describing: calendar.firstWeekday))")
                
                if horizontalSizeClass == .compact {
                    VStack{
                        ColoredRectangle(color: Color.red)
                        ColoredRectangle(color: Color.green)
                    }
                } else {
                    HStack{
                        ColoredRectangle(color: Color.red)
                        ColoredRectangle(color: Color.green)
                    }
                }
            }
            .navigationTitle(Text("Environment variables"))
            .toolbar {
                ToolbarItem(placement: .automatic ) {
                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        Text("Show modal")
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: self.$showModal, content: {
            ModalSheet()
                .preferredColorScheme(colorScheme == .dark ? .light : .dark)
        })
    }
    
   
}


struct ColoredRectangle: View {
    var color: Color
    var body: some View{
        Rectangle()
            .foregroundColor(color)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


