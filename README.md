🏋️ Gym Management System
A web-based Gym Management System being developed as an FYP project to manage gym members, profiles, roles, and administrative operations.
🚀 Project Status
Week 1 Progress: Day 1 & Day 2 Completed
Day 1 — Project Foundation
Set up React 19 + Vite
Configured Tailwind CSS v4
Integrated Supabase JavaScript Client
Added TanStack Query
Created initial project folder structure
Created Supabase client configuration
Added .env.example
Added .gitignore
Created initial application/home page
Prepared project for GitHub version control
Day 2 — Database & Security
Created profiles database table
Created members database table
Added user roles
Added member management fields
Created PostgreSQL migrations
Added Row Level Security (RLS)
Added CRUD policies for profiles and members
Prepared admin seed data
Added sample member data
Organized database policies and migrations
🛠️ Technologies Used
React 19
Vite
Tailwind CSS v4
JavaScript
Supabase
PostgreSQL
TanStack Query
Git & GitHub
📁 Current Project Structure
gym-management-system/
│
├── src/
│   ├── lib/
│   └── pages/
│
├── supabase/
│   ├── migrations/
│   │   ├── 0001_create_profiles.sql
│   │   └── 0002_create_members.sql
│   │
│   ├── policies/
│   │   └── 0001_profiles_members_rls.sql
│   │
│   └── seed_admin.sql
│
├── .env.example
├── .gitignore
├── package.json
├── vite.config.js
└── README.md
