#主键原则：
#UUID全局唯一，缺点是占用空间，去掉中划线后，剩余32个字节；大表1000万数据，按照一行多出100Byte计算，则多出1G数据；
#若是InnoDB引擎，因为其是索引组织表，创建的每个非簇索引，都会带上主键，这样占用存储空间更大，需要消耗更多内存和IO；
#自增，是可以手工指定值的，而且对于任何修改自增列的情况会导致自增列的计数器增长，可能会因为这些问题在主备、主从机制产生破坏性影响，优点是：空间和性能略高；
#自定义主键，比如订单号，商品编号，用程序保证唯一性，比如每次增加一个随机数；
#故我们的规则是：常被使用的基础数据表，比如品牌、分类等，就用自增ID，对于业务表，比如商品、订单，就用升序生成的编号、单据号
#参考：
#http://www.cnblogs.com/chutianyao/archive/2012/11/04/2753995.html
#http://blog.chinaunix.net/uid-20639775-id-3154234.html

#BEGIN*************************表单列表***************************BEGIN
#. c_brand ：品牌表
#. c_category ：分类表
#. c_category_brand ：分类品牌限定表，即分类下有哪些品牌，对于品牌比较多时，品牌下拉很长，这个表方便品牌选择
#. c_prop_item ：属性项表，网站列表页中的商品查询是搜索API提供，基础数据即来源于此
#. c_prop_value ：属性值表，属性项下的值列表
#. c_category_prop_item ：分类属性项限定表，即分类下有哪些属性项
#. c_category_prop_value ：分类属性值限定表，及分类下有哪些属性值
#. c_commodity ：商品表
#. c_product ：货品表，即SKU
#. c_commodity_picture ： 商品图片表
#. c_commodity_prop ：商品属性表
#. c_commodity_log ：商品操作日志表
#. c_commodity_price_log ：调价日志表
#. c_sizechart ：尺码对照表，简称尺码表
#. c_category_brand_sizechart ：品牌尺码表限定表，即品牌下有哪些尺码表可以选择
#. c_dictionary ： 字典表，状态类型等字典数据都要存储于此，方便使用
#END***************************表单列表***************************END

#品牌表
DROP TABLE IF EXISTS `c_brand`;
CREATE TABLE `c_brand` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`name`  varchar(50) NOT NULL DEFAULT '' COMMENT '品牌名称' ,
`english_name`  varchar(50) NOT NULL DEFAULT '' COMMENT '英文名称' ,
`website`  varchar(200) NOT NULL DEFAULT '' COMMENT '品牌网址' ,
`pic_large`  varchar(100) NOT NULL DEFAULT '' COMMENT '品牌大图(140*120)' ,
`pic_middle`  varchar(100) NOT NULL DEFAULT '' COMMENT '品牌中图(110*50)' ,
`pic_small`  varchar(100) NOT NULL DEFAULT '' COMMENT '品牌小图(85*40)' ,
`letter`  char(1) NOT NULL DEFAULT '' COMMENT '归属哪个字母：A-Z' ,
`sort_no`  int(4) NOT NULL DEFAULT 0 COMMENT '排序号' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`)
)
COMMENT='品牌表'
;

#分类表
DROP TABLE IF EXISTS `c_category`;
CREATE TABLE `c_category` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`name`  varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称' ,
`struct_name`  varchar(200) NOT NULL DEFAULT '' COMMENT '中文名称的分类结构' ,
`level`  int(4) NOT NULL DEFAULT 1 COMMENT '层级：1,2,3' ,
`parent_id`  int(4) UNSIGNED NOT NULL COMMENT '父级id' ,
`sort_no`  int(4) NOT NULL DEFAULT 0 COMMENT '排序号' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`),
INDEX `idx_struct_name` (`struct_name`) USING BTREE 
)
COMMENT='分类表'
;

#品牌分类关系表
DROP TABLE IF EXISTS `c_category_brand`;
CREATE TABLE `c_category_brand` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`category_id`  int(4) UNSIGNED NOT NULL COMMENT '分类ID' ,
`brand_id`  int(4) UNSIGNED NOT NULL COMMENT '品牌ID' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_category_brand_brand_id` (`brand_id`) USING BTREE ,
INDEX `idx_category_brand_category_id` (`category_id`) USING BTREE 
)
COMMENT='品牌分类关系表'
;


#属性项表
DROP TABLE IF EXISTS `c_prop_item`;
CREATE TABLE `c_prop_item` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`name`  varchar(50) NOT NULL COMMENT '属性项名称' ,
`sort_no`  int(4) NOT NULL DEFAULT 0 COMMENT '排序号' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_prop_item_name` (`name`) USING BTREE 
)
COMMENT='属性项表'
;

