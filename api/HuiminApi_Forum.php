<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // 判断请求所需数据的值
    if (empty($_POST['meta']) || $_POST['meta'] == '') die(json_encode(setStatus(203, '无法完成请求！参数错误！', null)));
    // 处理数据
    switch ($_POST['meta']) {

            // 获取讨论类型请求
        case 'forum_type_list_require':
            forum_type_list_require();
            break;
            // 添加讨论分类
        case 'forum_type_create_require':
            forum_type_create_require();
            break;
            // 删除讨论分类
        case "forum_type_delete_require":
            forum_type_delete_require();
            break;
            // 修改讨论分类
        case 'forum_type_update_require':
            forum_type_update_require();
            break;



            // 讨论列表请求
        case 'forum_list_require':
            forum_list_require();
            break;
            // 删除讨论请求
        case 'forum_delete_require':
            forum_delete_require();
            break;
            // 发布讨论帖
        case 'forum_create_require':
            forum_create_require();
            break;
            // 请求讨论信息
        case 'forum_info_require':
            forum_info_require();
            break;
            // 获取讨论信息2
        case 'forum_info_require2':
            forum_info_require2();
            break;
            // 删除图片请求
        case 'forum_image_delete_require':
            forum_image_delete_require();
            break;
            // 修改讨论
        case 'forum_update_require':
            forum_update_require();
            break;
    }
}


// 获取讨论分类请求
function forum_type_list_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 读所有分类
    $forum_type_list_result = $mycon->inquire('forum_type', array("*"), null);
    // 查询数量
    foreach ($forum_type_list_result['data'] as $key => $value) {
        $forum_count_where = array(array('key' => 'typeid', 'operation' => '=', 'value' => $value['id']));
        $forum_count_result = $mycon->inquire('forum_list', array("count(*)"), $forum_count_where)['data'][0]['count(*)'];
        $forum_type_list_result['data'][$key]['count'] = $forum_count_result;
    }
    // 输出结果
    echo json_encode($forum_type_list_result);
    // 关闭数据库的连接
    $mycon->close();
}

// 添加讨论分类
function forum_type_create_require()
{
    // 搭建创建分类数据结构
    $forum_type_create_data = array("title" => $_POST['title']);
    // 实例化
    $mycon = new MyConnect();
    // 执行创建分类并返回结果 `
    $forum_type_create_result = $mycon->increase('forum_type', $forum_type_create_data);
    // 输出结果
    echo json_encode($forum_type_create_result);
    // 关闭数据库连接
    $mycon->close();
}

// 删除分类请求
function forum_type_delete_require()
{
    // 搭建分类删除条件结构
    $forum_list_delete_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']),);
    // 实例化数据库对象
    $mycon = new MyConnect();
    // 执行删除分类并返回结果
    $forum_list_delete_result = $mycon->delete("forum_type", $forum_list_delete_where);
    // 返回结果
    echo json_encode($forum_list_delete_result);
    // 关闭数据库连接
    $mycon->close();
}

// 修改分类名称
function forum_type_update_require()
{
    // 搭建修改分类数据结构
    $forum_type_update_data = array("title" => $_POST['title']);
    //  条件
    $forum_type_update_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']));
    // 实例化
    $mycon = new MyConnect();
    // 执行创建分类并返回结果
    $forum_type_update_result = $mycon->update('forum_type', $forum_type_update_data, $forum_type_update_where);
    // 输出结果
    echo json_encode($forum_type_update_result);
    // 关闭数据库连接
    $mycon->close();
}

// 获取讨论列表
function forum_list_require()
{
    $mycon = new MyConnect();
    // 执行并返回结果
    $forum_list_result = $mycon->inquire('forum_list', array("*"), null);
    // 循环替换信息
    foreach ($forum_list_result['data'] as $key => $value) {
        $user_require_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $value['userid']));
        $forum_list_result['data'][$key]['userid'] = $mycon->inquire('_db_users', array("*"), $user_require_where)['data'][0]['user_name'];
        $forum_list_result['data'][$key]['date'] = date("Y-m-d H:i:s", $value['date']);
        $forum_list_result['data'][$key]['status'] = $value['status'] == 0 ? '正常' : '异常';
    }
    // 返回数据
    echo json_encode($forum_list_result);
    // 关闭数据库连接
    $mycon->close();
}

