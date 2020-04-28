
DROP TABLE roles_menus_map;



DROP TABLE menus;



DROP TABLE restrict_oper_log;



DROP TABLE write_list;



DROP TABLE black_list;



DROP TABLE vehicals;



DROP TABLE tokens;



DROP TABLE users;



DROP TABLE roles;



DROP TABLE organs;



DROP TABLE check_station_restrect_map;



DROP TABLE restrict_equip;



DROP TABLE check_station;



CREATE TABLE black_list
(
	black_list_no        INTEGER AUTO_INCREMENT,
	veh_no               INTEGER NULL,
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (black_list_no)
) AUTO_INCREMENT = 1;



CREATE TABLE check_station
(
	check_station_no     INTEGER NOT NULL,
	check_station_name   VARCHAR(50) NULL DEFAULT '',
	belong_region        VARCHAR(50) NULL DEFAULT '',
	belong_traffic_line  VARCHAR(50) NULL DEFAULT '',
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (check_station_no)
);



CREATE TABLE check_station_restrect_map
(
	check_station_no     INTEGER NULL,
	restrict_no          INTEGER NULL,
	check_station_restrict_no INTEGER AUTO_INCREMENT,
	direction            VARCHAR(2) NULL DEFAULT '',
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (check_station_restrict_no)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX unique_index_check_station_restrect_map_1 ON check_station_restrect_map
(
	check_station_no,
	restrict_no,
	direction
);



CREATE TABLE menus
(
	menu_no              INTEGER AUTO_INCREMENT,
	menu_name            VARCHAR(100) NULL DEFAULT '',
	menu_href            VARCHAR(200) NULL DEFAULT '',
	parent_no            INTEGER NULL,
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (menu_no)
) AUTO_INCREMENT = 1;



CREATE TABLE organs
(
	organ_no             INTEGER NOT NULL,
	organ_name           VARCHAR(100) NULL DEFAULT '',
	parent_no            INTEGER NULL,
	organ_desc           VARCHAR(200) NULL DEFAULT '',
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (organ_no)
);



CREATE TABLE restrict_equip
(
	restrict_no          INTEGER AUTO_INCREMENT,
	restrict_name        VARCHAR(200) NULL,
	restrict_station_no  VARCHAR(50) NULL DEFAULT '',
	restrict_station_name VARCHAR(200) NULL DEFAULT '',
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (restrict_no)
) AUTO_INCREMENT = 1;



CREATE TABLE restrict_oper_log
(
	oper_no              INTEGER AUTO_INCREMENT,
	oper_command         VARCHAR(200) NULL DEFAULT '',
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	restrict_no          INTEGER NULL,
	veh_no               INTEGER NULL,
	user_no              INTEGER NULL,
	oper_command_desc    VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (oper_no)
) AUTO_INCREMENT = 1;



CREATE TABLE roles
(
	role_no              INTEGER AUTO_INCREMENT,
	role_name            VARCHAR(100) NULL DEFAULT '',
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (role_no)
) AUTO_INCREMENT = 1;



CREATE TABLE roles_menus_map
(
	role_menu_no         INTEGER AUTO_INCREMENT,
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	menu_no              INTEGER NULL,
	role_no              INTEGER NULL,
	PRIMARY KEY (role_menu_no)
) AUTO_INCREMENT = 1;



CREATE TABLE tokens
(
	token_no             INTEGER AUTO_INCREMENT,
	token                VARCHAR(50) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	check_flag           VARCHAR(20) NULL DEFAULT '',
	login_user           VARCHAR(50) NULL DEFAULT '',
	PRIMARY KEY (token_no)
) AUTO_INCREMENT = 1;



CREATE TABLE users
(
	user_no              INTEGER AUTO_INCREMENT,
	user_name            VARCHAR(100) NULL DEFAULT '',
	login_user           VARCHAR(50) NULL DEFAULT '',
	login_pwd            VARCHAR(50) NULL DEFAULT '',
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	organ_no             INTEGER NULL,
	role_no              INTEGER NULL,
	PRIMARY KEY (user_no)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX unique_index_users_login_user ON users
(
	login_user
);



CREATE TABLE vehicals
(
	veh_no               INTEGER AUTO_INCREMENT,
	preview_check_no     VARCHAR(50) NULL DEFAULT '',
	check_time           TIMESTAMP NULL,
	check_station_no     INTEGER NULL,
	truck_no             VARCHAR(50) NULL DEFAULT '',
	axis_num             VARCHAR(20) NULL DEFAULT '',
	speed                VARCHAR(20) NULL DEFAULT '',
	total_weight         VARCHAR(20) NULL DEFAULT '',
	over_limited         VARCHAR(20) NULL DEFAULT '',
	over_rate            VARCHAR(20) NULL DEFAULT '',
	weight_limited       VARCHAR(20) NULL DEFAULT '',
	direction            VARCHAR(2) NULL DEFAULT '',
	length               VARCHAR(10) NULL DEFAULT '',
	width                VARCHAR(10) NULL DEFAULT '',
	height               VARCHAR(10) NULL DEFAULT '',
	over_length          VARCHAR(10) NULL DEFAULT '',
	over_width           VARCHAR(10) NULL DEFAULT '',
	over_height          VARCHAR(10) NULL DEFAULT '',
	org_code             VARCHAR(20) NULL DEFAULT '',
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	traffic_direction    VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (veh_no)
) AUTO_INCREMENT = 1;



CREATE TABLE write_list
(
	write_list_no        INTEGER AUTO_INCREMENT,
	veh_no               INTEGER NULL,
	check_flag           VARCHAR(20) NULL DEFAULT '',
	create_time          TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL DEFAULT '',
	PRIMARY KEY (write_list_no)
) AUTO_INCREMENT = 1;


