# Node.js LTS 버전 사용
FROM node:18

# 작업 디렉토리 설정
WORKDIR /app

# package.json과 package-lock.json 복사
COPY package*.json ./

# 의존성 설치
RUN npm install --legacy-peer-deps

# Vite 설치
RUN npm install vite --save-dev
 
# 빌드 아키텍처에 맞게 리빌드
RUN npm rebuild

# 소스 코드 복사
COPY . .

# Vite 개발 서버 포트 설정
EXPOSE 3000

# 개발 서버 실행
CMD ["npm", "run", "dev"]