## 🗂️ 인사 관리 시스템 (HR Management System)

## 📐 ERD 테이블 정의 (초안)

### 1. `users` – 사원 정보
| 필드명 | 타입 | 설명 |
|--------|------|------|
| `id` | INT (PK, Auto) | 사원 고유 ID |
| `emp_no` | VARCHAR | 사번 (고유, 예: EMP2025001) |
| `name` | VARCHAR | 이름 |
| `email` | VARCHAR | 이메일 (로그인 ID) |
| `password` | VARCHAR | 비밀번호 (암호화 저장) |
| `department_id` | INT (FK) | 소속 부서 ID |
| `position_id` | INT (FK) | 직급 ID |
| `role` | ENUM | 'user', 'admin' |
| `status` | ENUM | '재직', '퇴사' |
| `entry_date` | DATE | 입사일 |
| `leave_date` | DATE | 퇴사일 (NULL 가능) |
| `created_at` | DATETIME | 생성일 |
| `updated_at` | DATETIME | 수정일 |

---

### 2. `departments` – 부서 정보
| 필드명 | 타입 | 설명 |
|--------|------|------|
| `id` | INT (PK) | 부서 ID |
| `name` | VARCHAR | 부서명 |
| `created_at` | DATETIME | 생성일 |
| `updated_at` | DATETIME | 수정일 |

---

### 3. `positions` – 직급 정보
| 필드명 | 타입 | 설명 |
|--------|------|------|
| `id` | INT (PK) | 직급 ID |
| `name` | VARCHAR | 직급명 |
| `created_at` | DATETIME | 생성일 |
| `updated_at` | DATETIME | 수정일 |

---

### 4. `leaves` – 연차 신청 및 승인
| 필드명 | 타입 | 설명 |
|--------|------|------|
| `id` | INT (PK) | 연차 신청 ID |
| `user_id` | INT (FK) | 신청 사원 |
| `start_date` | DATE | 시작일 |
| `end_date` | DATE | 종료일 |
| `reason` | TEXT | 사유 |
| `status` | ENUM | '대기', '승인', '반려' |
| `approved_by` | INT (FK, NULL 가능) | 승인자 (관리자) |
| `created_at` | DATETIME | 신청일 |
| `updated_at` | DATETIME | 변경일 |

---

### 5. `resignations` – 퇴사 처리 내역
| 필드명 | 타입 | 설명 |
|--------|------|------|
| `id` | INT (PK) | 퇴사 기록 ID |
| `user_id` | INT (FK) | 퇴사자 |
| `reason` | TEXT | 퇴사 사유 |
| `resign_date` | DATE | 퇴사일 |
| `processed_by` | INT (FK) | 처리자 (관리자) |
| `created_at` | DATETIME | 기록일 |

---

### 6. `activity_logs` – 활동 로그
| 필드명 | 타입 | 설명 |
|--------|------|------|
| `id` | INT (PK) | 로그 ID |
| `user_id` | INT (FK) | 사용자 ID |
| `action` | VARCHAR | 동작명 (예: login, update_profile, apply_leave) |
| `description` | TEXT | 상세 설명 |
| `created_at` | DATETIME | 발생 시각 |

---

### 7. `notifications` – 알림 이력 (외부 연동 고려)
| 필드명 | 타입 | 설명 |
|--------|------|------|
| `id` | INT (PK) | 알림 ID |
| `user_id` | INT (FK) | 수신자 ID |
| `type` | ENUM | 'email', 'slack', 'sms' 등 |
| `message` | TEXT | 알림 내용 |
| `status` | ENUM | '성공', '실패' |
| `sent_at` | DATETIME | 발송 시각 |

---

### 📌 설계 기반의 추가 고려 사항 (ERD에는 포함)
※ 다음 항목은 현재 시스템에서는 구현하지 않지만, **시스템 고도화 및 확장 시 고려할 수 있는 테이블**로 설계에만 반영함.

- `menus`: 동적 메뉴/네비게이션 구성을 위한 테이블
- `permissions`: 사용자 역할별 메뉴/기능 권한 설정용 테이블
- `settings`: 연차 기본값, 시스템 설정값 등을 저장하는 전역 설정 테이블

이는 향후 전자결재 시스템 또는 관리자 기능 고도화 시 자연스럽게 통합될 수 있도록 **확장 설계를 유연하게 하기 위한 준비 구조** 임.
