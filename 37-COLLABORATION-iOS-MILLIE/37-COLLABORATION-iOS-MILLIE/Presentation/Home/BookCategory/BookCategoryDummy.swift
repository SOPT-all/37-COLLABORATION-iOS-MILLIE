//
//  BookCategoryDummy.swift
//  37-COLLABORATION-iOS-MILLIE
//
//  Created by 임소은 on 11/20/25.
//

import UIKit

enum BookCategoryDummy {

    static let categories: [BookCategoryModel] = [
        BookCategoryModel(categoryId: 1, title: "소설", description: "추리/스릴러, 스파이, 범죄 스릴러 등", imageURL: "Img_category_book2"),
        BookCategoryModel(categoryId: 2, title: "시/에세이", description: "에세이, 일기, 감성 글귀 등", imageURL: "Img_category_book3"),
        BookCategoryModel(categoryId: 3, title: "경제/경영", description: "투자, 돈, 마케팅, 조직, 경영 전략", imageURL: "Img_category_book4"),
        BookCategoryModel(categoryId: 4, title: "자기계발", description: "동기부여, 습관, 루틴, 능력 개발", imageURL: "Img_category_book5"),
        BookCategoryModel(categoryId: 5, title: "인문학", description: "철학, 심리학, 사회학, 고전 인문", imageURL: "Img_category_book6"),
        BookCategoryModel(categoryId: 6, title: "역사/문화", description: "세계사, 한국사, 현대사, 인물사", imageURL: "Img_category_book7"),
        BookCategoryModel(categoryId: 7, title: "과학/기술", description: "우주, 자연과학, 공학, IT 등", imageURL: "Img_category_book8"),
        BookCategoryModel(categoryId: 8, title: "예술/대중문화", description: "영화, 음악, 미술, 패션 등", imageURL: "Img_category_book9"),
        BookCategoryModel(categoryId: 9, title: "취미/라이프", description: "요리, 여행, 운동, DIY, 집 꾸미기", imageURL: "Img_category_book10"),
        BookCategoryModel(categoryId: 10, title: "유아/아동", description: "동화, 학습만화, 어린이 도서 등", imageURL: "Img_category_book11")
    ]
}
