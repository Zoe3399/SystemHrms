create database if not exists hrms;
use hrms;

create table users (
id int auto_increment primary key,
emp_no VARCHAR(255) UNIQUE COMMENT '사번',
name VARCHAR(255),
email VARCHAR(255),
password VARCHAR(255),
department_id INT,
position_id INT,
role ENUM('user','admin') COMMENT '사용자 권한 구분',
status ENUM('재직','퇴사'),
entry_date DATE,
leave_date DATE,
created_at DATETIME,
updated_at DATETIME
);

CREATE TABLE if not exists departments (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE positions (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE leaves (
  id INT PRIMARY KEY,
  user_id INT,
  start_date DATE,
  end_date DATE,
  reason TEXT,
  status ENUM('대기','승인','반려'),
  approved_by INT COMMENT '관리자 ID',
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE resignations (
  id INT PRIMARY KEY,
  user_id INT,
  reason TEXT,
  resign_date DATE,
  processed_by INT,
  created_at DATETIME
);

CREATE TABLE activity_logs (
  id INT PRIMARY KEY,
  user_id INT,
  action VARCHAR(255),
  description TEXT,
  created_at DATETIME
);

CREATE TABLE notifications (
  id INT PRIMARY KEY,
  user_id INT,
  type ENUM('email','slack','sms') COMMENT '알림 방식',
  message TEXT,
  status ENUM('성공','실패'),
  sent_at DATETIME
);

CREATE TABLE menus (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  path VARCHAR(255) COMMENT '프론트 라우터 경로',
  parent_id INT COMMENT '상위 메뉴 ID (null이면 최상위)',
  order_no INT,
  created_at DATETIME
);

CREATE TABLE permissions (
  id INT PRIMARY KEY,
  role ENUM('user','admin'),
  menu_id INT,
  can_view BOOLEAN,
  can_edit BOOLEAN,
  can_delete BOOLEAN
);

CREATE TABLE settings (
  id INT PRIMARY KEY,
  `key` VARCHAR(255) UNIQUE,
  value TEXT,
  description TEXT,
  updated_at DATETIME
);

-- 3. 외래 키 제약 조건 추가

ALTER TABLE leaves ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE leaves ADD FOREIGN KEY (approved_by) REFERENCES users(id);

ALTER TABLE resignations ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE resignations ADD FOREIGN KEY (processed_by) REFERENCES users(id);

ALTER TABLE activity_logs ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE notifications ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE permissions ADD FOREIGN KEY (menu_id) REFERENCES menus(id);

show tables;
describe users;

-- 외래키 확인
SELECT table_name, constraint_name, referenced_table_name
FROM information_schema.referential_constraints
WHERE constraint_schema = 'hrms';