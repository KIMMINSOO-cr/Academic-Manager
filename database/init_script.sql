-- 1. 기존 DB가 있다면 삭제하고 새로 시작 (친구 컴퓨터 초기화용)
DROP DATABASE IF EXISTS `academicdb`;

-- 2. 데이터베이스 생성
CREATE SCHEMA IF NOT EXISTS `academicdb` DEFAULT CHARACTER SET utf8mb4;
USE `academicdb`;

-- =============================================
-- 3. 테이블 생성 (Structure)
-- =============================================

-- (1) 관리자 테이블
CREATE TABLE IF NOT EXISTS `Admin` (
  `admin_id` VARCHAR(20) NOT NULL COMMENT '관리자 아이디',
  `password` VARCHAR(20) NOT NULL COMMENT '비밀번호',
  `name` VARCHAR(20) NOT NULL COMMENT '관리자 이름',
  PRIMARY KEY (`admin_id`)
);

-- (2) 교수 테이블
CREATE TABLE IF NOT EXISTS `Professor` (
  `prof_id` VARCHAR(20) NOT NULL COMMENT '교번',
  `name` VARCHAR(50) NOT NULL COMMENT '이름',
  `dept` VARCHAR(50) NULL COMMENT '소속 학과',
  `office` VARCHAR(50) NULL COMMENT '연구실 위치',
  `phone` VARCHAR(20) NULL COMMENT '연락처',
  `password` VARCHAR(20) NOT NULL COMMENT '비밀번호',
  PRIMARY KEY (`prof_id`)
);

-- (3) 학생 테이블
CREATE TABLE IF NOT EXISTS `Student` (
  `stu_id` VARCHAR(20) NOT NULL COMMENT '학번',
  `name` VARCHAR(50) NOT NULL COMMENT '이름',
  `dept` VARCHAR(50) NULL COMMENT '학과',
  `grade` INT NULL DEFAULT 1 COMMENT '학년',
  `phone` VARCHAR(20) NULL COMMENT '연락처',
  `address` VARCHAR(100) NULL COMMENT '주소',
  `password` VARCHAR(20) NOT NULL COMMENT '비밀번호',
  PRIMARY KEY (`stu_id`)
);

-- (4) 강의 테이블 (이름: Lecture / 컬럼: lecture_id)
CREATE TABLE IF NOT EXISTS `Lecture` (
  `lecture_id` VARCHAR(20) NOT NULL COMMENT '강의 코드',
  `title` VARCHAR(100) NOT NULL COMMENT '강의명',
  `credit` INT NOT NULL DEFAULT 3 COMMENT '학점',
  `prof_id` VARCHAR(20) NOT NULL COMMENT '담당 교수 ID',
  `room` VARCHAR(20) NULL COMMENT '강의실',
  `max_student` INT DEFAULT 30 COMMENT '정원',
  PRIMARY KEY (`lecture_id`),
  FOREIGN KEY (`prof_id`) REFERENCES `Professor` (`prof_id`)
  ON DELETE CASCADE ON UPDATE CASCADE
);

-- (5) 수강신청 테이블 (Enrollment)
CREATE TABLE IF NOT EXISTS `Enrollment` (
  `enroll_id` INT AUTO_INCREMENT NOT NULL COMMENT '수강신청 고유번호',
  `stu_id` VARCHAR(20) NOT NULL COMMENT '학번',
  `lecture_id` VARCHAR(20) NOT NULL COMMENT '강의 코드',
  `score` INT NULL DEFAULT 0 COMMENT '점수',
  `grade` VARCHAR(5) NULL COMMENT '학점',
  PRIMARY KEY (`enroll_id`),
  FOREIGN KEY (`stu_id`) REFERENCES `Student` (`stu_id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`lecture_id`) REFERENCES `Lecture` (`lecture_id`)
  ON DELETE CASCADE ON UPDATE CASCADE
);

-- =============================================
-- 4. 테스트 데이터 입력 (Data) - 님이 작성하신 내용 포함
-- =============================================

INSERT INTO `Admin` VALUES ('admin', '1234', '총관리자');

INSERT INTO `Professor` VALUES ('P001', '이순신', '컴퓨터공학과', '공학관 301호', '010-1111-2222', '1234');
INSERT INTO `Professor` VALUES ('P002', '장영실', '기계공학과', '공학관 105호', '010-3333-4444', '1234');

INSERT INTO `Student` VALUES ('2024001', '홍길동', '컴퓨터공학과', 1, '010-5555-6666', '서울시 마포구', '1234');
INSERT INTO `Student` VALUES ('2024002', '김철수', '컴퓨터공학과', 2, '010-7777-8888', '경기도 성남시', '1234');
INSERT INTO `Student` VALUES ('2024003', '이영희', '기계공학과', 1, '010-9999-0000', '인천시 연수구', '1234');

-- 강의 데이터 (컬럼명 lecture_id 확인 완료)
INSERT INTO `Lecture` VALUES ('CS101', '자바프로그래밍', 3, 'P001', '305호', 30);
INSERT INTO `Lecture` VALUES ('CS102', '데이터베이스', 3, 'P001', '306호', 30);
INSERT INTO `Lecture` VALUES ('ME101', '일반물리학', 2, 'P002', '101호', 40);

-- 수강신청 내역
INSERT INTO `Enrollment` (stu_id, lecture_id, score, grade) VALUES ('2024001', 'CS101', 95, 'A+');
INSERT INTO `Enrollment` (stu_id, lecture_id, score, grade) VALUES ('2024001', 'CS102', 88, 'B+');
INSERT INTO `Enrollment` (stu_id, lecture_id, score, grade) VALUES ('2024002', 'CS101', 0, NULL);