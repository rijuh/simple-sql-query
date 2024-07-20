CREATE TABLE userinfo (
	id BIGSERIAL PRIMARY KEY,
	fname VARCHAR(50),
	mname VARCHAR(50),
	lname VARCHAR(50),
	age INT,
	dob DATE,
	gender VARCHAR(10),
	mobile_no NUMERIC(10, 0),
	email VARCHAR(50)
);

ALTER TABLE userinfo
ADD level VARCHAR(10);

CREATE TABLE userlogin (
	login_id SERIAL PRIMARY KEY,
	name VARCHAR(80),
	email VARCHAR(100),
	password VARCHAR(256)
);

ALTER TABLE userlogin
ADD level VARCHAR(10);

ALTER TABLE userlogin
ADD mobile_no NUMERIC(10, 0);

ALTER TABLE userlogin
ADD user_id INT REFERENCES userinfo(id);

CREATE TABLE education
(
	id SERIAL PRIMARY KEY,
	exam_name VARCHAR(15),
	yop NUMERIC(4,0),
	inst_name VARCHAR(40),
	o_marks INT,
	f_marks INT,
	user_id INT REFERENCES userinfo(id) 
);

INSERT INTO userinfo (fname, mname, lname, age, dob, gender, mobile_no, email, level) 
VALUES
    ('John', 'Michael', 'Doe', 28, '1996-05-12', 'Male', 1234567890, 'john.doe@example.com', 'Beginner'),
    ('Jane', 'Alice', 'Smith', 34, '1990-11-23', 'Female', 9876543210, 'jane.smith@example.com', 'Intermediate'),
    ('Emily', 'Rose', 'Johnson', 22, '2002-02-15', 'Female', 5551234567, 'emily.johnson@example.com', 'Advanced');

INSERT INTO userlogin (name, email, password, level, mobile_no, user_id)
VALUES
    ('John Doe', 'john.doe@example.com', 'hashedpassword1', 'Beginner', 1234567890, 1),
    ('Jane Smith', 'jane.smith@example.com', 'hashedpassword2', 'Intermediate', 9876543210, 2),
    ('Emily Johnson', 'emily.johnson@example.com', 'hashedpassword3', 'Advanced', 5551234567, 3);

INSERT INTO education (exam_name, yop, inst_name, o_marks, f_marks, user_id)
VALUES
    ('Bachelor\'s Degree', 2018, 'University A', 85, 100, 1),
    ('Master\'s Degree', 2015, 'University B', 90, 100, 2),
    ('High School Diploma', 2020, 'High School C', 95, 100, 3);