#属性值表
DROP TABLE IF EXISTS `c_prop_value`;
CREATE TABLE `c_prop_value` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`name`  varchar(50) NOT NULL COMMENT '属性值名称' ,
`prop_item_id`  int(4) UNSIGNED NOT NULL COMMENT '属性项ID' ,
`sort_no`  int(4) NOT NULL DEFAULT 0 COMMENT '排序号' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_prop_value_name` (`name`) USING BTREE ,
INDEX `idx_prop_item_id` (`prop_item_id`) USING BTREE 
)
COMMENT='属性值表'
;

#分类属性项关系表
DROP TABLE IF EXISTS `c_category_prop_item`;
CREATE TABLE `c_category_prop_item` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`category_id`  int(4) UNSIGNED NOT NULL COMMENT '分类ID' ,
`prop_item_id`  int(4) UNSIGNED NOT NULL COMMENT '属性项ID' ,
`is_required`  int(4) NOT NULL DEFAULT 0 COMMENT '是否必填：1是0否' ,
`is_multiple`  int(4) NOT NULL DEFAULT 0 COMMENT '是否多选：1是0否' ,
`is_show`  int(4) NOT NULL DEFAULT 0 COMMENT '是否前台显示：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_category_id` (`category_id`) USING BTREE ,
INDEX `idx_prop_item_id` (`prop_item_id`) USING BTREE 
)
COMMENT='分类属性项关系表'
;

#分类属性值关系表
DROP TABLE IF EXISTS `c_category_prop_value`;
CREATE TABLE `c_category_prop_value` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`category_id`  int(4) UNSIGNED NOT NULL COMMENT '分类ID' ,
`prop_value_id`  int(4) UNSIGNED NOT NULL COMMENT '属性值ID' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_category_id` (`category_id`) USING BTREE ,
INDEX `idx_prop_value_id` (`prop_value_id`) USING BTREE 
)
COMMENT='分类属性值关系表'
;

#商品表
DROP TABLE IF EXISTS `c_commodity`;
CREATE TABLE `c_commodity` (
`no`  varchar(15) NOT NULL COMMENT '主键，商品编号' ,
`sno`  varchar(50) NOT NULL COMMENT '供应商款色编码，一般是款号+颜色，供应商方对商品的标记' ,
`style_no`  varchar(30) NOT NULL COMMENT '供应商款号，用来标记一款商品' ,
`name`  varchar(200) NOT NULL COMMENT '商品名称' ,
`brand_id`  int(4) UNSIGNED NOT NULL COMMENT '所属品牌ID' ,
`category_id`  int(4) UNSIGNED NOT NULL COMMENT '所属分类ID' ,
`supplier_id`  int(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属供应商ID' ,
`sizechart_id`  int(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属尺码对照表ID' ,
`color`  varchar(50) NOT NULL COMMENT '商品颜色' ,
`pic_color`  varchar(200) NOT NULL DEFAULT '' COMMENT '商品颜色图' ,
`pic_ver`  int(4) NOT NULL DEFAULT 0 COMMENT '图片版本号，操作一次，版本+1，方便清理CDN缓存' ,
`cost_price`  decimal(20,3) NOT NULL DEFAULT 0 COMMENT '成本价' ,
`sale_price`  decimal(20,3) NOT NULL DEFAULT 0 COMMENT '销售价' ,
`market_price`  decimal(20,3) NOT NULL DEFAULT 0 COMMENT '市场价' ,
`status`  int(4) NOT NULL DEFAULT 0 COMMENT '状态：1.新建（待进货）、2.待售（入库后）、3.上架（在售）、4.下架（停售），将来有审核的话用-状态' ,
`pic_flag`  int(4) NOT NULL DEFAULT 0 COMMENT '图片是否上传完整，一般图片完整就是商编完成的意思：1是0否' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
`line_id`  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID，用于其它系统同步等特殊用途' ,
PRIMARY KEY (`no`) ,
INDEX `idx_commodity_supplier_id` (`supplier_id`) USING BTREE ,
INDEX `idx_commodity_brand_id` (`brand_id`) USING BTREE ,
INDEX `idx_commodity_category_id` (`category_id`) USING BTREE ,
INDEX `idx_commodity_line_id` (`line_id`) USING BTREE 
)
COMMENT='商品表'
;

#货品表
DROP TABLE IF EXISTS `c_product`;
CREATE TABLE `c_product` (
`no`  varchar(20) NOT NULL COMMENT '主键，货品编号' ,
`commodity_no`  varchar(15) NOT NULL COMMENT '商品编号' ,
`barcode`  varchar(30) NOT NULL COMMENT '条形码' ,
`size`  varchar(30) NOT NULL COMMENT '尺码' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`no`) ,
INDEX `idx_product_barcode` (`barcode`) USING BTREE ,
INDEX `idx_product_size` (`size`) USING BTREE 
)
COMMENT='货品表'
;

#商品图片表
DROP TABLE IF EXISTS `c_commodity_picture`;
CREATE TABLE `c_commodity_picture` (
`name`  varchar(20) NOT NULL COMMENT '主键，图片名称' ,
`commodity_no`  varchar(15) NOT NULL COMMENT '商品编号' ,
`type`  char(1) NOT NULL DEFAULT 0 COMMENT '图片类型' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`name`) ,
INDEX `idx_commodity_picture_commodity_no` (`commodity_no`) USING BTREE 
)
COMMENT='商品图片表'
;

#商品属性表
DROP TABLE IF EXISTS `c_commodity_prop`;
CREATE TABLE `c_commodity_prop` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`commodity_no`  varchar(15) NOT NULL COMMENT '商品编号' ,
`prop_value_id`  int(4) UNSIGNED NOT NULL COMMENT '属性值ID' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_commodity_prop_commodity_no` (`commodity_no`) USING BTREE 
)
COMMENT='商品属性表'
;

