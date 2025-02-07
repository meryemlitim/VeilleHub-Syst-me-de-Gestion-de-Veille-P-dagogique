create database veille_db;
use veille_db;



-- user
create table users{
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('student','teacher') NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
}

-- student
create table student{
   student_id INT PRIMARY KEY,
   status ENUM('blocked','unblocked') DEFAULT 'unblocked',
   FOREIGN KEY (student_id) REFERENCES users(id_user) ON DELETE CASCADE
}

-- teacher
create table teacher{      
   teacher_id INT PRIMARY KEY,
   FOREIGN KEY (teacher_id) REFERENCES users(id_user) ON DELETE CASCADE
} 

-- topic
create table topic{
    topic_id INT AUTO_INCREMENT PRIMARY KEY,
    topic_content text NOT NULL,
    topic_year INT,
    topic_month INT,
    topic_day INT,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP      
}

create table topic_student{ 
    student_id INT NOT NULL,
    topic_id INT NOT NULL,
    PRIMARY KEY (student_id,topic_id),
    FOREIGN key (student_id) REFERENCES student(student_id) ON DELETE CASCADE,
    FOREIGN key (topic_id) REFERENCES topic(topic_id) ON DELETE CASCADE,
}


