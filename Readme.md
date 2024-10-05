# 🗃️ Database Version Control App ( On Going )

## Tags
- **Database Management**
- **Version Control**
- **Schema Migrations**
- **Rollback & Branching**
- **Custom Scripts**
- **CI/CD Integration**

## Language
- **Python**
- **SQLAlchemy**
- **Alembic**
- **PostgreSQL/MySQL/SQLite**

The **Database Version Control App** is an ongoing project designed to manage database schema changes and version control in a manner similar to Git. It supports features like branching, merging, and rollbacks, helping teams work collaboratively on databases without conflicting changes.

## ✨ Features

- **Schema & Data Versioning**: Track and control changes made to database schemas and data.
- **Branching & Merging**: Enable parallel database development and seamlessly merge changes.
- **Rollback Capabilities**: Easily revert to previous database states when needed.
- **CI/CD Integration**: Automated database migrations that fit into development pipelines.
- **Custom Migration Scripts**: Users can create their own migration scripts for added flexibility.

> **Status**: Ongoing project with regular updates and improvements.

## 🚀 Technologies Used

- **Python**: Core language for building and scripting.
- **SQLAlchemy**: ORM for handling database connections and queries.
- **Alembic**: Tool for handling migrations.
- **Databases**: PostgreSQL | MySQL | SQLite.

## 🛠️ Project Workflow

### 1. **Install the Project on Your System**

- Clone the repository and set up the project on your local machine as described in the project setup section.
- Ensure you have the necessary dependencies installed and a compatible DBMS (PostgreSQL, MySQL, SQLite, etc.) running.

### 2. **Create a New Project for Your DBMS**

- Once the project is installed, create a new project with the database management system (DBMS) you're using.
- The system will automatically generate a repository for your database, tracking changes from the initial state.

### 3. **User & Permissions Configuration**

- You must **create a dedicated user** for the system, assigning specific permissions so that the system can read and create `.sql` files from the current database state.
  - **Security Option**: The user creation step is recommended for those who want stricter security over their database, allowing you to provide limited permissions.
  - **Admin Option**: Alternatively, if data privacy isn't a concern, or for educational use, you can give the system admin/root user credentials, making setup quicker and easier for students or casual users.

> **Note**: User creation is a mandatory part for security-conscious users, but our system also works with full admin credentials for those who prefer simplicity.

### 4. **Select Versioning Mode**

- The system provides two modes of version control for flexibility:
  - **Manual Mode**: The user is responsible for committing changes whenever they modify the database.
  - **Automatic Mode**: The system automatically monitors database changes at regular intervals and commits those changes if detected.

### 5. **Versioning Options**

- During setup, the user can choose between two versioning options:
  - **Structure Only**: Track changes made only to the database schema (table structure, indices, etc.).
  - **Structure + Data**: Track changes to both the schema and the data, allowing for full restoration of previous database states.

### 6. **Working with the System**

- After the initial setup, the user can continue their regular tasks without worrying about database version control. The system will track all schema and/or data changes as specified.
- **Version History**: At any time, the user can view the current version or revert to any past version via the interface, similar to how GitHub provides version history and commit logs for code.

> In essence, our system acts as **Git** for databases, and users can interact with it just like they would interact with **GitHub** for version control, with full visibility of changes and the ability to manage versions of their database seamlessly.

## 🚀 Usage

### 1. **Initialize Database Versioning**

```bash
python main.py init
```

### 2. **Commit Changes**

After making database schema changes, commit them:

```bash
python main.py commit -m "Your commit message"
```

### 3. **Checkout to a Specific Version**

```bash
python main.py checkout <version_number>
```

### 4. **Create a Branch**

```bash
python main.py branch <branch_name>
```

### 5. **Merge Changes**

```bash
python main.py merge <branch_name>
```

## 📸 Demo UI

### Screenshots:

**1. Versioning Workflow Example:**

![Versioning Workflow](https://your-cdn-link.com/your-graphic-versioning.jpg)

**2. Branching & Merging Example:**

![Branching and Merging](https://your-cdn-link.com/branching-merging.jpg)

**3. Rollback Execution Example:**

![Rollback](https://your-cdn-link.com/rollback.jpg)

---

## 📊 Application Flow

```mermaid
graph TD;
    A[Install the Project on the System] --> B[Create a Project with DBMS];
    B --> C[Create a User for Permissions];
    C --> D{Select Versioning Mode};
    D --> D1[Manual Mode: User Commits Changes];
    D --> D2[Automatic Mode: System Commits Changes Automatically];
    D1 --> E{Choose Versioning Option};
    D2 --> E;
    E --> E1[Structure Only];
    E --> E2[Structure + Data];
    E1 --> F[Continue Working & Monitor Versions];
    E2 --> F;
    F --> G[Check & Interact with Current or Past Versions];
    G --> H[Database Version Control Complete];

```

1. User commits schema/data changes.
2. Migration scripts are applied to the database.
3. Changes can be merged or branched into new versions.
4. Rollback allows reverting to previous stable versions.

---

## 📐 Design and UI

The interface is minimalistic, focusing on functionality and clear workflows. Below is a basic layout preview of the system:

```
+------------------------------------------------+
|               Database Versioning              |
|                                                |
|  [Commit Changes]                             |
|  [Branch Management]                          |
|  [Rollback to Previous Version]               |
+------------------------------------------------+
```

Tailwind CSS is used for sleek styling and responsive design. Additional UI features are planned for upcoming updates.

---

## 🧩 Future Improvements

- **NoSQL Support**: Add support for NoSQL databases like MongoDB.
- **Conflict Resolution**: Enhance conflict resolution during merging.
- **UI Development**: Develop a web-based interface for easier usage.
- **Performance Optimizations**: Add benchmarking and tests for large datasets.

---

## ⚙️ Component Overview

### **Database Version Control Core**

The core module handles database connections, migrations, branching, and rollbacks.

#### Key Functions:
- `init`: Initialize version control for the database.
- `commit`: Commit database changes with messages.
- `checkout`: Rollback to or view a specific database version.
- `branch`: Create new branches for parallel development.
- `merge`: Merge branches without conflicts.

---

## 📦 Contributing

We welcome contributions! If you'd like to contribute, please:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request to discuss changes.

---

## 🛡️ License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

## 🙌 Acknowledgments

- **Alembic** for migration management.
- **SQLAlchemy** for ORM functionality.
- **Tailwind CSS** for styling.

---

**✨ Ongoing Project**: Stay tuned for more features and improvements!

---

Be sure to replace the placeholder links and add any screenshots or graphics as you progress. Let me know if you'd like any additional modifications!
