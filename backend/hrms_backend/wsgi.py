"""
WSGI config for hrms_backend project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.2/howto/deployment/wsgi/
"""

import os
import sys
from django.core.wsgi import get_wsgi_application # type: ignore

# Backend 디렉토리 경로 추가
# Docker와 로컬 개발 환경에서의 경로를 모두 포함
# Docker 환경에서는 /app/backend가 기본 경로
# 로컬 개발 환경에서는 /app이 기본 경로
sys.path.append('/app')
sys.path.append('/app/hrms_backend')
sys.path.append('/app/backend') 

# Django 설정 모듈 지정
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "hrms_backend.settings")

# WSGI 애플리케이션 로딩
application = get_wsgi_application()
