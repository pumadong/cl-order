#BEGIN*************************表单列表***************************BEGIN
#. o_order_main_form ：订单主表
#. o_order_main_detail ：订单主表明细表
#. o_order_form ：订单子表
#. o_order_detail ：订单明细表
#. o_order_payment ：订单支付表
#. o_order_promotion ：订单使用的促销(暂缓，不考虑礼品卡，促销等)
#. o_order_log ：订单日志表
#. o_accept_form ：订单退换货受理单
#. o_accept_detail ：订单退换货受理单明细
#. o_accept_log ：订单退换货受理单日志
#. w_return_form ：订单退换货入库单（wms系统建立）
#. w_return_detail ： 订单退换货入库单明细（wms系统建立）
#. o_return_payment ： 退款流水
#. o_refund_form ：退款单
#. o_refund_log ：退款单日志
#. o_dictionary ： 字典表，状态类型等字典数据都要存储于此，方便使用
#END***************************表单列表***************************END

#订单主表
DROP TABLE IF EXISTS `o_order_main_form`;
CREATE TABLE `o_order_main_form` (
`form_code`  varchar(15) NOT NULL COMMENT '订单号，主键' ,
`order_type_id`  int NOT NULL DEFAULT 0 COMMENT '销售、换货' ,
`member_id`  int NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`consignee_id`  int NOT NULL DEFAULT 0 COMMENT '收货人ID' ,
`total_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '订单总价格' ,
`goods_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '货品价格' ,
`deliver_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '运费' ,
`paid_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '已付价格' ,
`payment_type_id`  int NOT NULL DEFAULT 0 COMMENT '支付方式ID' ,
`payment_type_name`  varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式名称' ,
`payment_status`  int NOT NULL DEFAULT 0 COMMENT '支付状态' ,
`source_ref_id`  int NOT NULL DEFAULT 0 COMMENT '订单广告来源ID' ,
`source_pos_id`  int NOT NULL DEFAULT 0 COMMENT '订单站内位置ID' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`form_code`)
)
COMMENT='订单主表'
;

#订单主表明细
DROP TABLE IF EXISTS `o_order_main_detail`;
CREATE TABLE `o_order_main_detail` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`form_code`  varchar(15) NOT NULL COMMENT '订单号' ,
`commodity_no`  varchar(15) NOT NULL COMMENT '商品编号' ,
`commodity_name`  varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称' ,
`product_no`  varchar(15) NOT NULL COMMENT '货品编号' ,
`size`  varchar(30) NOT NULL DEFAULT '' COMMENT '尺码' ,
`sell_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '货品卖价' ,
`discount`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '折扣' ,
`quality`  int NOT NULL DEFAULT 0 COMMENT '购买数量' ,
`return_quality`  int NOT NULL DEFAULT 0 COMMENT '退货数量' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_order_main_detail_form_code` (`form_code`) USING BTREE 
)
COMMENT='订单主表明细'
;

#订单子表
DROP TABLE IF EXISTS `o_order_form`;
CREATE TABLE `o_order_form` (
`form_code`  varchar(15) NOT NULL COMMENT '订单号，主键' ,
`main_form_code`  varchar(15) NOT NULL COMMENT '主订单号' ,
`member_id`  int NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`consignee_id`  int NOT NULL DEFAULT 0 COMMENT '收货人ID' ,
`total_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '订单总价格' ,
`goods_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '货品价格' ,
`deliver_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '运费' ,
`paid_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '已付价格' ,
`warehouse_id`  int NOT NULL DEFAULT 0 COMMENT '仓库ID' ,
`warehouse_name`  varchar(20) NOT NULL DEFAULT '' COMMENT '仓库名称' ,
`deliver_type_id`  int NOT NULL DEFAULT 0 COMMENT '配送方式ID' ,
`deliver_type_name`  varchar(20) NOT NULL DEFAULT '' COMMENT '配送方式名称' ,
`express_id`  int NOT NULL DEFAULT 0 COMMENT '快递公司ID' ,
`express_name`  varchar(20) NOT NULL DEFAULT '' COMMENT '快递公司名称' ,
`payment_type_id`  int NOT NULL DEFAULT 0 COMMENT '支付方式ID' ,
`payment_type_name`  varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式名称' ,
`quality`  int NOT NULL DEFAULT 0 COMMENT '商品数量' ,
`weight`  double NOT NULL DEFAULT 0 COMMENT '订单重量' ,
`status`  int NOT NULL DEFAULT 0 COMMENT '状态' ,
`payment_status`  int NOT NULL DEFAULT 0 COMMENT '支付状态' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`form_code`) ,
INDEX `idx_order_form_main_form_code` (`main_form_code`) USING BTREE 
)
COMMENT='订单子表'
;

