
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET time_zone = "+00:00";


--
-- Database: `mohStarter`
--
-- Drop might not work in phpmyadmin - run from console or remove disable drop from config
-- Drop data base if exists mohRoles;

CREATE DATABASE IF NOT EXISTS `mohRoles` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `mohRoles`;


CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));

CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(245) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
  
  CREATE TABLE roles (
  role_id int(11) NOT NULL AUTO_INCREMENT,
  role varchar(245) NOT NULL,
  PRIMARY KEY (role_id),
  UNIQUE KEY roles_role (role)
  );
  
   CREATE TABLE privilidges (
  prv_id int(11) NOT NULL AUTO_INCREMENT,
  prv varchar(245) NOT NULL,
  PRIMARY KEY (prv_id),
  UNIQUE KEY uni_privilidges_prv (prv)
  );
  

-- could be to role id & prv_id, this full role and privldge is 
-- easier to read 
  drop table if exists roles_privilidges;
  
   CREATE TABLE roles_privilidges (
  role_prv_id int(11) NOT NULL AUTO_INCREMENT,
  role varchar(245) NOT NULL, 
 prv varchar(245) NOT NULL,
  PRIMARY KEY (role_prv_id),
  UNIQUE KEY roles_privilidges_role_p (role, prv),
  CONSTRAINT fk_roles_role_fk FOREIGN KEY (role) REFERENCES roles(role),
  CONSTRAINT fk_roles_priv_fk FOREIGN KEY (prv) REFERENCES  privilidges (prv)
  );


delete from roles_privilidges where true;  

delete from privilidges where true;
delete from roles where 1=1;
delete from user_roles where true;
delete from users where 1=1;

INSERT INTO users(username,password,enabled)
VALUES ('tushar','wert', true);
INSERT INTO users(username,password,enabled)
VALUES ('alex','dada', true);

INSERT INTO roles ( role)
VALUES ( 'ROLE_ADMIN'),( 'ROLE_USER');

INSERT INTO user_roles (username, role)
VALUES ('tushar', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('tushar', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role)
VALUES ('alex', 'ROLE_USER');

insert into privilidges(prv)
values ('admin_user_add'),
 ('admin_user_edit'),
 ('admin_user_del'),
  ('user_home');


  insert into roles_privilidges (role,prv)
  values ('ROLE_ADMIN', 'admin_user_add'),
  ('ROLE_ADMIN', 'admin_user_edit'),
  ('ROLE_USER', 'user_home');