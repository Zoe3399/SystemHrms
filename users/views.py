# users/views.py
from django.shortcuts import render # type: ignore
from .models import User
from csv import reader

# Create your views here.
def user_list(request):
    users = User.objects.all()
    return render(request, 'users/user_list.html', {'users': users})

def import_users_from_csv(request):
    with open('path_to_your_csv_file.csv', 'r') as file:
        csv_reader = reader(file)
        next(csv_reader)  # 헤더 스킵
        for row in csv_reader:
            User.objects.create(
                emp_no=row[0],
                name=row[1],
                email=row[2],
                password=row[3],
                department_name=row[4],
                position_id=int(row[5]),
                role=row[6],
                status=row[7],
                entry_date=row[8],
                leave_date=row[9] if row[9] else None,
            )
    return render(request, 'users/import_success.html')