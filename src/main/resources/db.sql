create database  library_managerment;
use  library_managerment;
CREATE TABLE books (
                       book_id INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(255) NOT NULL,
                       author VARCHAR(255) NOT NULL,
                       quantity INT DEFAULT 0,
                       date_added DATE NOT NULL ,
                       date_modified DATE
);

CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       registration_date DATE NOT NULL
);

CREATE TABLE borrowed_books (
                                id INT AUTO_INCREMENT PRIMARY KEY,
                                user_id INT NOT NULL,
                                book_id INT NOT NULL,
                                borrow_date DATE NOT NULL ,
                                return_date DATE,
                                FOREIGN KEY (user_id) REFERENCES users(user_id),
                                FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE categories (
                            category_id INT AUTO_INCREMENT PRIMARY KEY,
                            category_name VARCHAR(255) NOT NULL
);

-- Thêm vào bảng books
INSERT INTO books (title, author, quantity, date_added) VALUES
                                                            ('Harry Potter và Hòn đá Phù thủy', 'J.K. Rowling', 10, '2022-01-10'),
                                                            ('Lập trình Java căn bản', 'John Doe', 7, '2022-02-15'),
                                                            ('Hướng dẫn Python cho người mới bắt đầu', 'Jane Smith', 5, '2022-03-20'),
                                                            ('Lập trình hướng đối tượng với C++', 'David Lee', 3, '2022-04-25'),
                                                            ('Khoa học dữ liệu với R', 'Emily Chen', 8, '2022-05-30');

-- Thêm vào bảng users
INSERT INTO users (name, registration_date) VALUES
                                                ('Nguyễn Văn A', '2023-01-01'),
                                                ('Trần Thị B', '2023-02-10'),
                                                ('Lê Thị C', '2023-03-15'),
                                                ('Phạm Minh D', '2023-04-20'),
                                                ('Hoàng Tử E', '2023-05-25');

-- Thêm vào bảng borrowed_books
INSERT INTO borrowed_books (user_id, book_id, borrow_date, return_date)
VALUES
    (1, 1, '2023-06-01', '2023-06-15'),  -- Người dùng 1 mượn sách 1
    (2, 3, '2023-06-05', NULL),           -- Người dùng 2 mượn sách 3, chưa trả
    (3, 2, '2023-06-10', '2023-06-20'),   -- Người dùng 3 mượn sách 2
    (1, 4, '2023-06-15', '2023-06-30'),   -- Người dùng 1 mượn sách 4
    (4, 5, '2023-06-18', NULL);            -- Người dùng 4 mượn sách 5, chưa trả


INSERT INTO categories (category_name)
VALUES
    ('Tiểu thuyết'),
    ('Khoa học'),
    ('Công nghệ'),
    ('Giáo dục'),
    ('Lập trình');


select * from categories;
select name,title from borrowed_books
    join users on borrowed_books.user_id = users.user_id
     join books on borrowed_books.book_id = books.book_id;
select * from books;

