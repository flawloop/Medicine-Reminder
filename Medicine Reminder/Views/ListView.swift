//
//  ListView.swift
//  Medicine Reminder
//
//  Created by yaaburnee on 09/08/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var medicineViewModel: MedicineViewModel
    
    var body: some View {
        ZStack {
            if medicineViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                VStack {
                List {
                    ForEach(medicineViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    medicineViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: medicineViewModel.deleteItem)
                    .onMove(perform: medicineViewModel.moveItem)
                }
                Spacer ()
                Text("Statistics:")
                Spacer ()
                }
            }
        }
        .navigationTitle("Мед Ремайндер 💠")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ListView()
            }
            .preferredColorScheme(.light)
            .environmentObject(MedicineViewModel())
            
            NavigationView {
                ListView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(MedicineViewModel())
        }
        
    }
}