#商品日志表
DROP TABLE IF EXISTS `c_commodity_log`;
CREATE TABLE `c_commodity_log` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`commodity_no`  varchar(15) NOT NULL COMMENT '商品编号' ,
`type`  int(4) NOT NULL DEFAULT 0 COMMENT '日志类型' ,
`remark`  varchar(500) NOT NULL DEFAULT '' COMMENT '日志描述' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_commodity_log_commodity_no` (`commodity_no`) USING BTREE 
)
COMMENT='商品日志表'
;

#商品调价日志表
DROP TABLE IF EXISTS `c_commodity_price_log`;
CREATE TABLE `c_commodity_price_log` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`commodity_no`  varchar(15) NOT NULL COMMENT '商品编号' ,
`type`  int(4) NOT NULL COMMENT '日志类型：1成本价2销售价3市场价' ,
`old_price`  decimal(20,3) NOT NULL COMMENT '原价格' ,
`new_price`  decimal(20,3) NOT NULL COMMENT '新价格' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_commodity_log_commodity_no` (`commodity_no`) USING BTREE 
)
COMMENT='商品调价日志表'
;

#商品尺码对照表
DROP TABLE IF EXISTS `c_sizechart`;
CREATE TABLE `c_sizechart` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`title`  varchar(50) NOT NULL COMMENT '名称' ,
`content`  varchar(1024) NOT NULL COMMENT '内容,JSON' ,
`remark`  varchar(100) NOT NULL DEFAULT '' COMMENT '备注' ,
`type`  int(4) NOT NULL DEFAULT 0 COMMENT '类型：1不限制2限制分类3限制品牌4限制分类和品牌' ,
`is_delete`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1是0否' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) 
)
COMMENT='商品尺码对照表'
;

#商品尺码对照表使用限制表-只有存在限制的尺码对照表才会在这个表中有数据
DROP TABLE IF EXISTS `c_sizechart_category_brand`;
CREATE TABLE `c_sizechart_category_brand` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`sizechart_id`  int(4) UNSIGNED NOT NULL COMMENT '尺码对照表ID' ,
`cat_id`  int(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '限制分类ID,0代表不限制' ,
`brand_id`  int(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '限制分类ID,0代表不限制' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`)  ,
INDEX `idx_sizechart_category_brand_sizechart_id` (`sizechart_id`) USING BTREE ,
INDEX `idx_sizechart_category_brand_cat_id` (`cat_id`) USING BTREE ,
INDEX `idx_sizechart_category_brand_brand_id` (`brand_id`) USING BTREE 
)
COMMENT='商品尺码对照表使用限制表-只有存在限制的尺码对照表才会在这个表中有数据'
;

#类型状态字典表
DROP TABLE IF EXISTS `c_dictionary`;
CREATE TABLE `c_dictionary` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`group`  varchar(50) NOT NULL COMMENT '状态分组' ,
`code`  varchar(5) NOT NULL COMMENT '状态代码' ,
`name`  varchar(100) NOT NULL COMMENT '状态名称' ,
`sort_no`  int(4) NOT NULL DEFAULT 0 COMMENT '排序号' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_dictionary_group` (`group`) USING BTREE 
)
COMMENT='类型状态字典表'
;