# HR 관리 시스템 (system-hrms)

인사 관리 시스템(HRMS)은 사원 정보, 부서/직급, 근태, 연차, 입퇴사 내역을 관리할 수 있는 웹 애플리케이션입니다.

## 🚀 프로젝트 소개
- 포트폴리오용 HR 관리 시스템 개발
- 시스템 확장성 및 협업 관리 도구(GPT 협업 표기) 반영
- Trello, GitHub Issues를 통한 프로젝트 관리

## 📌 주요 기능
### 1차 개발
- 로그인 및 인증
- 사원 등록, 수정, 삭제
- 부서 및 직급 관리
- 근태 관리 (출퇴근 기록, 근무 시간 조회)
- 연차 신청 및 승인 처리
- 사용자 권한에 따른 메뉴 접근 제어

### 2차 개발
- 결재 관리 (전자결재, 승인 요청)
- 알림 시스템 (이메일 및 내부 알림)
- 대시보드 개선 (실시간 근태 현황, 연차 현황)

### 3차 개발
- 증명서 발급 시스템 (경력증명서, 재직증명서 등)
- 통합 보고서 생성 (부서별 근태 보고서, 연차 사용 통계)
- 분석 대시보드 (근태 패턴 분석, 연차 사용 예측)


## 🔧 실행 방법
### Frontend:
```bash
cd frontend
npm install
npm run dev
```

### Backend:
```bash
cd backend
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

### Docker Compose (통합 실행):
```bash
docker-compose up --build
```

## 🏗️ 아키텍처 문서
- 한국어: `docs/architecture_kr.md`
- 영어: `docs/architecture_en.md`

## ❓ 왜 이 스택인가?
- **Django & DRF:** 확장성 제공, 내장 관리자 및 ORM을 통한 빠른 개발
- **React & TypeScript:** UI 컴포넌트 재사용성 및 타입 안정성 확보
- **MySQL:** 트랜잭션 HR 데이터에 대한 검증된 ACID 준수
- **Docker:** 개발 및 운영 환경 간 일관성 유지
- **GitHub Actions:** 자동화된 CI/CD 파이프라인

## 🛠 기술 스택
- 프론트엔드: React, TypeScript, TailwindCSS
- 백엔드: Django, Django REST Framework (DRF)
- 데이터베이스: MySQL
- CI/CD: Docker, GitHub Actions
- 배포: Vercel (프론트엔드), Render (백엔드)

## 🔍 프로젝트 관리 도구
- Trello로 일정 및 작업 관리
- GitHub Issues 및 Milestones로 개발 관리
- Swagger로 API 명세 관리

## 🔒 협업 및 보안 도구
- GitHub Desktop을 통한 버전 관리
- Sentry로 에러 로깅 및 모니터링
- Docker를 통한 통일된 개발 환경
- JWT (JSON Web Token) 상태 비저장 인증
- Bcrypt를 통한 안전한 비밀번호 해싱

## 📈 시스템 확장 계획
- 1차 개발: 사용자 관리, 근태 관리, 문서 관리
- 2차 개발: 결재 관리, 알림 시스템, 대시보드 개선
- 3차 개발: 증명서 발급 시스템, 통합 보고서 생성, 분석 대시보드
- 다중 테넌시 지원: 단일 배포에서 여러 조직 서비스
- 모바일 애플리케이션 (React Native) 지원: 이동 중 액세스

## 🤝 GPT와의 협업 표기
- 프로젝트 전반의 설계, 기획, 코드 생성 및 문서화 전 과정에 GPT-4의 분석 및 제안을 활용함.
