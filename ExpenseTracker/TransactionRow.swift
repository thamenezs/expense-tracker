//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Thais Souza on 10/12/24.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction: Transaction
    var body: some View {
        HStack(spacing: 20){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.iconColor)
                }
            VStack(alignment: .leading, spacing: 6) {
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                
            }
            Spacer()
            
            Text(transaction.signedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                .bold()
                .foregroundStyle(transaction.type == TransactionType.credit.rawValue ? Color.textColor : Color.primary)
            
        }
        .padding([.top, .bottom], 8)

    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
