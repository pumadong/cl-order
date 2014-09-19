delete from `p_module` where name='订单中心';
INSERT INTO `p_module`(id,name,flag,url,sort_no,create_person,create_date,update_person,update_date) 
VALUES
(5,'订单中心','o','http://127.0.0.1:10010/order-server',50,'system',NOW(),'system',NOW())
;


delete from `p_resource` where module_flag='o';
INSERT INTO `p_resource`(id,name,url,remark,parent_id,structure,sort_no,module_flag,create_person,create_date,update_person,update_date) 
VALUES
(200,'订单管理','','',0,'s-1',1,'o','system',NOW(),'system',NOW()),
(201,'促销管理','','',0,'s-2',2,'o','system',NOW(),'system',NOW()),
(202,'礼品卡管理','','',0,'s-3',3,'o','system',NOW(),'system',NOW()),
(203,'受理单管理','','',0,'s-4',4,'o','system',NOW(),'system',NOW()),
(204,'退款单管理','','',0,'s-5',5,'o','system',NOW(),'system',NOW()),
(205,'请款单管理','','',0,'s-6',6,'o','system',NOW(),'system',NOW()),

(211,'订单查询','/controller/order/list.do','',200,'s-1-1',1,'o','system',NOW(),'system',NOW()),
(212,'订单报表','/controller/order/report.do','',200,'s-1-2',2,'o','system',NOW(),'system',NOW()),

(221,'促销查询','/controller/promotion/list.do','',201,'s-2-1',1,'o','system',NOW(),'system',NOW()),

(231,'创建','/controller/giftcard/create.do','',202,'s-3-1',1,'o','system',NOW(),'system',NOW()),
(232,'查询','/controller/giftcard/list.do','',202,'s-3-2',2,'o','system',NOW(),'system',NOW()),

(241,'创建','/controller/acceptform/create.do','',203,'s-4-1',1,'o','system',NOW(),'system',NOW()),
(242,'管理','/controller/acceptform/list.do','',203,'s-4-2',2,'o','system',NOW(),'system',NOW()),

(251,'创建','/controller/refund/create.do','',204,'s-5-1',1,'o','system',NOW(),'system',NOW()),
(252,'查询','/controller/refund/list.do','',204,'s-5-2',2,'o','system',NOW(),'system',NOW()),

(261,'创建','/controller/apply/create.do','',205,'s-6-1',1,'o','system',NOW(),'system',NOW()),
(262,'查询','/controller/apply/list.do','',205,'s-6-2',2,'o','system',NOW(),'system',NOW())
;