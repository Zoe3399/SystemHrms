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

## ✅ 확장성과 외부 연동 고려 사항 정리

### 🔹 확장성 측면 설계 근거
| 요소 | 반영 여부 | 설명 |
|------|------------|--------|
| 테이블 정규화 | ✅ | 부서, 직급, 유저 관계를 분리하여 구조 유연화 |
| 상태 필드 Enum | ✅ | 사용자 상태, 연차 상태 등 확장 가능하도록 명시화 |
| 공통 필드 | ✅ | `created_at`, `updated_at` 활용으로 이력 추적 및 로깅 가능 |
| 로그 테이블 | ✅ | `activity_logs`를 통해 기능별 이벤트 저장, 보안성 강화 |

### 🔹 외부 연동 고려 사항
| 항목 | 설명 | 연동 가능 대상 예시 |
|--------|------|--------------------|
| 메일 발송 | 연차 승인/퇴사 시 알림 메일 전송 | Gmail SMTP, SendGrid 등 |
| 메신저 연동 | Slack 등 외부 메시징 시스템 통합 | Slack API, Mattermost 등 |
| 외부 인증 | SSO, 사내 인증 시스템 연결 | OAuth2, Google Login 등 |
| 타 시스템 통합 | ERP/전자결재/메일 시스템 연계 설계 기반 확보 | REST API, Webhook 등 |

> ※ `files` 테이블은 현재 실무 흐름(연차 신청 시 첨부 불필요)에 따라 제외함. 단, 병가/특수휴가 기능 확장 시 고려 가능.
