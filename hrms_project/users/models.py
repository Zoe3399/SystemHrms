from django.db import models # type: ignore

class User(models.Model):
    emp_no = models.CharField(max_length=255, unique=True)
    name = models.CharField(max_length=255)
    email = models.EmailField()
    password = models.CharField(max_length=255)
    department_id = models.IntegerField()
    position_id = models.IntegerField()
    role = models.CharField(max_length=10, choices=[('user', 'User'), ('admin', 'Admin')])
    status = models.CharField(max_length=10, choices=[('재직', 'Active'), ('퇴사', 'Resigned')])
    entry_date = models.DateField()
    leave_date = models.DateField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)