<?php

// 请求数据
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // 判断请求所需数据的值
    if (empty($_POST['meta']) || $_POST['meta'] == '') die(json_encode(setStatus(203, '无法完成请求！参数错误！', null)));
    // 处理数据
    switch ($_POST['meta']) {
        case 'login_require':
            login_require();
            break;
        case 'login_exit_require':
            login_exit_require();
            break;
        case 'login_state_require':
            login_state_require();
            break;

            // 加钱
        case 'money_add_require':
            money_add_require();
            break;
            // 查钱
        case 'money_require':
            money_require();
            break;
            // 减钱
        case "money_del_require":
            money_del_require();
            break;

            // 用户注册
        case 'user_register_require':
            user_register_require();
            break;
    }
}

// 用户注册
function user_register_require()
{
    // 头像默认保存地址
    $baseurl = "../uploads/images/headers/";
    // 如果默认保存地址不存在则创建文件夹
    if (!file_exists($baseurl)) {
        mkdir($baseurl, 0777, true);
        clearstatcache();
    }
    // 头像路径
    $imageUrl = '';
    // 搭建新增用户数据结构
    $user_create_data = array(
        // 用户昵称
        "user_name" => $_POST['user_name'],
        // 用户手机
        "user_phone" => $_POST['user_phone'],
        // 用户邮箱
        "user_email" => $_POST['user_email'],
        // 用户性别
        "user_sex" => $_POST['user_sex'],
        // 用户年龄
        "user_age" => $_POST['user_age'],
        // 用户权限
        "user_permission" => 0,
        // 账户状态
        "user_status" => 0,
        // 状态信息
        // "status_info" => $_POST['status_info'],
        // 用户签名
        "user_sign" => $_POST['user_sign'],
        // 注册时间
        "user_time" => time(),
        // 余额
        // 'user_money' => $_POST['user_money'],
        // 用户密码
        "user_pwd" => md5($_POST['pwd'])
    );
    // 实例化
    $mycon = new MyConnect();
    // 判断头像文件是否存在
    if (!empty($_FILES)) {
        // 设置为新头像路径
        $imageUrl = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES['file']['name'] . 'png'));
        // 上传头像
        move_uploaded_file($_FILES['file0']['tmp_name'], $imageUrl);
        // 设置用户头像显示路径
        $user_create_data['user_header'] = substr($imageUrl, 2);
    }
    // 执行修改用户数据信息并返回结果
    $user_create_result = $mycon->increase('_db_users', $user_create_data);
    // 输出结果
    if ($user_create_result['code'] == 200) {
        // 查询用户信息
        $user_info_where = array(
            array('key' => 'user_name', 'operation' => '=', 'value' => $_POST['user_name'], 'next' => 'and'),
            array('key' => 'user_phone', 'operation' => '=', 'value' => $_POST['user_phone'], 'next' => 'and'),
            array('key' => 'user_email', 'operation' => '=', 'value' => $_POST['user_email']),
        );
        // 执行并返回结果
        $user_info_result = $mycon->inquire('_db_users', array('*'), $user_info_where);
        echo json_encode(setStatus(200, '用户注册成功！', $user_info_result['data']));
    } else {
        echo json_encode($user_create_result);
    }
    // 关闭数据库连接
    $mycon->close();
}

// 登录请求
function login_require()
{
    if (!isset($_SESSION['userinfo'])) {
        $mycon = new MyConnect();
        // 返回特定字段数据
        // 特定条件
        $user_info_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['username']),);
        // 执行并返回结果
        $user_info_result = $mycon->inquire('_db_users', array('*'), $user_info_where);
        if ($user_info_result['code'] == 300) {
            echo json_encode(setStatus(300, '登录失败！没有该账号！', NULL));
        } else if ($user_info_result['code'] == 200) {
            if (md5($_POST['password']) == $user_info_result['data'][0]['user_pwd']) {
                $user_info_result['data'][0]['user_pwd'] = '';
                $_SESSION['userinfo'] = $user_info_result['data'][0];
                echo json_encode(setStatus(200, '登录成功！欢迎您' . $user_info_result['data'][0]['user_name'], $user_info_result['data'][0]));
            } else {
                echo json_encode(setStatus(300, '登录失败！用户密码错误！', NULL));
            }
        } else {
            echo json_encode(setStatus(300, '登录失败！未知原因！', NULL));
        }
        // 关闭数据库连接
        $mycon->close();
    } else {
        echo json_encode(setStatus(200, '您已进行登录！', $_SESSION['userinfo']));
    }
}

// 请求状态
function login_state_require()
{
    if (!empty($_SESSION) && isset($_SESSION['userinfo'])) {
        echo json_encode(setStatus(200, '登陆状态！', $_SESSION['userinfo']));
    } else {
        echo json_encode(setStatus(300, '未登陆状态！', NULL));
    }
}


// 退出登录请求
function login_exit_require()
{
    if (session_id()) session_destroy();
    if (isset($_SESSION['userinfo'])) $_SESSION['userinfo'] = NULL;
    echo json_encode(setStatus(200, '退出登录成功！', NULL));
}

// 查询余额
function money_require()
{
    if (!empty($_SESSION) && isset($_SESSION['userinfo'])) {
        $mycon = new MyConnect();
        // 特定条件
        $user_info_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_SESSION['userinfo']['id']),);
        // 执行并返回结果
        $user_info_result = $mycon->inquire('_db_users', array('*'), $user_info_where);
        // 清空密码
        $user_info_result['data'][0]['user_pwd'] = '';
        // 返回字段
        echo json_encode(setStatus(200, '查询成功！', $user_info_result['data'][0]));
        // 关闭数据库连接
        $mycon->close();
    } else {
        echo json_encode(setStatus(300, '未登陆状态！', NULL));
    }
}


// 添加余额
function money_add_require()
{
    // 实例化
    $mycon = new MyConnect();
    $user_update_data = array('user_money' => $_POST['money'] + 1000);
    $user_update_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['userid']));
    $user_update_result = $mycon->update('_db_users', $user_update_data, $user_update_where);
    // // 输出结果
    echo json_encode($user_update_result);
    // // 关闭数据库连接
    $mycon->close();
}


// 提现余额
function money_del_require()
{
    // 实例化
    $mycon = new MyConnect();
    $user_update_data = array('user_money' => $_POST['money'] - 1000);
    $user_update_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['userid']));
    $user_update_result = $mycon->update('_db_users', $user_update_data, $user_update_where);
    // // 输出结果
    echo json_encode($user_update_result);
    // // 关闭数据库连接
    $mycon->close();
}
