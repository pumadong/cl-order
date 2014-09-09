cl-order
==================

订单管理系统


一、前置项目依赖

https://github.com/pumadong/cl-privilege

二、项目说明

订单中心，为网站下单提供接口，并基于多种维度提供订单查询，报表、导出功能。关于订单的售后，放在“客服中心”系统中。

计划实现的订单中心功能单元如下：

order-api-server：订单接口，对接其他系统

order-schedule：订单自动化处理任务，比如：转有效、转无效等

order-server：订单管理界面

三、mybatis-generator

ORM框架采用MyBatis，为了提高开发效率，先根据数据库表单结构自动生成Model和MyBatis相关类，生成命令如下：

java -jar mybatis-generator-core-1.3.1.jar -configfile config_order.xml -overwrite

生成时需要把mybatis-generator-core-1.3.1.jar、mysql-connector-java-5.1.24-bin.jar、config_order.xml放到一个目录下，生成的相关类和XML会放置到CreateResult文件夹下面。

jar下载地址：http://pan.baidu.com/s/1qW98L0C