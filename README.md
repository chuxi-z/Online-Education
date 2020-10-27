# Online Education website

## demand and functionality
pattern：B2C  

### common：Public module parent node
#### common-util：Utils module, all modules can depend on it
#### service-base：Contains public configuration classes for service services
### infrastructure：SpringCloud
#### api-gateway：gateway service
### service：api
#### service-cms：cms api
#### service-edu：Teaching related api interface service
#### service-msm：SMS API interface service
#### service-order：Order related api interface service
#### service-oss：AliCloud api
#### service-ucenter：user api
#### service-vod：video on demand api
## tools
#### front-end
Vue Nodejs
#### back-end
SpringBoot &ensp;SpringCloud &ensp; MybatisPlus &ensp; Redis &ensp; Swagger &ensp; 
## test
[swaggerTest](http://localhost:8001/swagger-ui.html) test controller api

## run
```
//nginx 配置请求跳转
//brew services start nginx
server {
        #配置nginx上传文件大小
        #打开nginx主配置文件nginx.conf，找到http{}，添加
        http{
            client_max_body_size 1024m;
        }
        
        listen   9001;
        server_name  localhost;
        
        location ~ /eduservice/ {
            proxy_pass http://localhost:8001;
        }
        
        location ~ /eduoss/ {
            proxy_pass http://localhost:8002;
        }

        location ~ /eduvod/ {
            proxy_pass http://localhost:8003;
        }
    }
```

## configuration
```editorconfig
#Edu-service
spring.profiles.active=dev

spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/online_education?serverTimezone=GMT%2B8&characterEncoding=utf8
spring.datasource.username=root
spring.datasource.password=123456

spring.jackson.date-format=yyyy-MM-dd HH:mm:ss
spring.jackson.time-zone=GMT-4

#logging.level.root=warn
#mybatis-plus.configuration.log-impl=org.apache.ibatis.logging.stdout.StdOutImpl

mybatis-plus.mapper-locations=classpath:com/web/serviceedu/mapper/xml/*.xml
#mybatis-plus.config-location=
```


```editorconfig
#oss-config
#服务端口
server.port=8002
#服务名
spring.application.name=service-oss

#环境设置：dev、test、prod
spring.profiles.active=dev

#阿里云 OSS
#不同的服务器，地址不同
aliyun.oss.file.endpoint=oss-us-east-1.aliyuncs.com
aliyun.oss.file.keyid=LTAI4GJFcCEtJPRk7T7PYKKo
aliyun.oss.file.keysecret=r1TMYazBHxKEWQl9YmMdYQStmlBxuE
#bucket可以在控制台创建，也可以使用java代码创建
aliyun.oss.file.bucketname=online-edu-zz
```

```editorconfig
#配置mapper
mybatis-plus.mapper-locations=classpath:com/web/serviceedu/mapper/xml/*.xml

#pom.xml
<build>
    <resources>
        <resource>
            <directory>src/main/java</directory>
            <includes>
                <include>**/*.xml</include>
            </includes>
            <filtering>false</filtering>
        </resource>
    </resources>
</build>
```

```editorconfig
#进入lib目录 终端命令
mvn install:install-file -DgroupId=com.aliyun -DartifactId=aliyun-sdk-vod-upload -Dversion=1.4.11 -Dpackaging=jar -Dfile=aliyun-java-vod-upload-1.4.11.jar

#阿里云 视频点播配置无法从maven仓库中下载 手动下载并加入jar包
<dependency>
    <groupId>com.aliyun</groupId>
    <artifactId>aliyun-sdk-vod-upload</artifactId>
    <version>1.4.11</version>
</dependency>

```

```editorconfig
#SpringCloud

# nacos服务地址
spring.cloud.nacos.discovery.server-addr=localhost:8848

feign.hystrix.enabled=true
# 设置hystrix超时时间，默认1000ms
#hystrix.command.default.execution.isolation.thread.timeoutInMilliseconds=6000
```
