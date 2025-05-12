# 🏗️ System Architecture Documentation

The System Architecture documentation is now separated into two distinct files for better readability and management.

- [🇰🇷 Architecture (Korean Version)](./architecture_kr.md)
- [🇺🇸 Architecture (English Version)](./architecture_en.md)

Please choose the appropriate version based on your language preference.
# 🏗️ System Architecture Documentation

## Overview
HRMS (Human Resource Management System) is a comprehensive solution designed to streamline human resource processes including employee management, attendance tracking, payroll, and organizational structure management.

## Architecture Diagram
![Architecture Diagram](./assets/architecture_diagram.png)

## Technology Stack
- **Backend:** Django (Python) for robust API and database management
- **Frontend:** React.js for a dynamic and responsive user interface
- **Database:** MySQL for structured data storage and retrieval
- **Containerization:** Docker for consistent development and production environments
- **Version Control:** GitHub for source control and collaboration

## Main Components
1. **User Management**
   - Employee registration and profile management
   - Role-based access control

2. **Organization Management**
   - Department and team management
   - Organizational chart visualization

3. **Attendance Management**
   - Clock-in/out tracking
   - Absence and leave management

4. **Payroll Management**
   - Salary calculation
   - Payroll history and payslip generation

5. **Approval Workflows**
   - Leave requests and approval
   - Expense claims and validations

6. **Reporting and Analytics**
   - Real-time data analysis
   - Customizable reports

## API Documentation
Refer to the [API Documentation](./api_documentation.md) for detailed API specifications.

## Why Django?
We selected **Django** for its scalability, security, and rapid development capabilities. Django's built-in admin panel and ORM (Object Relational Mapping) allow for efficient database management and quick iteration.

## Why React?
**React.js** is used to create interactive UIs with ease. Its component-based architecture provides reusability and efficient rendering.

## Why Docker?
Docker ensures that the application runs consistently across different environments, reducing the "it works on my machine" problem.

## Why MySQL?
MySQL was chosen for its reliability and strong ACID compliance, making it ideal for transactional data in HR processes.

## Why GitHub?
GitHub facilitates version control, collaboration, and seamless code integration across development cycles.