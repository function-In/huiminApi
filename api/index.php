<?php
header('Access-Control-Allow-Origin: http://localhost');

header('Access-Control-Allow-Credentials: true');

// 启用会话
session_start();


// 返回状态码体
function setStatus($a, $b, $c)
{
    $result = array('code' => $a, 'info' => $b);
    if (!empty($c)) $result['data'] = $c;
    return $result;
}



// 引入数据库连接文件
include './HuiminApi.php';

// 用户信息处理文件
include './HuiminApi_User.php';

// 资讯信息处理文件
include './HuiminApi_News.php';

// 商品信息处理文件
include './HuiminApi_Shop.php';

// 论坛信息处理
include './HuiminApi_Forum.php';

// 评论信息处理
include './HuiminApi_Comment.php';

// 登录注册相关处理
include './HuiminApi_Login.php';
