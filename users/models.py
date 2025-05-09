# users/models.py
from django.db import models # type: ignore

class User(models.Model):
    emp_no = models.CharField(max_length=20, unique=True)
    name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    department_name = models.CharField(max_length=50)  # 수정됨
    position_name = models.CharField(max_length=50, default='직원')
    role = models.CharField(max_length=10, choices=[('user', 'User'), ('admin', 'Admin')])
    status = models.CharField(max_length=10, choices=[('재직', '재직'), ('퇴사', '퇴사')])
    entry_date = models.DateField()
    leave_date = models.DateField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name} - {self.position_name}"