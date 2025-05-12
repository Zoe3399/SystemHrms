# API 문서
> HRMS 시스템의 RESTful API 명세서입니다. 각 섹션을 클릭하여 상세 정보를 확인하세요.

<details><summary>🔐 인증 (Authentication)</summary>

- **POST** `/api/auth/login/`  
  - 설명: 사용자 로그인하여 JWT 토큰을 발급받습니다.  
  - 요청 본문 (JSON):
    ```json
    {
      "username": "사용자명",
      "password": "비밀번호"
    }
    ```
  - 응답 예시:
    ```json
    {
      "token": "eyJ0eXAi..."
    }
    ```
- **POST** `/api/auth/logout/`  
  - 설명: 현재 토큰을 사용 불가 처리합니다.  
  - 헤더: `Authorization: Bearer <token>`

</details>

<details><summary>👥 사용자 관리 (Users)</summary>

- **GET** `/api/users/`  
  - 설명: 모든 사용자 목록 조회  
- **POST** `/api/users/`  
  - 설명: 신규 사용자 생성  
  - 요청 본문 예시 (JSON):
    ```json
    {
      "username": "johndoe",
      "password": "password123",
      "email": "john@example.com",
      "department": 1,
      "position": 2
    }
    ```
- **GET** `/api/users/{id}/`  
  - 설명: 특정 사용자 상세 조회  
- **PUT** `/api/users/{id}/`  
  - 설명: 특정 사용자 정보 수정  
- **DELETE** `/api/users/{id}/`  
  - 설명: 특정 사용자 삭제

</details>

<details><summary>🏢 조직 관리 (Departments)</summary>

- **GET** `/api/departments/`  
  - 설명: 모든 부서 목록 조회  
- **POST** `/api/departments/`  
  - 설명: 신규 부서 생성  
  - 요청 본문 예시 (JSON):
    ```json
    {
      "name": "인사팀",
      "parent": null
    }
    ```
- **GET** `/api/departments/{id}/`  
  - 설명: 특정 부서 상세 조회  
- **PUT** `/api/departments/{id}/`  
  - 설명: 특정 부서 정보 수정  
- **DELETE** `/api/departments/{id}/`  
  - 설명: 특정 부서 삭제

</details>

<details><summary>📋 직위/직책 관리 (Positions)</summary>

- **GET** `/api/positions/`  
  - 설명: 모든 직위/직책 목록 조회  
- **POST** `/api/positions/`  
  - 설명: 신규 직위/직책 생성  
- **GET** `/api/positions/{id}/`  
  - 설명: 특정 직위/직책 상세 조회  
- **PUT** `/api/positions/{id}/`  
  - 설명: 특정 직위/직책 정보 수정  
- **DELETE** `/api/positions/{id}/`  
  - 설명: 특정 직위/직책 삭제  

</details>

<details><summary>⏰ 근태 관리 (Attendance)</summary>

- **GET** `/api/attendance/`  
  - 설명: 출퇴근 내역 조회  
- **POST** `/api/attendance/`  
  - 설명: 출퇴근 기록 생성  
- **GET** `/api/attendance/{id}/`  
  - 설명: 특정 출퇴근 기록 조회  
- **PUT** `/api/attendance/{id}/`  
  - 설명: 출퇴근 기록 수정  
- **DELETE** `/api/attendance/{id}/`  
  - 설명: 출퇴근 기록 삭제  

</details>

<details><summary>🏖️ 휴가 관리 (Leaves)</summary>

- **GET** `/api/leaves/`  
  - 설명: 휴가 내역 조회  
- **POST** `/api/leaves/`  
  - 설명: 신규 휴가 신청  
- **GET** `/api/leaves/{id}/`  
  - 설명: 특정 휴가 신청 조회  
- **PUT** `/api/leaves/{id}/`  
  - 설명: 휴가 신청 수정  
- **DELETE** `/api/leaves/{id}/`  
  - 설명: 휴가 신청 삭제  

</details>