# 37-COLLABORATION-iOS-MILLIE
<img width="1000" alt="image" src="https://github.com/user-attachments/assets/ccb7109b-8351-4f75-b011-c0a7eb38bd41" />

**37 DIVE SOPT 합동세미나 밀리의 서재 이용 플로우 개선 프로젝트**

## 👩🏻‍💻🧑🏻‍💻 Developers

| <img src="https://github.com/Yeonnies.png" width="200"> | <img src="https://github.com/H0sungKim.png" width="200"> | <img src="https://github.com/soeun11.png" width="200"> | <img src="https://github.com/soseoyo12.png" width="200"> |
| :---: | :---: | :---: | :---: |
| **김나연** | **김호성** | **임소은** | **송성용** |
| <p align = "center">`개발 환경 세팅` <br/> `네트워크 세팅` <br/> `컴포넌트` <br/> `댓글` | <p align = "center">`도서 상세 페이지`<br/> `서재` | <p align = "center">`검색 페이지 홈` | <p align = "center">`검색 결과 페이지`<br/> `포스트` |

## 🎬 시연 영상

||전체 플로우|검색홈/검색결과|상세|
|:--:|:--:|:--:|:--:|
|GIF|<img src = "https://github.com/user-attachments/assets/47b4aaa7-fa74-4d10-b2fe-9f267106311c" width ="210">|<img src = "https://github.com/user-attachments/assets/1a938c1b-2f98-4673-974e-81cc9ac43c19" width ="210">|<img src = "https://github.com/user-attachments/assets/71d27e64-109b-4f7a-9274-984309cda1f4" width ="210">|
<br/>

## 🐱 Code Convention

|태그|사용하는 부분|
|:-----:|:-----:|
|[Feat]|기능 구현 시 사용합니다.|
|[Style]|UI 구현 시 사용합니다.|
|[Add]|사진 등 에셋이나 라이브러리 추가 시 사용합니다.|
|[Fix]|버그나 오류 해결 시 사용합니다.|
|[Docs]|리드미, 템플릿 등 문서 수정 및 주석 추가 시 사용합니다.|
|[Refactor]|기존 코드를 성능 개선 등의 이유로 리팩토링했을 때 사용합니다.|
|[Delete]|기존 코드나 파일을 삭제했을 때 사용합니다.|
|[Setting]|프로젝트 관련 설정 변경 시 사용합니다.|
|[chore]|기타.|

### 커밋 메시지 형식
```
[Feat] #12 - 기능 설명
```

## 🌱 Branch Strategy
<img src="https://github.com/user-attachments/assets/f551fbc8-a8c0-4c11-8749-8ba8dd3bfa92" width="600" alt="">

모든 개발은 `develop` 브랜치를 중심으로 진행됩니다.
- Default Branch: `develop`
- PR Target: `develop`

|항목|규칙|예시|
|:-----:|:-----:|:-----:|
|이슈 제목|[라벨] 작업 내용|[Feat] LoginView 구현|
|브랜치 명|이슈-라벨/#이슈번호|feat/#36|

## 📁 Foldering
```
📁 Project
├── 📁 Application
│   ├── AppDelegate
│   ├── SceneDelegate
│   ├── Info.plist
├── 📁 Presentation
│   ├── 🗂️ Home
│   │   ├── 🗂️ Model
│   │   ├── 🗂️ View
│   │   ├── 🗂️ ViewController
│   ├── 🗂️ Detail
├── 📁 Global
|   ├── 🗂️ Extension
|   |   ├── UIFont+
|   |   ├── UIImage+
|   ├── 🗂️ Resoucre
|   |   ├── .ttf
|		|   ├── Asset.xcassets
|   ├── 🗂️ Component
|   └── 🗂️ Base
├── 📁 Network
│   └── 📁 Domain1
│       ├── 📁 DTO
│       │   ├── 📁 Request
│       │   └── 📁 Response
│       ├── Domain1API.swift
│───────└── Domain1Service.swift
```
