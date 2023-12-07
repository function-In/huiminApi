<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // 判断请求所需数据的值
    if (empty($_POST['meta']) || $_POST['meta'] == '') die(json_encode(setStatus(203, '无法完成请求！参数错误！', null)));
    // 处理数据
    switch ($_POST['meta']) {
            // 用户列表请求
        case 'user_list_require':
            user_list_require();
            break;
            // 用户信息请求
        case 'user_info_require':
            user_info_require();
            break;
            // 用户信息请求2
        case 'user_info_require2':
            user_info_require2();
            break;
            // 删除用户请求
        case 'user_delete_require':
            user_delete_require();
            break;
            // 用户信息修改
        case 'user_edit_require':
            user_edit_require();
            break;
            // 添加用户
        case 'user_create_require':
            user_create_require();
            break;
            
    }
}



// 读取用户
function user_list_require()
{
    $mycon = new MyConnect();
    // 返回特定字段数据
    $user_list_dataWhere = array('id', 'user_header', 'user_name', 'user_sex', 'user_age', 'user_phone', 'user_email', 'user_permission', 'user_sign', 'user_status', 'status_info', 'user_time', 'user_money');
    // 执行并返回结果
    $user_list_result = $mycon->inquire('_db_users', $user_list_dataWhere, null);
    // 循环替换信息
    foreach ($user_list_result['data'] as $_key => $_value) {
        // 替换用户性别显示
        $user_list_result['data'][$_key]['user_sex'] = $_value['user_sex'] == 0 ? '不透露' : ($_value['user_sex'] == 1 ? '男' : '女');
        // 替换账号权限显示
        $user_list_result['data'][$_key]['user_permission'] = $_value['user_permission'] == 0 ? '普通用户' : ($_value['user_permission'] == 1 ? '管理员' : '其他成员');
        // 转换注册时间显示
        $user_list_result['data'][$_key]['user_time'] = date("Y-m-d H:i:s", $_value['user_time']);
        // 替换账号状态显示
        $user_list_result['data'][$_key]['user_status'] = $_value['user_status'] == 0 ? '正常' : '异常';
    }
    // 数据数据
    echo json_encode($user_list_result);
    // 关闭数据库连接
    $mycon->close();
}









// 请求用户信息
function user_info_require()
{
    $mycon = new MyConnect();
    // 返回特定字段数据
    $user_info_dataWhere = array('id', 'user_header', 'user_name', 'user_sex', 'user_age', 'user_phone', 'user_email', 'user_permission', 'user_sign', 'user_status', 'status_info', 'user_time', 'user_money');
    // 特定条件
    $user_info_where = array(array('key' => 'id', 'operation' => 'like', 'value' => $_POST['userid']),);
    // 执行并返回结果
    $user_info_result = $mycon->inquire('_db_users', $user_info_dataWhere, $user_info_where);
    // 循环替换信息
    foreach ($user_info_result['data'] as $_key => $_value) {
        // 替换用户性别显示
        $user_info_result['data'][$_key]['user_sex'] = $_value['user_sex'] == 0 ? '不透露' : ($_value['user_sex'] == 1 ? '男' : '女');
        // 替换账号权限显示
        $user_info_result['data'][$_key]['user_permission'] = $_value['user_permission'] == 0 ? '普通用户' : ($_value['user_permission'] == 1 ? '管理员' : '其他成员');
        // 转换注册时间显示
        $user_info_result['data'][$_key]['user_time'] = date("Y-m-d H:i:s", $_value['user_time']);
        // 替换账号状态显示
        $user_info_result['data'][$_key]['user_status'] = $_value['user_status'] == 0 ? '正常' : '异常';
    }
    // 数据数据
    echo json_encode($user_info_result);
    // 关闭数据库连接
    $mycon->close();
}













// 请求用户信息2
function user_info_require2()
{
    $mycon = new MyConnect();
    // 返回特定字段数据
    $user_info_dataWhere = array('id', 'user_header', 'user_name', 'user_sex', 'user_age', 'user_phone', 'user_email', 'user_permission', 'user_sign', 'user_status', 'status_info', 'user_time', 'user_money');
    // 特定条件
    $user_info_where = array(array('key' => 'id', 'operation' => 'like', 'value' => $_POST['userid']),);
    // 执行并返回结果
    $user_info_result = $mycon->inquire('_db_users', $user_info_dataWhere, $user_info_where);
    // 循环替换信息
    foreach ($user_info_result['data'] as $_key => $_value) {
        // 转换注册时间显示
        $user_info_result['data'][$_key]['user_time'] = date("Y-m-d H:i:s", $_value['user_time']);
    }
    // 数据数据
    echo json_encode($user_info_result);
    // 关闭数据库连接
    $mycon->close();
}















// 用户信息修改
function user_edit_require()
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
    // 搭建用户更新数据结构
    $user_update_data = array(
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
        "user_permission" => $_POST['user_permission'],
        // 账户状态
        "user_status" => $_POST['user_status'],
        // 状态信息
        "status_info" => $_POST['status_info'],
        // 用户签名
        "user_sign" => $_POST['user_sign'],
        // 余额
        'user_money' => $_POST['user_money']
    );
    // 设置密码 （ 为空不更改 ）
    if (!empty($_POST['pwd'] && $_POST['pwd'] != '')) $user_update_data['user_pwd'] = md5($_POST['pwd']);
    // 用户数据更新条件
    $user_update_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']));
    // 实例化
    $mycon = new MyConnect();
    // 判断头像文件是否存在
    if (!empty($_FILES)) {
        // 搭建头像查询框架
        $header_require_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']));
        // 返回查询头像的结果
        $header_require_result = $mycon->inquire('_db_users', array("*"), $header_require_where);
        // 判断状态码 200 = 成功（  = 头像存在 ）
        if ($header_require_result['code'] == 200) {
            // 删除之前的头像
            unlink('..' . $header_require_result['data'][0]['user_header']);
        }
        // 设置为新头像路径
        $imageUrl = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES['file']['name'] . 'png'));
        // 上传头像
        move_uploaded_file($_FILES['file0']['tmp_name'], $imageUrl);
        // 设置用户头像显示路径
        $user_update_data['user_header'] = substr($imageUrl, 2);
    }
    // 执行修改用户数据信息并返回结果
    $user_update_result = $mycon->update('_db_users', $user_update_data, $user_update_where);
    // 输出结果
    echo json_encode($user_update_result);
    // 关闭数据库连接
    $mycon->close();
}














// 删除用户
function user_delete_require()
{
    switch ($_POST['userid']) {
        case 10000:
        case 10001:
            die(json_encode(setStatus(500, '系统账户禁止删除！', null)));
            break;
    }
    // 搭建用户删除条件结构
    $user_delete_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['userid']),);
    // 实例化数据库对象
    $mycon = new MyConnect();
    // 执行删除用户并返回结果
    $user_delete_result = $mycon->delete("_db_users", $user_delete_where);
    // 返回结果
    echo json_encode($user_delete_result);
    // 关闭数据库连接
    $mycon->close();
}















// 添加用户
function user_create_require()
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
        "user_permission" => $_POST['user_permission'],
        // 账户状态
        "user_status" => $_POST['user_status'],
        // 状态信息
        "status_info" => $_POST['status_info'],
        // 用户签名
        "user_sign" => $_POST['user_sign'],
        // 注册时间
        "user_time" => time(),
        // 余额
        'user_money' => $_POST['user_money'],
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
    echo json_encode($user_create_result);
    // 关闭数据库连接
    $mycon->close();
}
