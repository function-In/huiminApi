<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // 判断请求所需数据的值
    if (empty($_POST['meta']) || $_POST['meta'] == '') die(json_encode(setStatus(203, '无法完成请求！参数错误！', null)));
    // 处理数据
    switch ($_POST['meta']) {
        case 'comment_list_require':
            comment_list_require();
            break;
        case "comment_delete_require":
            comment_delete_require();
            break;
            // 创建评论     (前台)
        case "comment_create_web":
            comment_create_web();
            break;
            // 获取对应评论     (前台)
        case 'comment_list_web':
            comment_list_web();
            break;
            // 删除评论
        case 'comment_remove_web':
            comment_remove_web();
            break;
    }
}

// 删除评论
function comment_remove_web()
{
    // 搭建用户删除条件结构
    $comment_delete_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['commentid']),);
    // 实例化数据库对象
    $mycon = new MyConnect();
    // 执行删除用户并返回结果
    $comment_delete_result = $mycon->delete("comment_list", $comment_delete_where);
    // 返回结果
    echo json_encode($comment_delete_result);
    // 关闭数据库连接
    $mycon->close();
}

// 查询评论     (前台)
function comment_list_web()
{
    $mycon = new MyConnect();
    // 搭建评论查询条件结构
    $comment_list_where = array(
        array('key' => 'type', 'operation' => '=', 'value' => $_POST['type'], 'next' => 'and'),
        array('key' => 'typeid', 'operation' => '=', 'value' => $_POST['typeid']),
    );
    // 查询评论
    $comment_list_result = $mycon->inquireByLimit('comment_list', array('*'), $comment_list_where, json_decode($_POST['limit']));
    // 多表
    foreach ($comment_list_result['data'] as $key => $value) {
        $user_require_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $value['userid']));
        $user_require_result = $mycon->inquire('_db_users', array("*"), $user_require_where)['data'][0];
        $comment_list_result['data'][$key]['userHeader'] = $user_require_result['user_header'];
        $comment_list_result['data'][$key]['userName'] = $user_require_result['user_name'];
        $comment_list_result['data'][$key]['userSign'] = $user_require_result['user_sign'];
        $comment_list_result['data'][$key]['date'] = date("Y-m-d H:i:s", $value['date']);
        // $comment_list_result['data'][$key]['image'] = 'aaaaaaa';
    }
    // 返回数据
    echo json_encode($comment_list_result);
    // 关闭数据库链接
    $mycon->close();
}

// 创建评论     (前台)
function comment_create_web()
{
    // 实例化数据库对象
    $mycon = new MyConnect();
    $comment_create_data = array(
        // 类型
        "type" => $_POST['type'],
        // 类型所属的对应编号
        "typeid" => $_POST['typeid'],
        // 用户id
        "userid" => $_POST['userid'],
        // 发布内容
        "content" => $_POST['content'],
        // 发布时间
        "date" => time(),
    );
    $comment_create_result = $mycon->increase('comment_list', $comment_create_data);
    echo json_encode($comment_create_result);
    $mycon->close();
}

// 获取评论列表
function comment_list_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 读所有
    $comment_list_result = $mycon->inquire('comment_list', array("*"), null);
    // 查询数量
    foreach ($comment_list_result['data'] as $key => $value) {
        // $forum_count_where = array(array('key' => 'typeid', 'operation' => '=', 'value' => $value['id']));
        // $forum_count_result = $mycon->inquire('forum_list', array("count(*)"), $forum_count_where)['data'][0]['count(*)'];
        $user_require_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $value['userid']));
        $comment_list_result['data'][$key]['userid'] = $mycon->inquire('_db_users', array("*"), $user_require_where)['data'][0]['user_name'];
        $comment_list_result['data'][$key]['date'] = date("Y-m-d H:i:s", $value['date']);;
    }
    // 输出结果
    echo json_encode($comment_list_result);
    // 关闭数据库的连接
    $mycon->close();
}


// 删除评论
function comment_delete_require()
{
    // 搭建评论删除条件结构
    $comment_delete_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']),);
    // 实例化数据库对象
    $mycon = new MyConnect();
    // 执行删除分类并返回结果
    $comment_delete_result = $mycon->delete("comment_list", $comment_delete_where);
    // 返回结果
    echo json_encode($comment_delete_result);
    // 关闭数据库连接
    $mycon->close();
}
