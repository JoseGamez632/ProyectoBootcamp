CREATE DATABASE todo_proyecto;

USE todo_proyecto;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255)
);

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todos_id INT,
    user_id INT,
    shared_whith_id INT,
    FOREIGN KEY (todos_id) REFERENCES todos(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (shared_whith_id) REFERENCES user(id)
);

INSERT INTO user (name, email, password) VALUES('Beto', 'user1@ejempleo.com', 'contrasena1');
INSERT INTO user (name, email, password) VALUES('Alberto', 'user2@ejempleo.com', 'contrasena2');

INSERT INTO todos (title, user_id)
VALUES
("Realizar inventario 🗃️ en archivo octubre", 1),
("Compra de suministros agosto 🖋️🖋️📒📚", 1),
("Revision archivos 🗃️ 1002300", 1),
("👨‍🎓👩‍🎓 Cronograma aprendices octubre 2024 👨‍🎓👩‍🎓", 1),
("🎂🎂 Cumpleanos Maria Agurre antes de 31 oct 🎂🎂", 1),
("🧑‍⚕️🫂Cronograma bienestar octubre 2024🧑‍⚕️", 1),
("🏖️🏖️ Cronograma vacaciones octubre 2024 🏖️🏖️", 1);


INSERT INTO shared_todos (todos_id, user_id, shared_whith_id)
VALUES
(1, 1, 2);

SELECT todos.*, shared_todos.shared_whith_id
FROM todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todos_id
WHERE todos.user_id = [user_id] OR shared_todos.shared_whith_id = [user_id];