#订单子表明细
DROP TABLE IF EXISTS `o_order_detail`;
CREATE TABLE `o_order_detail` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`form_code`  varchar(15) NOT NULL COMMENT '订单号' ,
`commodity_no`  varchar(15) NOT NULL COMMENT '商品编号' ,
`commodity_name`  varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称' ,
`product_no`  varchar(15) NOT NULL COMMENT '货品编号' ,
`size`  varchar(30) NOT NULL DEFAULT '' COMMENT '尺码' ,
`sell_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '货品卖价' ,
`discount`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '折扣' ,
`quality`  int NOT NULL DEFAULT 0 COMMENT '购买数量' ,
`return_quality`  int NOT NULL DEFAULT 0 COMMENT '退货数量' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_order_detail_form_code` (`form_code`) USING BTREE 
)
COMMENT='订单子表明细'
;

#订单支付明细表
DROP TABLE IF EXISTS `o_order_payment`;
CREATE TABLE `o_order_payment` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`form_code`  varchar(15) NOT NULL COMMENT '订单号' ,
`payment_type_id`  int NOT NULL DEFAULT 0 COMMENT '支付方式ID' ,
`payment_type_name`  varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式名称' ,
`payment_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '支付金额' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_order_payment_form_code` (`form_code`) USING BTREE 
)
COMMENT='订单支付明细表'
;

#订单日志表
DROP TABLE IF EXISTS `o_order_log`;
CREATE TABLE `o_order_log` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`form_code`  varchar(15) NOT NULL COMMENT '订单号' ,
`log_type_id`  int NOT NULL DEFAULT 0 COMMENT '日志类型ID' ,
`log_content`  varchar(200) NOT NULL DEFAULT '' COMMENT '日志内容' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`create_ip`  varchar(20) NOT NULL COMMENT '记录生成IP' ,
PRIMARY KEY (`id`) ,
INDEX `idx_order_log_form_code` (`form_code`) USING BTREE 
)
COMMENT='订单日志表'
;

#退换货受理单表
DROP TABLE IF EXISTS `o_accept_form`;
CREATE TABLE `o_accept_form` (
`accept_code`  varchar(15) NOT NULL COMMENT '受理单号' ,
`form_code`  varchar(15) NOT NULL COMMENT '订单号' ,
`return_type_id`  int NOT NULL DEFAULT 0 COMMENT '退换货类型ID' ,
`consignee_id`  int NOT NULL DEFAULT 0 COMMENT '收货人ID' ,
`return_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '退回商品总金额' ,
`exchange_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '换出商品总金额' ,
`warehouse_id`  int NOT NULL DEFAULT 0 COMMENT '仓库ID' ,
`warehouse_name`  varchar(20) NOT NULL DEFAULT '' COMMENT '仓库名称' ,
`exchange_form_code`  varchar(15) NOT NULL COMMENT '换出订单号' ,
`reason_id`  int NOT NULL DEFAULT 0 COMMENT '退货原因ID' ,
`reason_name`  varchar(50) NOT NULL DEFAULT '' COMMENT '退货原因描述' ,
`status`  int NOT NULL DEFAULT 0 COMMENT '状态' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`accept_code`) ,
INDEX `idx_accept_form_form_code` (`form_code`) USING BTREE 
)
COMMENT='退换货受理单表'
;

#受理单明细
DROP TABLE IF EXISTS `o_accept_detail`;
CREATE TABLE `o_accept_detail` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`accept_code`  varchar(15) NOT NULL COMMENT '受理单号' ,
`direction`  int NOT NULL DEFAULT 0 COMMENT '方向：0取回，1换出' ,
`order_detail_id`  int(4) UNSIGNED NOT NULL COMMENT '原订单字表明细行ID' ,
`commodity_no`  varchar(15) NOT NULL COMMENT '商品编号' ,
`commodity_name`  varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称' ,
`product_no`  varchar(15) NOT NULL COMMENT '货品编号' ,
`size`  varchar(30) NOT NULL DEFAULT '' COMMENT '尺码' ,
`sell_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '货品卖价' ,
`discount`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '折扣' ,
`quality`  int NOT NULL DEFAULT 0 COMMENT '数量' ,
`ref_id`  int(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对于换，要关联到退的ID' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_accept_detail_accept_code` (`accept_code`) USING BTREE 
)
COMMENT='受理单明细'
;

#受理单日志表
DROP TABLE IF EXISTS `o_accept_log`;
CREATE TABLE `o_accept_log` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`accept_code`  varchar(15) NOT NULL COMMENT '受理单号' ,
`log_type_id`  int NOT NULL DEFAULT 0 COMMENT '日志类型ID' ,
`log_content`  varchar(200) NOT NULL DEFAULT '' COMMENT '日志内容' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`create_ip`  varchar(20) NOT NULL COMMENT '记录生成IP' ,
PRIMARY KEY (`id`) ,
INDEX `idx_accept_log_accept_code` (`accept_code`) USING BTREE 
)
COMMENT='受理单日志表'
;

