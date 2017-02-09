统一转码服务
===============


将转码服务部署为独立的服务，不区分ABCD，支持多服务器组成转码集群。


运行环境
--------

运行在Windows下的WAMP服务器中。服务器需要安装Moyea SDK，FFMPEG。使用MySQL数据库作为数据存储和队列存储。

需要配置Moyea安装路径，FFMPEG安装路径，远程存储服务器路径，本地转码临时目录路径，MySQL数据库。



视频资源服务器
-------------


数据库对列表：


    CREATE TABLE `task_queue` (
      `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
      `conference_id` int(11) NOT NULL,
      `temp_conference_id` int(11) NOT NULL,
      `environment` char(3) NOT NULL DEFAULT '',
      `conference_length` int(11) NOT NULL,
      `start_at` int(11) NOT NULL DEFAULT '0',
      `end_at` int(11) NOT NULL DEFAULT '0',
      `create_at` int(11) NOT NULL,
      `available_at` int(11) NOT NULL,
      `callback_url` varchar(100) NOT NULL DEFAULT '',
      `status` tinyint(4) NOT NULL DEFAULT '0',
      `attempt` tinyint(4) NOT NULL DEFAULT '0',
      `callback_attempt` tinyint(4) NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`),
      KEY `INDEX_available_at` (`available_at`),
      KEY `INDEX_conference` (`conference_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;