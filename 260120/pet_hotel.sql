CREATE SCHEMA Pet_hotel;
USE Pet_hotel;

CREATE TABLE user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  birthdate CHAR(8) NOT NULL,
  mobile_number CHAR(12) NOT NULL DEFAULT '010-',
  email VARCHAR(50) NOT NULL,
  Address_City CHAR(10)
);

CREATE TABLE rooms (
  room_id INT AUTO_INCREMENT PRIMARY KEY,
  room_type VARCHAR(45) NOT NULL,
  price DECIMAL NOT NULL,
  capacity INT NOT NULL
);

CREATE TABLE pets (
  pet_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  birthdate VARCHAR(8) NOT NULL,
  species VARCHAR(45) NOT NULL,
  user_id INT NOT NULL,
  CONSTRAINT fk_Pets_User
    FOREIGN KEY (user_id)
    REFERENCES user (id)
);

CREATE TABLE reservation (
  reservation_id INT AUTO_INCREMENT PRIMARY KEY,
  check_in_date DATE NOT NULL,
  check_in_out DATE NOT NULL,
  total_amount DECIMAL NOT NULL,
  user_id INT NOT NULL,
  rooms_room_id INT NOT NULL,
  pets_pet_id INT NOT NULL,
  CONSTRAINT fk_Reservation_User1
    FOREIGN KEY (user_id)
    REFERENCES user (id),
  CONSTRAINT fk_Reservation_Rooms1
    FOREIGN KEY (rooms_room_id)
    REFERENCES rooms (room_id),
  CONSTRAINT fk_Reservation_Pets1
    FOREIGN KEY (pets_pet_id)
    REFERENCES pets (pet_id)
);

CREATE TABLE reviews (
  reviews_id INT AUTO_INCREMENT PRIMARY KEY,
  rooms_room_id INT NOT NULL,
  user_id INT NOT NULL,
  rating DECIMAL NOT NULL,
  comment VARCHAR(500) NOT NULL,
  CONSTRAINT fk_Reviews_Rooms1
    FOREIGN KEY (rooms_room_id)
    REFERENCES rooms (room_id),
  CONSTRAINT fk_Reviews_User1
    FOREIGN KEY (user_id)
    REFERENCES user (id)
);

CREATE TABLE service (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  service_name VARCHAR(45) NOT NULL,
  Service_price DECIMAL NOT NULL,
  reservation_reservation_id INT NOT NULL,
  CONSTRAINT fk_Service_Reservation1
    FOREIGN KEY (reservation_reservation_id)
    REFERENCES reservation (reservation_id)
);