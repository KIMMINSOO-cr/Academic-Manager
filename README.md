# 🎓 학사 관리 시스템 (Academic Management System)

Java Swing(GUI)과 MySQL 데이터베이스를 연동하여 구축한 대학 학사 관리 프로그램입니다.
관리자, 교수, 학생 3가지 역할에 따라 맞춤형 기능을 제공하며, 수강 신청부터 성적 처리까지 학사 행정의 전반적인 과정을 다룹니다.

## 💡 주요 기능 (Key Features)
### 🧑‍💼 1. 관리자 (Administrator)
* **사용자 관리**: 학생 및 교수 계정 등록, 수정, 삭제 (회원가입 승인)
* **강의 관리**: 신규 강의 개설, 강의 시간 및 강의실 배정, 폐강 처리
* **학사 관리**: 학과 정보 관리, 학사 일정 설정

### 👨‍🏫 2. 교수 (Professor)
* **내 강의 조회**: 담당 강의 목록 및 시간표 확인
* **수강생 관리**: 강의별 수강생 명단 조회 및 출석부 관리
* **성적 처리**: 중간/기말 고사 점수 입력 및 학점 부여 (성적 수정 기능 포함)

### 🧑‍🎓 3. 학생 (Student)
* **수강 신청**: 개설된 강의 조회 및 수강 신청/취소 (장바구니 기능)
* **시간표 조회**: 수강 신청 완료된 강의 시간표 시각화
* **성적 조회**: 학기별 성적 확인 및 전체 평점(GPA) 조회
* **내 정보**: 비밀번호 변경 및 개인 정보 수정

## 🛠 기술 스택 (Tech Stack)
* **Language**: Java (JDK 24)
* **IDE**: Apache NetBeans 22
* **Database**: MySQL 8.0.44
* **GUI**: Java Swing (NetBeans GUI Builder)
* **Library**: MySQL Connector/J 9.5.0
* **Version Control**: GitHub & GitHub Desktop

## 📂 프로젝트 구조 (Folder Structure)
Academic-Manager/
├── src/                        # Java 소스 코드 (MVC 패턴)
├── lib/                        # 외부 라이브러리 (JDBC Driver 저장소)
├── database/                   # DB 초기화 SQL 스크립트
├── docs/                       # 프로젝트 문서 및 ERD
└── README.md                   # 프로젝트 설명서
