# 요구사항 명세서

## 1. 프로젝트 개요
- 프로젝트 명: HRMS 시스템 개발
- 설명: 포트폴리오용 HRMS 시스템으로, GPT와 협업하여 단기간에 기획·설계·개발을 수행

## 2. 개발 환경 및 도구
- 언어: Python, JavaScript (TypeScript)
- 백엔드: Django (Django REST Framework)
- 프론트엔드: React.js (TypeScript, TailwindCSS)
- 데이터베이스: MySQL
- 컨테이너: Docker Compose
- 인증 및 보안: JWT, Bcrypt 암호화
- 협업 도구: GitHub (GitHub Desktop), Trello
- CI/CD: GitHub Actions
- 모니터링 및 로깅: Sentry, ELK Stack

## 3. 기능 요구사항
<details>
<summary>1차 개발 (MVP)</summary>

- 사용자 관리
  - 회원가입, 로그인/로그아웃
  - 권한 및 역할(Role) 관리
- 조직 관리
  - 조직 생성, 조직코드 자동 생성
  - 부서/팀 CRUD
- 인사 관리 기본 설정
  - 필수/추가 인사 정보 설정
  - 고용 형태 설정
- 조직도/조직원 목록
  - 리스트 형태로 표시
- 기본 휴가·근태 설정
  - 휴가 유형, 근무 유형 등록

</details>

<details>
<summary>2차 개발 (확장)</summary>

- 휴가 관리
  - 휴가 신청/승인 워크플로우
  - 자동 휴가 부여 정책
  - 잔여 휴가 알림
- 근태 관리
  - 출퇴근 기록, 월별·주별 근로시간 집계
  - 근태 변경 신청 및 승인
  - 초과 근무 알림
- 증명서 발급 관리
  - 양식 관리, 데이터 태그
  - 신청/결재/발급 내역
- 재무 관리
  - 지출·구매 내역 관리
  - 계정 과목, 결제 수단 설정

</details>

<details>
<summary>3차 개발 (고도화)</summary>

- 워크플로우 관리
  - 공통 문서 양식, 프로세스 관리
  - 개인 문서 양식
  - 문서 검색 및 분석
- 대시보드
  - 관리자/개인 대시보드
  - 보고서 및 시각화
- 알림 시스템
  - 메일·Slack·캘린더 연동
- 멀티테넌시, 클라우드 배포 준비

</details>

## 4. 비기능 요구사항
<details>
<summary>보안</summary>
- HTTPS: 데이터 전송 보안을 위해 <br>
- JWT 인증: 안전한 사용자 인증을 위해  <br>
- 비밀번호 Bcrypt 암호화 저장: 비밀번호 유출 방지를 위해<br>
</details>

<details>
<summary>확장성</summary>
- 모듈화 아키텍처: 유지보수 및 기능 확장을 쉽게 하기 위해  <br>
- API 명세 OpenAPI 문서화: 외부 연동 및 개발 효율성을 위해<br>
</details>

<details>
<summary>성능</summary>
- 캐싱 전략: 시스템 응답 속도 향상을 위해<br>
</details>

<details>
<summary>장애 대응</summary>
- 실시간 에러 모니터링 (Sentry): 빠른 문제 인지와 대응을 위해 <br>
- 중앙화된 로그 관리 (ELK): 문제 분석 및 추적을 위해<br>
</details>

## 5. 제약사항
- 무료 도구 및 오픈소스 사용
- 단일 개발자(GPT 협업 포함)로 1개월 이내 개발 (일 6시간, 주 5일)
- 포트폴리오용으로 상용 환경 배포는 제외

## 6. 추후 고려사항
- 모바일 앱 개발 (React Native)
- 클라우드 인프라 전환 (AWS/GCP)