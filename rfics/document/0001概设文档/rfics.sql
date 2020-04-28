
DROP TABLE roles_menus_map;



DROP TABLE menus;



DROP TABLE organs_users_map;



DROP TABLE organs;



DROP TABLE users_roles_map;



DROP TABLE users;



DROP TABLE roles;



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



CREATE TABLE organs_users_map
(
	organ_user_no        INTEGER NOT NULL,
	organ_no             INTEGER NULL,
	user_no              INTEGER NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE organs_users_map
ADD PRIMARY KEY (organ_user_no);



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
	menu_no              INTEGER NULL,
	role_no              INTEGER NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE roles_menus_map
ADD PRIMARY KEY (role_menu_no);



CREATE TABLE users
(
	user_no              INTEGER NOT NULL,
	user_name            VARCHAR(100) NULL,
	login_user           VARCHAR(50) NULL,
	login_pwd            VARCHAR(50) NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE users
ADD PRIMARY KEY (user_no);



CREATE TABLE users_roles_map
(
	user_role_no         INTEGER NOT NULL,
	role_no              INTEGER NULL,
	user_no              INTEGER NULL,
	check_flag           VARCHAR(20) NULL,
	create_time          TIMESTAMP NULL,
	update_time          TIMESTAMP NULL,
	remark               VARCHAR(200) NULL
);



ALTER TABLE users_roles_map
ADD PRIMARY KEY (user_role_no);



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
      
alter TABLE organs_users_map COMMENT = '机构用户映射表'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE organs_users_map MODIFY COLUMN  `organ_user_no` INTEGER NOT NULL COMMENT '机构用户编号';
      ALTER TABLE organs_users_map MODIFY COLUMN  `organ_no` INTEGER NULL COMMENT '机构编号';
      ALTER TABLE organs_users_map MODIFY COLUMN  `user_no` INTEGER NULL COMMENT '用户编号';
      ALTER TABLE organs_users_map MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE organs_users_map MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE organs_users_map MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE organs_users_map MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
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
      ALTER TABLE users MODIFY COLUMN  `user_name` VARCHAR(100) NULL COMMENT '用户名称';
      ALTER TABLE users MODIFY COLUMN  `login_user` VARCHAR(50) NULL COMMENT '登陆用户';
      ALTER TABLE users MODIFY COLUMN  `login_pwd` VARCHAR(50) NULL COMMENT '登陆密码';
      ALTER TABLE users MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE users MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE users MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE users MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      
alter TABLE users_roles_map COMMENT = '用户角色映射表'  ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
    ALTER TABLE users_roles_map MODIFY COLUMN  `user_role_no` INTEGER NOT NULL COMMENT '用户角色编号';
      ALTER TABLE users_roles_map MODIFY COLUMN  `role_no` INTEGER NULL COMMENT '角色编号';
      ALTER TABLE users_roles_map MODIFY COLUMN  `user_no` INTEGER NULL COMMENT '用户编号';
      ALTER TABLE users_roles_map MODIFY COLUMN  `check_flag` VARCHAR(20) NULL COMMENT '检查标识';
      ALTER TABLE users_roles_map MODIFY COLUMN  `create_time` TIMESTAMP NULL COMMENT '创建时间';
      ALTER TABLE users_roles_map MODIFY COLUMN  `update_time` TIMESTAMP NULL COMMENT '更新时间';
      ALTER TABLE users_roles_map MODIFY COLUMN  `remark` VARCHAR(200) NULL COMMENT '备注';
      

