DROP TABLE IF EXISTS club;

CREATE TABLE club (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT

);

INSERT INTO club (title , body) VALUES ('club 1' , 'Body text 1');
INSERT INTO club (title , body) VALUES ('club 2' , 'Body text 2');
INSERT INTO club (title , body) VALUES ('club 3' , 'Body text 3');
INSERT INTO club (title , body) VALUES ('club 4' , 'Body text 4');