// 删除讨论请求
function forum_delete_require()
{
    // 搭建讨论删除条件结构
    $forum_delete_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']),);
    // 实例化数据库对象
    $mycon = new MyConnect();
    // 搭建删除图片条件结构
    $forumImage_delete_where =  array(array('key' => 'forumid', 'operation' => '=', 'value' => $_POST['id']));
    // 查询并删除图片路径
    $forumImage_list_result = $mycon->inquire('forum_images', array('*'), $forumImage_delete_where);
    if ($forumImage_list_result['code'] == 200) {
        foreach ($forumImage_list_result['data'] as $key => $value) {
            if (file_exists('..' . $value['img']) && is_file('..' . $value['img'])) {
                unlink('..' . $value['img']);
            }
        }
    }
    // 删除图片在图片数据表内的信息并返回结果
    $forumImage_delete_result = $mycon->delete('forum_images', $forumImage_delete_where);
    // 输出验证
    // echo json_encode($forumImage_delete_result);
    // 执行删除讨论并返回结果
    $forum_delete_result = $mycon->delete("forum_list", $forum_delete_where);
    // 返回结果
    echo json_encode($forum_delete_result);
    // 关闭数据库连接
    $mycon->close();
}

// 发布讨论帖
function forum_create_require()
{
    // 时间ID tid 生成
    $tid = rand(0, time() / 100) + rand(0, time() / 1000);
    // 讨论列表存放路径
    $baseurl = "../uploads/images/forum/";
    // 如果默认保存地址不存在则创建文件夹
    if (!file_exists($baseurl)) {
        mkdir($baseurl, 0777, true);
        clearstatcache();
    }
    // 搭建添加讨论帖的结构
    $forum_create_data = array(
        // 分类编号
        "typeid" => $_POST['typeid'],
        // 发布者
        "userid" => '10000',
        // 标题
        "title" => $_POST['title'],
        // 内容
        "content" => $_POST['content'],
        // 发布时间
        "date" => time(),
        // 发布状态
        "status" => $_POST['status'],
        // 时间ID值
        "_tid" => $tid
    );
    // 实例化
    $mycon = new MyConnect();
    // 存入讨论帖数据库
    $mycon->increase('forum_list', $forum_create_data);
    // 根据时间ID取得帖子唯一ID
    $forumid_require_where =  array(array('key' => '_tid', 'operation' => '=', 'value' => $tid));
    // 唯一ID结果
    $forumid_require_result = $mycon->inquire('forum_list', array("*"), $forumid_require_where)['data'][0]['id'];
    // 处理剩下的图片 
    if (count($_FILES) > 0) {
        for ($i = 0; $i < count($_FILES); $i++) {
            // 生成路径
            $forum_image_path = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES["file$i"]['name'] . '.png'));
            // 移动文件
            move_uploaded_file($_FILES["file$i"]['tmp_name'], $forum_image_path);
            // 生成图表数据结构
            $forum_image_data = array('forumid' => $forumid_require_result, 'img' => substr($forum_image_path, 2));
            // 把图片路径存入数据表
            $forum_image_result =  $mycon->increase('forum_images', $forum_image_data);
            // echo json_encode($forum_image_result);
        }
    }
    // 去除 TID 时间ID值
    $tid_delete_data = array('_tid' => '0');
    $tid_delete_where = array(
        array('key' => 'id', 'operation' => '=', 'value' => $forumid_require_result, 'next' => 'and'),
        array('key' => '_tid', 'operation' => '=', 'value' => $tid)
    );
    // 删除 TID
    $tid_delete_result = $mycon->update('forum_list', $tid_delete_data, $tid_delete_where);
    // 返回结果集
    if ($tid_delete_result['code'] == 200) echo json_encode(setStatus(200, '帖子发布成功!', null));
    $mycon->close();
}

