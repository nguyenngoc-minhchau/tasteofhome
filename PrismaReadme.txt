## Prisma Quick Start

To set up the database:

```bash
npm install
npx prisma db pull
npx prisma generate
npx prisma studio
Make sure your local MySQL database is running and that your .env file has this:

env
Copy
Edit
DATABASE_URL="mysql://root@localhost:3306/quadacsa_dacsan2025"
Add a password if your MySQL user requires one.

The database schema is defined in prisma/schema.prisma.