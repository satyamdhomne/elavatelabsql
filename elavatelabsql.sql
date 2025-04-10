CREATE TABLE store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    location VARCHAR(100)
);

INSERT INTO store (store_id, store_name, location) VALUES
(1, 'Downtown Store', '123 Main St'),
(2, 'Uptown Store', '456 Elm Ave');

CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255),
    phone VARCHAR(25),
    active TINYINT,
    store_id INT,
    manager_id INT,
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (manager_id) REFERENCES staff(staff_id)
);

INSERT INTO staff (staff_id, first_name, last_name, email, phone, active, store_id, manager_id) VALUES
(1, 'John', 'Doe', 'john.doe@store.com', '555-1234', 1, 1, NULL),
(2, 'Jane', 'Smith', 'jane.smith@store.com', '555-5678', 1, 1, 1),
(3, 'Emily', 'Johnson', 'emily.j@store.com', '555-8765', 0, 2, 1),
(4, 'Michael', 'Brown', 'michael.b@store.com', '555-4321', 1, 2, 3);


---SELECT first_name, last_name, email
FROM staff
WHERE active = 1
ORDER BY last_name;

-- Count of staff per store
SELECT store_id, COUNT(*) AS total_staff
FROM staff
GROUP BY store_id;

SELECT s.staff_id, s.first_name, s.last_name, st.store_name
FROM staff s
INNER JOIN store st ON s.store_id = st.store_id;

SELECT st.store_name, s.first_name, s.last_name
FROM store st
LEFT JOIN staff s ON st.store_id = s.store_id;

SELECT *
FROM staff
WHERE store_id IN (
    SELECT store_id
    FROM staff
    GROUP BY store_id
    HAVING COUNT(*) > 1
);

SELECT store_id, COUNT(*) AS num_staff
FROM staff
GROUP BY store_id;

CREATE VIEW active_staff_per_store AS
SELECT st.store_name, COUNT(s.staff_id) AS active_staff
FROM staff s
JOIN store st ON s.store_id = st.store_id
WHERE s.active = 1
GROUP BY st.store_name;
SELECT * FROM active_staff_per_store;

CREATE INDEX idx_store_id ON staff(store_id);
SHOW INDEX FROM staff;


