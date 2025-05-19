# Todo
---

````markdown
# Elm App (with Hot Reload via Docker)

This project runs an Elm development environment with hot reloading using `elm-live` inside Docker.

## 📦 Prerequisites

- Docker
- Docker Compose

## 🚀 Getting Started

1. Clone this repository:

   ```sh
   git clone <your-repo-url>
   cd <project-folder>
````

2. Start the Elm dev server:

   ```sh
   docker-compose up --build
   ```

3. Open your browser at [http://localhost:8000](http://localhost:8000)

   You should see your Elm app running with hot reloading enabled.

## 🧾 Project Structure

```
.
├── Dockerfile
├── docker-compose.yml
├── index.html         # Entry HTML file
├── elm.json           # Elm project file
└── src/
    └── Main.elm       # Your Elm source code
```

## 🛠 Common Commands

* Rebuild the container after changes to the Dockerfile:

  ```sh
  docker-compose up --build
  ```

* Stop the server:

  ```sh
  Ctrl+C
  ```

* Remove the container:

  ```sh
  docker-compose down
  ```

