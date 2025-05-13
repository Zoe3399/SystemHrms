# Python 3.11 slim 기반 이미지 사용 (경량화 및 빠른 빌드 속도)
FROM python:3.11-slim

# 작업 디렉터리 설정
WORKDIR /app

# Python 환경 설정: 바이트코드(.pyc) 생성 방지 및 출력 버퍼링 방지
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 시스템 의존성 설치 (MySQL client 등)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# 의존성 파일 복사 후 설치
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# 소스코드 복사
COPY . /app

# 컨테이너 포트 설정 (Django 기본 포트 8000 사용)
EXPOSE 8000

# 비루트 사용자 생성 (보안 강화)
RUN adduser --disabled-password --gecos "" appuser \
    && chown -R appuser /app

USER appuser

# Django 서버 실행
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "backend.wsgi:application"]