// 获取讨论信息
function forum_info_require()
{
    $mycon = new MyConnect();
    $forum_info_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['forumid']));
    // 执行并返回结果
    $forum_info_result = $mycon->inquire('forum_list', array("*"), $forum_info_where);

    $forum_images_where = array(array('key' => 'forumid', 'operation' => '=', 'value' => $_POST['forumid']),);
    $forum_images_result = $mycon->inquire('forum_images', array("*"), $forum_images_where);
    $forum_info_result['data'][0]['images'] = $forum_images_result['data'];
    // 循环替换信息
    foreach ($forum_info_result['data'] as $key => $value) {
        $user_require_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $value['userid']));
        $forum_info_result['data'][$key]['userid'] = $mycon->inquire('_db_users', array("*"), $user_require_where)['data'][0]['user_name'];
        $forum_info_result['data'][$key]['date'] = date("Y-m-d H:i:s", $value['date']);
        $forum_info_result['data'][$key]['status'] = $value['status'] == 0 ? '正常' : '异常';
    }
    // 返回数据
    echo json_encode($forum_info_result);
    // 关闭数据库连接
    $mycon->close();
}

//获取讨论信息2
function forum_info_require2()
{
    $mycon = new MyConnect();
    $forum_info_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['forumid']));
    // 执行并返回结果
    $forum_info_result = $mycon->inquire('forum_list', array("*"), $forum_info_where);

    $forum_images_where = array(array('key' => 'forumid', 'operation' => '=', 'value' => $_POST['forumid']),);
    $forum_images_result = $mycon->inquire('forum_images', array("*"), $forum_images_where);
    $forum_info_result['data'][0]['images'] = $forum_images_result['data'];
    // 循环替换信息
    foreach ($forum_info_result['data'] as $key => $value) {
        //     $user_require_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $value['userid']));
        //     $forum_info_result['data'][$key]['userid'] = $mycon->inquire('_db_users', array("*"), $user_require_where)['data'][0]['user_name'];
        $forum_info_result['data'][$key]['date'] = date("Y-m-d H:i:s", $value['date']);
        //     $forum_info_result['data'][$key]['status'] = $value['status'] == 0 ? '正常' : '异常';
    }
    // 返回数据
    echo json_encode($forum_info_result);
    // 关闭数据库连接
    $mycon->close();
}

// 删除图片
function forum_image_delete_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 搭建删除图片条件结构
    $forumImage_delete_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']));
    // 查询图片路径
    $forumImage_list_result = $mycon->inquire('forum_images', array('*'), $forumImage_delete_where);
    if ($forumImage_list_result['code'] == 200) {
        // 获得文件路径
        $filePath = $forumImage_list_result['data'][0]['img'];
        // 判断文件存在且是文件
        if (file_exists('..' . $filePath) && is_file('..' . $filePath)) {
            // 删除文件
            unlink('..' . $filePath);
        }
    }
    // 删除该图片在图片数据表内的信息并返回结果
    $forumImage_delete_result = $mycon->delete('forum_images', $forumImage_delete_where);
    // 输出结果
    echo json_encode($forumImage_delete_result);
    // 关闭数据库连接
    $mycon->close();
}


// 修改讨论
function forum_update_require()
{
    // 讨论图片列表存放路径
    $baseurl = "../uploads/images/forum/";
    // 实例化
    $mycon = new MyConnect();
    // 搭建讨论帖修改数据结构
    $forum_update_data = array(
        // 分类编号
        "typeid" => $_POST['typeid'],
        // 标题
        "title" => $_POST['title'],
        // 内容
        "content" => $_POST['content'],
        // 发布状态
        "status" => $_POST['status'],
    );
    // 处理剩下的图片
    if (count($_FILES) > 0) {
        for ($i = 0; $i < count($_FILES); $i++) {
            if ($_FILES["file$i"] != null) {
                // 生成路径
                $forum_image_path = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES["file$i"]['name'] . '.png'));
                // 移动文件
                move_uploaded_file($_FILES["file$i"]['tmp_name'], $forum_image_path);
                // 生成图表数据结构
                $forum_image_data = array(
                    // 新闻ID值
                    'forumid' => $_POST['id'],
                    'img' => substr($forum_image_path, 2),
                );
                // 把图片路径存入数据表
                $news_image_result =  $mycon->increase('forum_images', $forum_image_data);
                // 输出信息
                // echo json_encode($forum_image_result);
            }
        }
    }
    // 搭建更新条件
    $forum_update_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']));
    // 更新数据并返回结果
    $forum_update_result = $mycon->update('forum_list', $forum_update_data, $forum_update_where);
    // 输出结果
    echo json_encode($forum_update_result);
    // 关闭数据库连接
    $mycon->close();
}
