//
//  ModalSheet.swift
//  EnvironmentVariables
//
//  Created by Maxim Macari on 11/11/2020.
//

import SwiftUI

struct ModalSheet: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSize: Int = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                VStack{
                    ScrollView{
                        Text("This is some text")
                            .font(.title)
                        
                        Text("Current size is: \(String(describing: ContentSizeCategory.allCases[currentSize]))")
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adispicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        
                        Text("Presentation mode: \(presentationMode.wrappedValue.isPresented.description)")
                    }
                }
                .environment(\.sizeCategory, ContentSizeCategory.allCases[currentSize])
                .padding()
                
                HStack(spacing: 20){
                    Button(action: {
                        if currentSize > 0 {
                            currentSize -= 1
                        }
                    }, label: {
                        Image(systemName: "minus")
                            .padding(5)
                            .background(Color.accentColor)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                    })
                    
                    Button(action: {
                        if currentSize < ContentSizeCategory.allCases.count - 1 {
                            currentSize += 1
                        }
                    }, label: {
                        Image(systemName: "plus")
                            .padding(5)
                            .background(Color.accentColor)
                            .foregroundColor(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                    })
                    
                }
            }
            .navigationTitle("Modal Sheet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .frame(width: 40, height: 40)
                    })
                }
            })
        }
        .onAppear(){
            currentSize = ContentSizeCategory.allCases.startIndex
        }
    }
}

struct ModalSheet_Previews: PreviewProvider {
    static var previews: some View {
        ModalSheet()
    }
}
