# 시스템 아키텍처 (System Architecture)

<details>
<summary>개요 (Overview)</summary>

## 개요 (Overview)
HRMS(Human Resource Management System)는 인사 관리, 근태 관리, 급여 관리, 조직 관리 등 인사 관련 모든 업무를 효과적으로 처리하기 위한 웹 애플리케이션입니다. Django와 React를 기반으로 설계되었으며, 명확한 역할 분담과 확장성을 고려한 구조로 개발되었습니다.

</details>
<details>
<summary>기술 스택 (Technology Stack)</summary>

## 기술 스택 (Technology Stack)
- **Backend:** Django (DRF)
- **Frontend:** React (TypeScript, TailwindCSS)
- **Database:** MySQL
- **Version Control:** Git (GitHub Desktop)
- **Containerization:** Docker
- **CI/CD:** GitHub Actions
- **Monitoring & Logging:** Sentry, ELK Stack
- **Infrastructure:** Local development, planned expansion to AWS or similar

</details>
<details>
<summary>시스템 구성 (System Components)</summary>

## 시스템 구성 (System Components)
1. **Web Server (Django)**  
   - API 개발 및 데이터베이스와의 상호작용을 담당합니다.  
   - Django REST Framework를 사용하여 RESTful API를 제공합니다.

2. **Frontend (React)**  
   - 사용자 인터페이스를 담당하며, React와 TypeScript를 기반으로 구축되었습니다.  
   - TailwindCSS를 사용하여 반응형 디자인을 제공합니다.

3. **Database (MySQL)**  
   - 인사 정보, 근태 내역, 급여 정보 등을 저장합니다.  
   - 확장성을 고려한 정규화와 관계형 모델링이 적용되었습니다.

4. **Containerization (Docker)**  
   - 개발 환경의 일관성을 유지하고, 배포 시 환경 문제를 최소화합니다.  
   - Backend, Frontend, Database를 Docker Compose로 관리합니다.

5. **CI/CD (GitHub Actions)**  
   - 코드 푸시 시 자동 빌드 및 테스트가 실행됩니다.  
   - 메인 브랜치에 Merge 시 자동 배포가 진행됩니다.

6. **Monitoring & Logging (Sentry, ELK)**  
   - Sentry를 통해 에러 모니터링을 실시간으로 확인합니다.  
   - ELK Stack을 통해 로그를 수집하고 분석합니다.

</details>
<details>
<summary>아키텍처 다이어그램 (Architecture Diagram)</summary>

## 아키텍처 다이어그램 (Architecture Diagram)
(여기에 다이어그램 이미지가 삽입될 예정입니다.)

</details>
<details>
<summary>데이터베이스 모델링 (Database Modeling)</summary>

## 데이터베이스 모델링 (Database Modeling)
- 직원 정보 (Employee)  
- 조직 정보 (Organization)  
- 근태 관리 (Attendance)  
- 급여 관리 (Payroll)  
- 사용자 권한 (User Roles)

</details>
<details>
<summary>보안 및 인증 (Security & Authentication)</summary>

## 보안 및 인증 (Security & Authentication)
- JWT (JSON Web Token)를 활용한 인증 처리  
- 모든 API 엔드포인트에 대한 인증 및 권한 검사  
- Password encryption using Bcrypt

</details>
<details>
<summary>확장 계획 (Future Expansion)</summary>

## 확장 계획 (Future Expansion)
- 클라우드 인프라로의 확장 (AWS, GCP, Azure 중 선택)  
- Multi-tenancy structure application  
- Mobile application development (React Native)

</details>