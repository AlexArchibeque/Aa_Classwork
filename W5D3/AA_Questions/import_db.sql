DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL, 
    lname TEXT NOT NULL
);

INSERT INTO
    users(fname, lname)
VALUES
    ('The', 'Cat'),
    ('Red', 'Hair');

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    questions(title, body, author_id)
VALUES
    ('Food?', 'Where is it human?', (SELECT id FROM users WHERE fname = 'The' AND lname = 'Cat')),
    ('Shampoo?', 'Is it in Aisle 9?', (SELECT id FROM users WHERE fname = 'Red' AND lname = 'Hair'));


CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
    question_follows(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'The' AND lname = 'Cat'), 
        (SELECT id FROM questions WHERE title = 'Food?')),
    ((SELECT id FROM users WHERE fname = 'Red' AND lname = 'Hair'), 
        (SELECT id FROM questions WHERE title = 'Shampoo?'));



CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id TEXT,
    parent_id INTEGER,
    user_id INTEGER,
    body TEXT,

    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    replies (question_id, parent_id, user_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = 'Food?'), 
        NULL,
            (SELECT id FROM users WHERE fname = 'The' AND lname = 'Cat'),
                'Coming right up.'),

    ((SELECT id FROM questions WHERE title = 'Food?'), 
        (SELECT id FROM replies WHERE body ='Coming right up.'),
            (SELECT id FROM users WHERE fname = 'The' AND lname = 'Cat'),
                'I''m still waiting'),

    ((SELECT id FROM questions WHERE title = 'Shampoo?'), 
        NULL,
            (SELECT id FROM users WHERE fname = 'Red' AND lname = 'Hair'),
                'Put on your mask.');

                -- (SELECT id FROM replies WHERE NOT NULL) << Why is this NULL?

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id TEXT,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    question_likes(user_id, question_id)
VALUES
((SELECT id FROM users WHERE fname = 'The' AND lname = 'Cat'), 
        (SELECT id FROM questions WHERE title = 'Food?')),
((SELECT id FROM users WHERE fname = 'Red' AND lname = 'Hair'), 
        (SELECT id FROM questions WHERE title = 'Shampoo?'));
