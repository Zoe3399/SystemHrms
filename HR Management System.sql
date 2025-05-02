CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `emp_no` varchar(255) UNIQUE COMMENT '사번',
  `name` varchar(255),
  `email` varchar(255),
  `password` varchar(255),
  `department_id` int,
  `position_id` int,
  `role` enum('user','admin') COMMENT '사용자 권한 구분',
  `status` enum('재직','퇴사'),
  `entry_date` date,
  `leave_date` date,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `departments` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `positions` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `leaves` (
  `id` int PRIMARY KEY,
  `user_id` int,
  `start_date` date,
  `end_date` date,
  `reason` text,
  `status` enum('대기','승인','반려'),
  `approved_by` int COMMENT '관리자 ID',
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `resignations` (
  `id` int PRIMARY KEY,
  `user_id` int,
  `reason` text,
  `resign_date` date,
  `processed_by` int,
  `created_at` datetime
);

CREATE TABLE `activity_logs` (
  `id` int PRIMARY KEY,
  `user_id` int,
  `action` varchar(255),
  `description` text,
  `created_at` datetime
);

CREATE TABLE `notifications` (
  `id` int PRIMARY KEY,
  `user_id` int,
  `type` enum('email','slack','sms') COMMENT '알림 방식',
  `message` text,
  `status` enum('성공','실패'),
  `sent_at` datetime
);

CREATE TABLE `menus` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `path` varchar(255) COMMENT '프론트 라우터 경로',
  `parent_id` int COMMENT '상위 메뉴 ID (null이면 최상위)',
  `order_no` int,
  `created_at` datetime
);

CREATE TABLE `permissions` (
  `id` int PRIMARY KEY,
  `role` enum('user','admin'),
  `menu_id` int,
  `can_view` boolean,
  `can_edit` boolean,
  `can_delete` boolean
);

CREATE TABLE `settings` (
  `id` int PRIMARY KEY,
  `key` varchar(255) UNIQUE,
  `value` text,
  `description` text,
  `updated_at` datetime
);

ALTER TABLE `leaves` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `leaves` ADD FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);
ALTER TABLE `resignations` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `resignations` ADD FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`);
ALTER TABLE `activity_logs` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `notifications` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `permissions` ADD FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);