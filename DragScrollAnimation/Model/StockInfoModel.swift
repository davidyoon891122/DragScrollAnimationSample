//
//  StockInfoModel.swift
//  DragScrollAnimation
//
//  Created by jiwon Yoon on 2023/06/12.
//

import Foundation

struct StockInfoModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let currentPrice: Double
    let changeValue: Double
    let changePercent: Double
}

extension StockInfoModel {
    static let stockInfoModel = [
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "삼성전자", currentPrice: 71200, changeValue: -1000, changePercent: -1.53),
        StockInfoModel(name: "마녀공장", currentPrice: 71200, changeValue: -1000, changePercent: -1.53)
    ]
}
