# ERD (개체-관계 다이어그램)

## 개요
본 문서는 HRMS 시스템의 데이터베이스 구조를 설명하는 개체-관계 다이어그램(Entity-Relationship Diagram, ERD)을 포함하며, 주요 테이블(개체)과 그 속성 및 관계를 기술합니다.

## 주요 개체 및 속성

<details>
<summary>1. 직원(Employee)</summary>

### 1. 직원(Employee)
- **employee_id** (PK): 직원 고유 식별자
- **name**: 직원 이름
- **email**: 이메일
- **password**: 암호화된 비밀번호
- **emp_no**: 사번
- **entry_date**: 입사일
- **leave_date**: 퇴사일 (nullable)
- **status**: 재직 상태 (재직 중, 퇴직)
- **created_at**: 생성일시
- **updated_at**: 수정일시
- **department_id** (FK): 부서 참조
- **position_id** (FK): 직위/직책 참조
- **role_id** (FK): 사용자 역할 참조

</details>

<details>
<summary>2. 부서(Department)</summary>

### 2. 부서(Department)
- **department_id** (PK): 부서 고유 식별자
- **name**: 부서명
- **parent_id** (FK, nullable): 상위 부서 참조 (자기참조)
- **manager_id** (FK, nullable): 부서 관리자(직원) 참조
- **created_at**: 생성일시
- **updated_at**: 수정일시

</details>

<details>
<summary>3. 직위(Position)</summary>

### 3. 직위(Position)
- **position_id** (PK): 직위/직책 고유 식별자
- **name**: 직위/직책명
- **created_at**: 생성일시
- **updated_at**: 수정일시

</details>

<details>
<summary>4. 근태(Attendance)</summary>

### 4. 근태(Attendance)
- **attendance_id** (PK): 근태 고유 식별자
- **employee_id** (FK): 직원 참조
- **date**: 날짜
- **check_in**: 출근 시간
- **check_out**: 퇴근 시간
- **break_time**: 휴게 시간
- **work_hours**: 근로 시간
- **overtime_hours**: 연장 근무 시간
- **created_at**: 생성일시
- **updated_at**: 수정일시

</details>

<details>
<summary>5. 휴가(Leave)</summary>

### 5. 휴가(Leave)
- **leave_id** (PK): 휴가 내역 고유 식별자
- **employee_id** (FK): 직원 참조
- **leave_type**: 휴가 유형 (연차, 반차, 병가 등)
- **start_date**: 시작일
- **end_date**: 종료일
- **days**: 휴가 일수
- **status**: 상태 (신청, 승인, 반려)
- **reason**: 사유
- **created_at**: 생성일시
- **updated_at**: 수정일시

</details>

<details>
<summary>6. 급여(Payroll)</summary>

### 6. 급여(Payroll)
- **payroll_id** (PK): 급여 고유 식별자
- **employee_id** (FK): 직원 참조
- **period**: 급여 기간 (YYYY-MM)
- **basic_salary**: 기본 급여
- **allowances**: 수당 합계
- **deductions**: 공제 합계
- **net_pay**: 실수령액
- **created_at**: 생성일시
- **updated_at**: 수정일시

</details>

<details>
<summary>7. 사용자 역할(Role)</summary>

### 7. 사용자 역할(Role)
- **role_id** (PK): 역할 고유 식별자
- **name**: 역할명 (관리자, 일반, 부서장 등)
- **permissions**: 권한 정보 (JSON 또는 연결 테이블)
- **created_at**: 생성일시
- **updated_at**: 수정일시

</details>

<details>
<summary>관계(Relationships)</summary>

## 관계(Relationships)
- 직원(Employee) — N:1 → 부서(Department)
- 직원(Employee) — N:1 → 직위(Position)
- 직원(Employee) — N:1 → 사용자 역할(Role)
- 직원(Employee) — 1:N → 근태(Attendance)
- 직원(Employee) — 1:N → 휴가(Leave)
- 직원(Employee) — 1:N → 급여(Payroll)
- 부서(Department) — 1:N → 부서(Department) (자기참조: 상위/하위 부서)

</details>

---

본 ERD를 바탕으로 Django 모델 클래스를 정의하고, 관계를 명확히 구현합니다.