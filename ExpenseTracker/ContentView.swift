//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Thais Souza on 10/12/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
//    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    let data = transactionListVM.accumulateTransactions()
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(totalExpenses.formatted(.currency(code: Locale.current.currency?.identifier ?? "BRL")), type: .title, format: "R$ %.02f")
                                    .background(Color.systemBackground)
                                LineChart()
                                    .background(Color.systemBackground)
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                        
                    }
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            
            .background(Color.backgroundColor)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.iconColor, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

private let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()

#Preview {
    ContentView()
        .environmentObject(transactionListVM)
}
