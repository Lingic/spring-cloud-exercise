
DROP TABLE IF EXISTS black_list;
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


DROP TABLE IF EXISTS menus;
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


DROP TABLE IF EXISTS organs;
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


DROP TABLE IF EXISTS restrict_equip;
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


DROP TABLE IF EXISTS restrict_oper_log;
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


DROP TABLE IF EXISTS roles;
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


DROP TABLE IF EXISTS roles_menus_map;
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


DROP TABLE IF EXISTS users;
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


DROP TABLE IF EXISTS vehical;
CREATE TABLE vehical
(
	veh_no               INTEGER NOT NULL,
	preview_check_no     VARCHAR(50) NULL,
	check_time           TIMESTAMP NULL,
	check_station_no     VARCHAR(50) NULL,
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
	check_station_name   VARCHAR(200) NULL,
	traffic_direction    VARCHAR(200) NULL
);



ALTER TABLE vehical
ADD PRIMARY KEY (veh_no);


DROP TABLE IF EXISTS write_list;
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



ALTER TABLE black_list
ADD FOREIGN KEY R_18 (veh_no) REFERENCES vehical (veh_no);



ALTER TABLE restrict_oper_log
ADD FOREIGN KEY R_16 (restrict_no) REFERENCES restrict_equip (restrict_no);



ALTER TABLE restrict_oper_log
ADD FOREIGN KEY R_19 (veh_no) REFERENCES vehical (veh_no);



ALTER TABLE restrict_oper_log
ADD FOREIGN KEY R_20 (user_no) REFERENCES users (user_no);



ALTER TABLE roles_menus_map
ADD FOREIGN KEY R_7 (menu_no) REFERENCES menus (menu_no);



ALTER TABLE roles_menus_map
ADD FOREIGN KEY R_8 (role_no) REFERENCES roles (role_no);



ALTER TABLE users
ADD FOREIGN KEY R_14 (organ_no) REFERENCES organs (organ_no);



ALTER TABLE users
ADD FOREIGN KEY R_15 (role_no) REFERENCES roles (role_no);



ALTER TABLE write_list
ADD FOREIGN KEY R_17 (veh_no) REFERENCES vehical (veh_no);


