
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
	black_list_no        INTEGER NOT NULL,
	veh_no               INTEGER NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE black_list
ADD PRIMARY KEY (black_list_no);



CREATE TABLE check_station
(
	check_station_no     INTEGER NOT NULL,
	check_station_name   VARCHAR(50) NULL,
	belong_region        VARCHAR(50) NULL,
	belong_traffic_line  VARCHAR(50) NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE check_station
ADD PRIMARY KEY (check_station_no);



CREATE TABLE check_station_restrect_map
(
	check_station_no     INTEGER NULL,
	restrict_no          INTEGER NULL,
	check_station_restrict_no INTEGER NOT NULL,
	direction            VARCHAR(2) NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE check_station_restrect_map
ADD PRIMARY KEY (check_station_restrict_no);



CREATE UNIQUE INDEX unique_index_check_station_restrect_map_1 ON check_station_restrect_map
(
	check_station_no,
	restrict_no,
	direction
);



CREATE TABLE menus
(
	menu_no              INTEGER NOT NULL,
	menu_name            VARCHAR(100) NULL,
	menu_href            VARCHAR(200) NULL,
	parent_no            INTEGER NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE menus
ADD PRIMARY KEY (menu_no);



CREATE TABLE organs
(
	organ_no             INTEGER NOT NULL,
	organ_name           VARCHAR(100) NULL,
	parent_no            INTEGER NULL,
	organ_desc           VARCHAR(200) NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE organs
ADD PRIMARY KEY (organ_no);



CREATE TABLE restrict_equip
(
	restrict_no          INTEGER NOT NULL,
	restrict_name        VARCHAR(200) NULL,
	restrict_station_no  VARCHAR(50) NULL,
	restrict_station_name VARCHAR(200) NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE restrict_equip
ADD PRIMARY KEY (restrict_no);



CREATE TABLE restrict_oper_log
(
	oper_no              CHAR(18) NOT NULL,
	oper_command         VARCHAR(200) NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL,
	restrict_no          INTEGER NULL,
	veh_no               INTEGER NULL,
	user_no              INTEGER NULL,
	oper_command_desc    VARCHAR(200) NULL
);



ALTER TABLE restrict_oper_log
ADD PRIMARY KEY (oper_no);



CREATE TABLE roles
(
	role_no              INTEGER NOT NULL,
	role_name            VARCHAR(100) NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE roles
ADD PRIMARY KEY (role_no);



CREATE TABLE roles_menus_map
(
	role_menu_no         INTEGER NOT NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL,
	menu_no              INTEGER NULL,
	role_no              INTEGER NULL
);



ALTER TABLE roles_menus_map
ADD PRIMARY KEY (role_menu_no);



CREATE TABLE tokens
(
	token_no             INTEGER NOT NULL,
	token                VARCHAR(50) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL,
	check_flag           VARCHAR(20) NULL,
	login_user           VARCHAR(50) NULL
);



ALTER TABLE tokens
ADD PRIMARY KEY (token_no);



CREATE TABLE users
(
	user_no              INTEGER NOT NULL,
	user_name            VARCHAR(100) NULL,
	login_user           VARCHAR(50) NULL,
	login_pwd            VARCHAR(50) NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL,
	organ_no             INTEGER NULL,
	role_no              INTEGER NULL
);



ALTER TABLE users
ADD PRIMARY KEY (user_no);



CREATE UNIQUE INDEX unique_index_users_login_user ON users
(
	login_user
);



CREATE TABLE vehicals
(
	veh_no               INTEGER NOT NULL,
	preview_check_no     VARCHAR(50) NULL,
	check_time           TIMESTAMP NULL,
	check_station_no     INTEGER NULL,
	truck_no             VARCHAR(50) NULL,
	axis_num             VARCHAR(20) NULL,
	speed                VARCHAR(20) NULL,
	total_weight         VARCHAR(20) NULL,
	over_limited         VARCHAR(20) NULL,
	over_rate            VARCHAR(20) NULL,
	weight_limited       VARCHAR(20) NULL,
	direction            VARCHAR(2) NULL,
	length               VARCHAR(10) NULL,
	width                VARCHAR(10) NULL,
	height               VARCHAR(10) NULL,
	over_length          VARCHAR(10) NULL,
	over_width           VARCHAR(10) NULL,
	over_height          VARCHAR(10) NULL,
	org_code             VARCHAR(20) NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL,
	traffic_direction    VARCHAR(200) NULL
);



ALTER TABLE vehicals
ADD PRIMARY KEY (veh_no);



CREATE TABLE write_list
(
	write_list_no        INTEGER NOT NULL,
	veh_no               INTEGER NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE write_list
ADD PRIMARY KEY (write_list_no);


alter TABLE black_list COMMENT = '����������'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE black_list MODIFY COLUMN  `black_list_no` INTEGER NOT NULL COMMENT '�������������';
      ALTER TABLE black_list MODIFY COLUMN  `veh_no` INTEGER NULL COMMENT '�������';
      ALTER TABLE black_list MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE black_list MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE black_list MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE black_list MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE check_station COMMENT = '���վ��'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE check_station MODIFY COLUMN  `check_station_no` INTEGER NOT NULL COMMENT '���վ��';
      ALTER TABLE check_station MODIFY COLUMN  `check_station_name` VARCHAR(50) NULL COMMENT '���վ��';
      ALTER TABLE check_station MODIFY COLUMN  `belong_region` VARCHAR(50) NULL COMMENT '������������';
      ALTER TABLE check_station MODIFY COLUMN  `belong_traffic_line` VARCHAR(50) NULL COMMENT '������·';
      ALTER TABLE check_station MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE check_station MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE check_station MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE check_station MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE check_station_restrect_map COMMENT = '���վ�����мܵ�ӳ���'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE check_station_restrect_map MODIFY COLUMN  `check_station_restrict_no` INTEGER NOT NULL COMMENT '���վ�����мܵ�ӳ����';
      ALTER TABLE check_station_restrect_map MODIFY COLUMN  `check_station_no` INTEGER NULL COMMENT '���վ��';
      ALTER TABLE check_station_restrect_map MODIFY COLUMN  `restrict_no` INTEGER NULL COMMENT '���мܱ��';
      ALTER TABLE check_station_restrect_map MODIFY COLUMN  `direction` VARCHAR(2) NULL COMMENT '����1�����򱱣�2�������ϣ�3����������4�����򶫣�';
      ALTER TABLE check_station_restrect_map MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE check_station_restrect_map MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE check_station_restrect_map MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE check_station_restrect_map MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE menus COMMENT = '�˵���'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE menus MODIFY COLUMN  `menu_no` INTEGER NOT NULL COMMENT '�˵����';
      ALTER TABLE menus MODIFY COLUMN  `menu_name` VARCHAR(100) NULL COMMENT '�˵�����';
      ALTER TABLE menus MODIFY COLUMN  `menu_href` VARCHAR(200) NULL COMMENT '�˵�����';
      ALTER TABLE menus MODIFY COLUMN  `parent_no` INTEGER NULL COMMENT '���ڵ�';
      ALTER TABLE menus MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE menus MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE menus MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE menus MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE organs COMMENT = '������'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE organs MODIFY COLUMN  `organ_no` INTEGER NOT NULL COMMENT '�������';
      ALTER TABLE organs MODIFY COLUMN  `organ_name` VARCHAR(100) NULL COMMENT '��������';
      ALTER TABLE organs MODIFY COLUMN  `parent_no` INTEGER NULL COMMENT '���ڵ�';
      ALTER TABLE organs MODIFY COLUMN  `organ_desc` VARCHAR(200) NULL COMMENT '��������';
      ALTER TABLE organs MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE organs MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE organs MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE organs MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE restrict_equip COMMENT = '���м��豸'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE restrict_equip MODIFY COLUMN  `restrict_no` INTEGER NOT NULL COMMENT '���мܱ��';
      ALTER TABLE restrict_equip MODIFY COLUMN  `restrict_name` VARCHAR(200) NULL COMMENT '���м�����';
      ALTER TABLE restrict_equip MODIFY COLUMN  `restrict_station_no` VARCHAR(50) NULL COMMENT '����վ��';
      ALTER TABLE restrict_equip MODIFY COLUMN  `restrict_station_name` VARCHAR(200) NULL COMMENT '���м�վ��';
      ALTER TABLE restrict_equip MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE restrict_equip MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE restrict_equip MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE restrict_equip MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE restrict_oper_log COMMENT = '���мܲ�����¼��־'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE restrict_oper_log MODIFY COLUMN  `oper_no` CHAR(18) NOT NULL COMMENT '���мܲ�����¼���';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `restrict_no` INTEGER NULL COMMENT '���мܱ��';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `veh_no` INTEGER NULL COMMENT '�������';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `user_no` INTEGER NULL COMMENT '�û����';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `oper_command` VARCHAR(200) NULL COMMENT '����ָ��';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `oper_command_desc` VARCHAR(200) NULL COMMENT '����ָ������';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE roles COMMENT = '��ɫ��'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE roles MODIFY COLUMN  `role_no` INTEGER NOT NULL COMMENT '��ɫ���';
      ALTER TABLE roles MODIFY COLUMN  `role_name` VARCHAR(100) NULL COMMENT '��ɫ����';
      ALTER TABLE roles MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE roles MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE roles MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE roles MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE roles_menus_map COMMENT = '��ɫ�˵�ӳ���'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE roles_menus_map MODIFY COLUMN  `role_menu_no` INTEGER NOT NULL COMMENT '��ɫ�˵����';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `menu_no` INTEGER NULL COMMENT '�˵����';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `role_no` INTEGER NULL COMMENT '��ɫ���';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE tokens COMMENT = '�û����Ʊ�'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE tokens MODIFY COLUMN  `token_no` INTEGER NOT NULL COMMENT '���Ʊ��';
      ALTER TABLE tokens MODIFY COLUMN  `login_user` VARCHAR(50) NULL COMMENT '��½�û�';
      ALTER TABLE tokens MODIFY COLUMN  `token` VARCHAR(50) NULL COMMENT '����';
      ALTER TABLE tokens MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE tokens MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE tokens MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE tokens MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE users COMMENT = '�û���'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE users MODIFY COLUMN  `user_no` INTEGER NOT NULL COMMENT '�û����';
      ALTER TABLE users MODIFY COLUMN  `organ_no` INTEGER NULL COMMENT '�������';
      ALTER TABLE users MODIFY COLUMN  `role_no` INTEGER NULL COMMENT '��ɫ���';
      ALTER TABLE users MODIFY COLUMN  `user_name` VARCHAR(100) NULL COMMENT '�û�����';
      ALTER TABLE users MODIFY COLUMN  `login_user` VARCHAR(50) NULL COMMENT '��½�û�';
      ALTER TABLE users MODIFY COLUMN  `login_pwd` VARCHAR(50) NULL COMMENT '��½����';
      ALTER TABLE users MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE users MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE users MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE users MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE vehicals COMMENT = '������'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE vehicals MODIFY COLUMN  `veh_no` INTEGER NOT NULL COMMENT '�������';
      ALTER TABLE vehicals MODIFY COLUMN  `preview_check_no` VARCHAR(50) NULL COMMENT 'Ԥ�����';
      ALTER TABLE vehicals MODIFY COLUMN  `check_time` TIMESTAMP NULL COMMENT '���ʱ��';
      ALTER TABLE vehicals MODIFY COLUMN  `check_station_no` INTEGER NULL COMMENT '���վ��';
      ALTER TABLE vehicals MODIFY COLUMN  `truck_no` VARCHAR(50) NULL COMMENT '�����ƺ�';
      ALTER TABLE vehicals MODIFY COLUMN  `axis_num` VARCHAR(20) NULL COMMENT '����';
      ALTER TABLE vehicals MODIFY COLUMN  `speed` VARCHAR(20) NULL COMMENT '����';
      ALTER TABLE vehicals MODIFY COLUMN  `total_weight` VARCHAR(20) NULL COMMENT '���أ�kg��';
      ALTER TABLE vehicals MODIFY COLUMN  `over_limited` VARCHAR(20) NULL COMMENT '��������kg��';
      ALTER TABLE vehicals MODIFY COLUMN  `over_rate` VARCHAR(20) NULL COMMENT '�����ʣ���λ%��������/�������أ�*100��';
      ALTER TABLE vehicals MODIFY COLUMN  `weight_limited` VARCHAR(20) NULL COMMENT '�������أ�kg��';
      ALTER TABLE vehicals MODIFY COLUMN  `direction` VARCHAR(2) NULL COMMENT '����1�����򱱣�2�������ϣ�3����������4�����򶫣�';
      ALTER TABLE vehicals MODIFY COLUMN  `traffic_direction` VARCHAR(200) NULL COMMENT '��������';
      ALTER TABLE vehicals MODIFY COLUMN  `length` VARCHAR(10) NULL COMMENT '����m��';
      ALTER TABLE vehicals MODIFY COLUMN  `width` VARCHAR(10) NULL COMMENT '��m��';
      ALTER TABLE vehicals MODIFY COLUMN  `height` VARCHAR(10) NULL COMMENT '�ߣ�m��';
      ALTER TABLE vehicals MODIFY COLUMN  `over_length` VARCHAR(10) NULL COMMENT '������';
      ALTER TABLE vehicals MODIFY COLUMN  `over_width` VARCHAR(10) NULL COMMENT '������';
      ALTER TABLE vehicals MODIFY COLUMN  `over_height` VARCHAR(10) NULL COMMENT '������';
      ALTER TABLE vehicals MODIFY COLUMN  `org_code` VARCHAR(20) NULL COMMENT '�������루��������ͼ��վ�ţ�ʵʩ��ʱ��̶����䣩';
      ALTER TABLE vehicals MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE vehicals MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE vehicals MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE vehicals MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
alter TABLE write_list COMMENT = '����������'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE write_list MODIFY COLUMN  `write_list_no` INTEGER NOT NULL COMMENT '�������������';
      ALTER TABLE write_list MODIFY COLUMN  `veh_no` INTEGER NULL COMMENT '�������';
      ALTER TABLE write_list MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '����ʶ';
      ALTER TABLE write_list MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE write_list MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '����ʱ��';
      ALTER TABLE write_list MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '��ע';
      
