# 在线教育

## 需求与功能
模式：B2C  
实现线上视频管理   
观看网站视频

###canal-client：canal数据库表同步模块（统计同步数据）

###common：公共模块父节点

####common-util：工具类模块，所有模块都可以依赖于它

####service-base：service服务的base包，包含service服务的公共配置类，所有service模块依赖于它

####spring-security：认证与授权模块，需要认证授权的service服务依赖于它

###infrastructure：基础服务模块父节点

####api-gateway：api网关服务

###service：api接口服务父节点

####service-acl：用户权限管理api接口服务（用户管理、角色管理和权限管理等）

####service-cms：cms api接口服务

####service-edu：教学相关api接口服务

####service-msm：短信api接口服务

####service-order：订单相关api接口服务

####service-oss：阿里云oss api接口服务

####service-statistics：统计报表api接口服务

####service-ucenter：会员api接口服务

####service-vod：视频点播api接口服务
## 工具和技术
#### 前端
Vue 
#### 后端
SpringBoot &ensp;SpringCloud &ensp; MybatisPlus &ensp; 分布式
## 测试

