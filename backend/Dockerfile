# HRMS 시스템을 위한 Dockerfile
# Django + Gunicorn + MySQL 설정

# Python 3.11 slim-buster 기반 이미지 사용
FROM python:3.11-slim-buster

# 작업 디렉터리 설정
WORKDIR /app

# Python 환경 설정: 바이트코드(.pyc) 생성 방지 및 출력 버퍼링 방지
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 필수 시스템 패키지 설치 (MySQL 클라이언트 포함)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Python 의존성 파일 복사
COPY requirements.txt /app/requirements.txt

# pip 업그레이드 및 필요한 패키지 설치
RUN pip install --upgrade pip && pip install -r /app/requirements.txt

# 소스코드 전체 복사
COPY . /app

# 보안을 위한 비루트 사용자 생성 및 권한 설정
RUN adduser --disabled-password --gecos "" hrmsuser \
    && chown -R hrmsuser:hrmsuser /app

# 실행 사용자 변경
USER hrmsuser

# Django 기본 포트 노출
EXPOSE 8000

# Gunicorn을 통한 WSGI 서버 실행
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "backend.wsgi:application"]
