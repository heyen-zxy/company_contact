## 员工信息接口列表

---

#### 读取接口

|  |  |
|:-------------:|:-------------|
| [/api/v1/users.json](#/api/v1/users.json) | 获取所有员工信息 |
| [/api/v1/users/id.json](#/api/v1/users/1.json) | 获取指定员工信息 |


## 用户信息接口详情

* #### /api/v1/users.json

---

获取所有员工信息


##### 请求参数

---
无

##### 请求方法

---

GET

##### 调用样例

---

`/api/v1/users.json`

##### 返回结果

---

*** JSON示例 ***


    {"users":[{"id":7,"name":"张三","tel":"23423","address":"23发生地方","created_at":"2016-05-07T10:33:34.000Z","updated_at":"2016-05-07T10:33:34.000Z","category":"董事长"},{"id":8,"name":"李四","tel":"323423","address":"依然有人讨厌热天","created_at":"2016-05-07T10:33:48.000Z","updated_at":"2016-05-07T10:33:48.000Z","category":"总经理"}]}


* #### /api/v1/users/id.json

---

获取单个员工信息


##### 请求参数

---
id

##### 请求方法

---

GET

##### 调用样例

---

`/api/v1/users/1.json`


##### 返回结果

---

*** JSON示例 ***


    {"user":{"id":7,"name":"张三","tel=":"23423","address=":"23发  生地方","created_at=":"2016-05-07T10:33:34.000Z","updated_at=":    "2016-05-07T10:33:34.000Z","category":"董事长"}}
---
    {"message":"找不到该员工"}
    
*** message返回值 ***

| msg | 说明 |
|:-------------:|:-------------|
| 找不到该员工| 传入的id有误 |