#退换货入库单号
/*DROP TABLE IF EXISTS `w_return_form`;
CREATE TABLE `w_return_form` (
`return_code`  varchar(15) NOT NULL COMMENT '退换货入库单号' ,
`accept_code`  varchar(15) NOT NULL DEFAULT '' COMMENT '受理单号' ,
`form_code`  varchar(15) NOT NULL COMMENT '订单号' ,
`return_type_id`  int NOT NULL DEFAULT 0 COMMENT '退换货类型ID' ,
`return_money_plan`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '应退金额' ,
`return_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '实退金额' ,
`warehouse_id`  int NOT NULL DEFAULT 0 COMMENT '仓库ID' ,
`warehouse_name`  varchar(20) NOT NULL DEFAULT '' COMMENT '仓库名称' ,
`reason_id`  int NOT NULL DEFAULT 0 COMMENT '退货原因ID' ,
`reason_name`  varchar(50) NOT NULL DEFAULT '' COMMENT '退货原因描述' ,
`status`  int NOT NULL DEFAULT 0 COMMENT '状态' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`return_code`) ,
INDEX `idx_return_form_accept_code` (`accept_code`) USING BTREE ,
INDEX `idx_return_form_form_code` (`form_code`) USING BTREE 
)
COMMENT='退换货入库单号'
;*/

#退换货入库单明细
/*DROP TABLE IF EXISTS `w_return_detail`;
CREATE TABLE `w_return_detail` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`return_code`  varchar(15) NOT NULL COMMENT '退换货入库单号' ,
`order_detail_id`  int(4) UNSIGNED NOT NULL COMMENT '原订单字表明细行ID' ,
`commodity_no`  varchar(15) NOT NULL COMMENT '商品编号' ,
`commodity_name`  varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称' ,
`product_no`  varchar(15) NOT NULL COMMENT '货品编号' ,
`size`  varchar(30) NOT NULL DEFAULT '' COMMENT '尺码' ,
`sell_price`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '货品卖价' ,
`discount`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '折扣' ,
`quality`  int NOT NULL DEFAULT 0 COMMENT '数量' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_return_detail_return_code` (`return_code`) USING BTREE 
)
COMMENT='退换货入库单明细'
;*/

#退款流水明细表
DROP TABLE IF EXISTS `o_return_payment`;
CREATE TABLE `o_return_payment` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`return_code`  varchar(15) NOT NULL COMMENT '退换货入库单号' ,
`payment_type_id`  int NOT NULL DEFAULT 0 COMMENT '支付方式ID' ,
`payment_type_name`  varchar(20) NOT NULL DEFAULT '' COMMENT '支付方式名称' ,
`return_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '退款金额' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_return_payment_return_code` (`return_code`) USING BTREE 
)
COMMENT='退款流水明细表'
;

#退款单表
DROP TABLE IF EXISTS `o_refund_form`;
CREATE TABLE `o_refund_form` (
`refund_code`  varchar(15) NOT NULL COMMENT '退款单号' ,
`form_code`  varchar(15) NOT NULL COMMENT '订单号' ,
`return_code`  varchar(15) NOT NULL COMMENT '退换货入库单号' ,
`member_id`  int NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`refund_type_id`  int NOT NULL DEFAULT 0 COMMENT '退款单类型ID' ,
`payment_type_id`  int NOT NULL DEFAULT 0 COMMENT '退款方式ID' ,
`refund_money`  decimal(18,2) NOT NULL DEFAULT 0 COMMENT '退款金额' ,
`status`  int NOT NULL DEFAULT 0 COMMENT '状态' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`refund_code`) ,
INDEX `idx_refund_form_form_code` (`form_code`) USING BTREE 
)
COMMENT='退款单表'
;

#退款单日志表
DROP TABLE IF EXISTS `o_refund_log`;
CREATE TABLE `o_refund_log` (
`id`  int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`refund_code`  varchar(15) NOT NULL COMMENT '退款单号' ,
`log_type_id`  int NOT NULL DEFAULT 0 COMMENT '日志类型ID' ,
`log_content`  varchar(200) NOT NULL DEFAULT '' COMMENT '日志内容' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`create_ip`  varchar(20) NOT NULL COMMENT '记录生成IP' ,
PRIMARY KEY (`id`) ,
INDEX `idx_refund_log_refund_code` (`refund_code`) USING BTREE 
)
COMMENT='退款单日志表'
;

#类型状态字典表
DROP TABLE IF EXISTS `o_dictionary`;
CREATE TABLE `o_dictionary` (
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