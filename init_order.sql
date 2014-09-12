#数据初始化-订单字典表
truncate table o_dictionary;

insert into `o_dictionary`(`group`,`code`,`name`,sort_no,create_person,create_date)
values
('order_type','1','销售',1,'system',now()),
('order_type','2','换货',2,'system',now()),

('order_status','1','已创建',1,'system',now()),
('order_status','2','已审核',2,'system',now()),
('order_status','3','已支付',3,'system',now()),
('order_status','4','已打印',4,'system',now()),
('order_status','5','已拣货',5,'system',now()),
('order_status','6','已打包',6,'system',now()),
('order_status','7','已出库',7,'system',now()),
('order_status','8','已取消',8,'system',now()),


('payment_status','1','未支付',1,'system',now()),
('payment_status','2','部分支付',2,'system',now()),
('payment_status','3','已支付',3,'system',now()),

('payment_type','1','支付宝',1,'system',now()),
('payment_type','2','财付通',2,'system',now()),

('deliver_type','1','快递',1,'system',now()),
('deliver_type','2','EMS',2,'system',now()),

('order_log_type','1','支付',1,'system',now()),
('order_log_type','2','取消',2,'system',now()),
('order_log_type','3','订单自动转有效',3,'system',now()),
('order_log_type','4','超时转缺库存',4,'system',now()),
('order_log_type','5','缺库存手工转有效',5,'system',now()),

('return_type','1','退货',1,'system',now()),
('return_type','2','换货',2,'system',now()),

('accept_status','1','刚录入',1,'system',now()),
('accept_status','2','已完成',2,'system',now()),
('accept_status','3','取消',3,'system',now()),

('accept_log_type','1','创建',1,'system',now()),

('refund_type','1','退款',1,'system',now()),
('refund_type','2','运费报销',2,'system',now()),

('refund_status','1','刚录入',1,'system',now()),
('refund_status','2','财务已处理',2,'system',now()),
('refund_status','3','取消',3,'system',now()),

('refund_log_type','1','创建',1,'system',now())
;