alter TABLE black_list COMMENT = '车辆黑名单'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE black_list MODIFY COLUMN  `black_list_no` INTEGER NOT NULL COMMENT '车辆黑名单编号';
      ALTER TABLE black_list MODIFY COLUMN  `veh_no` INTEGER NULL COMMENT '车辆编号';
      ALTER TABLE black_list MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE black_list MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE black_list MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE black_list MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE menus COMMENT = '菜单表'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE menus MODIFY COLUMN  `menu_no` INTEGER NOT NULL COMMENT '菜单编号';
      ALTER TABLE menus MODIFY COLUMN  `menu_name` VARCHAR(100) NULL COMMENT '菜单名称';
      ALTER TABLE menus MODIFY COLUMN  `menu_href` VARCHAR(200) NULL COMMENT '菜单链接';
      ALTER TABLE menus MODIFY COLUMN  `parent_no` INTEGER NULL COMMENT '父节点';
      ALTER TABLE menus MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE menus MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE menus MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE menus MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE organs COMMENT = '机构表'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE organs MODIFY COLUMN  `organ_no` INTEGER NOT NULL COMMENT '机构编号';
      ALTER TABLE organs MODIFY COLUMN  `organ_name` VARCHAR(100) NULL COMMENT '机构名称';
      ALTER TABLE organs MODIFY COLUMN  `parent_no` INTEGER NULL COMMENT '父节点';
      ALTER TABLE organs MODIFY COLUMN  `organ_desc` VARCHAR(200) NULL COMMENT '机构描述';
      ALTER TABLE organs MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE organs MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE organs MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE organs MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE restrict_equip COMMENT = '限行架设备'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE restrict_equip MODIFY COLUMN  `restrict_no` INTEGER NOT NULL COMMENT '限行架编号';
      ALTER TABLE restrict_equip MODIFY COLUMN  `restrict_name` VARCHAR(200) NULL COMMENT '限行架名称';
      ALTER TABLE restrict_equip MODIFY COLUMN  `restrict_station_no` VARCHAR(50) NULL COMMENT '限行站点';
      ALTER TABLE restrict_equip MODIFY COLUMN  `restrict_station_name` VARCHAR(200) NULL COMMENT '限行架站名';
      ALTER TABLE restrict_equip MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE restrict_equip MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE restrict_equip MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE restrict_equip MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE restrict_oper_log COMMENT = '限行架操作记录日志'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE restrict_oper_log MODIFY COLUMN  `oper_no` CHAR(18) NOT NULL COMMENT '限行架操作记录编号';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `restrict_no` INTEGER NULL COMMENT '限行架编号';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `veh_no` INTEGER NULL COMMENT '车辆编号';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `user_no` INTEGER NULL COMMENT '用户编号';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `oper_command` VARCHAR(200) NULL COMMENT '操作指令';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `oper_command_desc` VARCHAR(200) NULL COMMENT '操作指令描述';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE restrict_oper_log MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE roles COMMENT = '角色表'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE roles MODIFY COLUMN  `role_no` INTEGER NOT NULL COMMENT '角色编号';
      ALTER TABLE roles MODIFY COLUMN  `role_name` VARCHAR(100) NULL COMMENT '角色名称';
      ALTER TABLE roles MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE roles MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE roles MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE roles MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE roles_menus_map COMMENT = '角色菜单映射表'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE roles_menus_map MODIFY COLUMN  `role_menu_no` INTEGER NOT NULL COMMENT '角色菜单编号';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `menu_no` INTEGER NULL COMMENT '菜单编号';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `role_no` INTEGER NULL COMMENT '角色编号';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE roles_menus_map MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE users COMMENT = '用户表'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE users MODIFY COLUMN  `user_no` INTEGER NOT NULL COMMENT '用户编号';
      ALTER TABLE users MODIFY COLUMN  `organ_no` INTEGER NULL COMMENT '机构编号';
      ALTER TABLE users MODIFY COLUMN  `role_no` INTEGER NULL COMMENT '角色编号';
      ALTER TABLE users MODIFY COLUMN  `user_name` VARCHAR(100) NULL COMMENT '用户名称';
      ALTER TABLE users MODIFY COLUMN  `login_user` VARCHAR(50) NULL COMMENT '登陆用户';
      ALTER TABLE users MODIFY COLUMN  `login_pwd` VARCHAR(50) NULL COMMENT '登陆密码';
      ALTER TABLE users MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE users MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE users MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE users MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE vehical COMMENT = '车辆表'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE vehical MODIFY COLUMN  `veh_no` INTEGER NOT NULL COMMENT '车辆编号';
      ALTER TABLE vehical MODIFY COLUMN  `preview_check_no` VARCHAR(50) NULL COMMENT '预检序号';
      ALTER TABLE vehical MODIFY COLUMN  `check_time` TIMESTAMP NULL COMMENT '检测时间';
      ALTER TABLE vehical MODIFY COLUMN  `check_station_no` VARCHAR(50) NULL COMMENT '检测站号';
      ALTER TABLE vehical MODIFY COLUMN  `check_station_name` VARCHAR(200) NULL COMMENT '检测站名';
      ALTER TABLE vehical MODIFY COLUMN  `truck_no` VARCHAR(50) NULL COMMENT '货车牌号';
      ALTER TABLE vehical MODIFY COLUMN  `axis_num` VARCHAR(20) NULL COMMENT '轴数';
      ALTER TABLE vehical MODIFY COLUMN  `speed` VARCHAR(20) NULL COMMENT '车速';
      ALTER TABLE vehical MODIFY COLUMN  `total_weight` VARCHAR(20) NULL COMMENT '总重（kg）';
      ALTER TABLE vehical MODIFY COLUMN  `over_limited` VARCHAR(20) NULL COMMENT '超限量（kg）';
      ALTER TABLE vehical MODIFY COLUMN  `over_rate` VARCHAR(20) NULL COMMENT '超限率（单位%（超限量/车货限重）*100）';
      ALTER TABLE vehical MODIFY COLUMN  `weight_limited` VARCHAR(20) NULL COMMENT '车货限重（kg）';
      ALTER TABLE vehical MODIFY COLUMN  `direction` VARCHAR(2) NULL COMMENT '方向（1：南向北，2：北向南，3：东向西，4：西向东）';
      ALTER TABLE vehical MODIFY COLUMN  `traffic_direction` VARCHAR(200) NULL COMMENT '车流方向';
      ALTER TABLE vehical MODIFY COLUMN  `length` VARCHAR(10) NULL COMMENT '长（m）';
      ALTER TABLE vehical MODIFY COLUMN  `width` VARCHAR(10) NULL COMMENT '宽（m）';
      ALTER TABLE vehical MODIFY COLUMN  `height` VARCHAR(10) NULL COMMENT '高（m）';
      ALTER TABLE vehical MODIFY COLUMN  `over_length` VARCHAR(10) NULL COMMENT '超长量';
      ALTER TABLE vehical MODIFY COLUMN  `over_width` VARCHAR(10) NULL COMMENT '超宽量';
      ALTER TABLE vehical MODIFY COLUMN  `over_height` VARCHAR(10) NULL COMMENT '超高量';
      ALTER TABLE vehical MODIFY COLUMN  `org_code` VARCHAR(20) NULL COMMENT '机构编码（机构编码和检测站号，实施的时候固定分配）';
      ALTER TABLE vehical MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE vehical MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE vehical MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE vehical MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE write_list COMMENT = '车辆白名单'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE write_list MODIFY COLUMN  `write_list_no` INTEGER NOT NULL COMMENT '车辆白名单编号';
      ALTER TABLE write_list MODIFY COLUMN  `veh_no` INTEGER NULL COMMENT '车辆编号';
      ALTER TABLE write_list MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE write_list MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE write_list MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE write_list MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
