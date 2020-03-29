const cdnServiceUrl = 'https://resources.zhishinet.com';
const serviceUrl = 'https://www.zhishinet.com/api/';
const stsServiceUrl = 'https://sts.zhishinet.com/api/';
const servicePath = {
  'access' : serviceUrl + 'zauth/v1/token/access', //获取token接口
  'users' : serviceUrl + 'user-profile/v1/sec/users?identity=student', //获取token接口
  'suitList' : stsServiceUrl + 'sts-student/v1/sec/getSuitList', //获取token接口

};