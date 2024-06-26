//
//  InboxView.swift
//  Message
//
//  Created by Пользователь on 03.04.2024.
//

import SwiftUI

struct InboxView: View {
    
    @State private var showMessageView = false
    @State private var user = User.MOCK_USER
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                ActiveNowView()
                
                List{
                    ForEach(0 ... 10, id: \.self){message in
                        InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
                
            }
            .navigationDestination(for: User.self, destination: {user in
                ProfileView(user: user)
            })
            .fullScreenCover(isPresented: $showMessageView, content: {
                NewMessageView()
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    HStack{
                        NavigationLink(value: user){
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showMessageView.toggle()
                    }label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
