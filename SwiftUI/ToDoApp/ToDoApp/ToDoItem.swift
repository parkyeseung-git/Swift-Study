//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by 박콩승 on 11/2/24.
//

// TodoItem.swift - 모델 파일
import Foundation

// 각 할 일 항목을 나타내는 데이터 모델입니다.
struct TodoItem: Identifiable {
    var id = UUID()           // 각 항목의 고유 ID로 UUID를 사용합니다.
    var title: String         // 할 일의 제목을 저장하는 문자열입니다.
    var isCompleted: Bool = false // 할 일 완료 여부를 나타내는 불리언 값입니다.
    var date: Date             // 할 일 생성 날짜를 저장하는 Date 타입입니다.
}
