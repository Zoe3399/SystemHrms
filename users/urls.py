# users/urls.py
from django.urls import path # type: ignore
from .views import import_users_from_csv, user_list

urlpatterns = [
    path('', user_list, name='user_list'),
    path('import-csv/', import_users_from_csv, name='import_users_from_csv'),
]