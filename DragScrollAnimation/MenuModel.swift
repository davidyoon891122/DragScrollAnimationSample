//
//  MenuModel.swift
//  DragScrollAnimation
//
//  Created by jiwon Yoon on 2023/06/08.
//

import Foundation

struct MenuModel: Identifiable, Hashable {
    let id = UUID()
    let menu: String
}

extension MenuModel {
    static let menuItems = [
        MenuModel(menu: "최근조회"),
        MenuModel(menu: "보유종목"),
        MenuModel(menu: "테스트"),
        MenuModel(menu: "국내투자대상"),
        MenuModel(menu: "해외투자대상"),
        MenuModel(menu: "빈 종목값"),
        MenuModel(menu: "속도체크"),
        MenuModel(menu: "가고싶은회사"),
        MenuModel(menu: "추가테스트"),
    ]
}
