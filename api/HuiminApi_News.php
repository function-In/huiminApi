<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // 判断请求所需数据的值
    if (empty($_POST['meta']) || $_POST['meta'] == '') die(json_encode(setStatus(203, '无法完成请求！参数错误！', null)));
    // 处理数据
    switch ($_POST['meta']) {
            // 资讯列表请求
        case 'news_list_require':
            news_list_require();
            break;
            // 删除资讯请求
        case 'news_delete_require':
            news_delete_require();
            break;
            // 资讯信息请求
        case 'news_info_require':
            news_info_require();
            break;
            // 资讯信息请求2
        case 'news_info_require2':
            news_info_require2();
            break;
            // 删除图片
        case 'news_image_delete_require':
            news_image_delete_require();
            break;
            // 更新资讯信息
        case 'news_update_require':
            news_update_require();
            break;
            // 资讯图片请求
        case 'news_images_info_require':
            news_images_info_require();
            break;
            // 添加资讯
        case 'news_create_require':
            news_create_require();
            break;
    }
}



// 资讯列表请求
function news_list_require()
{
    $mycon = new MyConnect();
    // 执行并返回结果
    $news_list_result = $mycon->inquire('news_list', array("*"), null);
    // 循环替换信息
    foreach ($news_list_result['data'] as $_key => $_value) {
        $user_require_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $_value['news_userid']));
        $news_list_result['data'][$_key]['news_userid'] = $mycon->inquire('_db_users', array("*"), $user_require_where)['data'][0]['user_name'];
        $news_list_result['data'][$_key]['news_date'] = date("Y-m-d H:i:s", $_value['news_date']);
        $news_list_result['data'][$_key]['news_status'] = $_value['news_status'] == 0 ? '正常' : '异常';
    }
    // 返回数据
    echo json_encode($news_list_result);
    // 关闭数据库连接
    $mycon->close();
}















// 资讯信息请求
function news_info_require()
{
    $mycon = new MyConnect();
    // 搭建查找相关的条件
    $news_info_where = array(array('key' => 'news_id', 'operation' => '=', 'value' => $_POST['newsid']));
    // 执行并返回结果
    $news_info_result = $mycon->inquire('news_list', array("*"), $news_info_where);
    // 循环替换信息
    foreach ($news_info_result['data'] as $_key => $_value) {
        $user_require_where =  array(array('key' => 'id', 'operation' => '=', 'value' => $_value['news_userid']));
        $news_info_result['data'][$_key]['news_userid'] = $mycon->inquire('_db_users', array("*"), $user_require_where)['data'][0]['user_name'];
        $news_info_result['data'][$_key]['news_date'] = date("Y-m-d H:i:s", $_value['news_date']);
        $news_info_result['data'][$_key]['news_status'] = $_value['news_status'] == 0 ? '正常' : '异常';
    }
    // 数据数据
    echo json_encode($news_info_result);
    // 关闭数据库连接
    $mycon->close();
}












// 删除图片
function news_image_delete_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 搭建删除图片条件结构
    $newsImage_delete_where =  array(array('key' => '_id', 'operation' => '=', 'value' => $_POST['id']));
    // 查询图片路径
    $newsImage_list_result = $mycon->inquire('news_images', array('*'), $newsImage_delete_where);
    if ($newsImage_list_result['code'] == 200) {
        // 获得文件路径
        $filePath = $newsImage_list_result['data'][0]['_img'];
        // 判断文件存在且是文件
        if (file_exists('..' . $filePath) && is_file('..' . $filePath)) {
            // 删除文件
            unlink('..' . $filePath);
        }
    }
    // 删除该图片在图片数据表内的信息并返回结果
    $newsImage_delete_result = $mycon->delete('news_images', $newsImage_delete_where);
    // 输出结果
    echo json_encode($newsImage_delete_result);
    // 关闭数据库连接
    $mycon->close();
}















// 资讯信息请求2
function news_info_require2()
{
    $mycon = new MyConnect();
    // 搭建查找相关的条件
    $news_info_where = array(array('key' => 'news_id', 'operation' => '=', 'value' => $_POST['newsid']));
    // 执行并返回结果
    $news_info_result = $mycon->inquire('news_list', array("*"), $news_info_where);

    $news_images_where = array(array('key' => '_newsid', 'operation' => '=', 'value' => $_POST['newsid']),);
    $news_images_result = $mycon->inquire('news_images', array("*"), $news_images_where);
    $news_info_result['data'][0]['images'] = $news_images_result['data'];
    // echo json_encode($news_info_result);
    // 循环替换信息
    foreach ($news_info_result['data'] as $_key => $_value) {
        $news_info_result['data'][$_key]['news_date'] = date("Y-m-d H:i:s", $_value['news_date']);
    }
    // 数据数据
    echo json_encode($news_info_result);
    // 关闭数据库连接
    $mycon->close();
}


















// 更新资讯信息
function news_update_require()
{
    // 新闻列表存放路径
    $baseurl = "../uploads/images/news/";
    // 实例化
    $mycon = new MyConnect();
    // 搭建新闻修改数据结构
    $news_update_data = array(
        // 新闻标题
        "news_name" => $_POST['news_name'],
        // 新闻作者
        "news_author" => $_POST['news_author'],
        // 新闻内容
        "news_content" => html_entity_decode($_POST['news_content']),
        // 发布状态
        "news_status" => $_POST['news_status']
    );
    // 处理封面
    if (!empty($_FILES) && $_FILES['news_image'] != null) {
        // 查询封面原链接条件
        $news_image_inquire_where = array(array('key' => 'news_id', 'operation' => '=', 'value' => $_POST['news_id']));
        // 执行查询并返回结果
        $news_image_inquire_result = $mycon->inquire('news_list', array("*"), $news_image_inquire_where);
        // 根据路径删除原来封面图片
        unlink('..' . $news_image_inquire_result['data'][0]['news_image']);
        // 生成新的封面图片路径
        $news_front = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES['news_image']['name'] . '.png'));
        // 移动文件
        move_uploaded_file($_FILES["news_image"]['tmp_name'], $news_front);
        // 设置新的封面地址
        $news_update_data['news_image'] = substr($news_front, 2);
    }
    // 处理剩下的图片
    if (count($_FILES) > 0) {
        for ($i = 0; $i < count($_FILES); $i++) {
            if ($_FILES["file$i"] != null) {
                // 生成路径
                $news_image_path = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES["file$i"]['name'] . '.png'));
                // 移动文件
                move_uploaded_file($_FILES["file$i"]['tmp_name'], $news_image_path);
                // 生成图表数据结构
                $news_image_data = array(
                    // 新闻ID值
                    '_newsid' => $_POST['news_id'],
                    '_img' => substr($news_image_path, 2),
                );
                // 把图片路径存入数据表
                $news_image_result =  $mycon->increase('news_images', $news_image_data);
                // 输出信息
                // echo json_encode($news_image_result);
            }
        }
    }
    // 搭建新闻更新条件
    $news_update_where = array(array('key' => 'news_id', 'operation' => '=', 'value' => $_POST['news_id']));
    // 更新新闻数据并返回结果
    $news_update_result = $mycon->update('news_list', $news_update_data, $news_update_where);
    // 输出结果
    echo json_encode($news_update_result);
    // 关闭数据库连接
    $mycon->close();
}















// 资讯图片请求
function news_images_info_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 根据新闻ID搭建条件结构
    $newImage_require_where =  array(array('key' => '_newsid', 'operation' => '=', 'value' => $_POST['newsid']));
    // 唯一ID结果
    $newImage_require_result = $mycon->inquire('news_images', array("*"), $newImage_require_where);
    // 输出数据
    echo json_encode($newImage_require_result);
    // 关闭连接
    $mycon->close();
}






















// 删除资讯
function news_delete_require()
{
    // 搭建资讯删除条件结构
    $news_delete_where = array(array('key' => 'news_id', 'operation' => '=', 'value' => $_POST['newsid']),);
    // 实例化数据库对象
    $mycon = new MyConnect();
    // 搭建删除图片条件结构
    $newsImage_delete_where =  array(array('key' => '_newsid', 'operation' => '=', 'value' => $_POST['newsid']));
    // 查询并删除图片路径
    $newsImage_list_result = $mycon->inquire('news_images', array('*'), $newsImage_delete_where);
    if ($newsImage_list_result['code'] == 200) {
        foreach ($newsImage_list_result['data'] as $key => $value) {
            if (file_exists('..' . $value['_img']) && is_file('..' . $value['_img'])) {
                unlink('..' . $value['_img']);
            }
        }
    }
    // 删除封面图片
    unlink('..' . $mycon->inquire('news_list', array('*'), $news_delete_where)['data'][0]['news_image']);
    // 删除图片在图片数据表内的信息并返回结果
    $newsImage_delete_result = $mycon->delete('news_images', $newsImage_delete_where);
    // 输出验证
    // echo json_encode($newsImage_delete_result);
    // 执行删除用户并返回结果
    $news_delete_result = $mycon->delete("news_list", $news_delete_where);
    // 返回结果
    echo json_encode($news_delete_result);
    // 关闭数据库连接
    $mycon->close();
}
















// 添加资讯
function news_create_require()
{
    // 时间ID tid 生成
    $tid = rand(0, time() / 100) + rand(0, time() / 1000);
    // 新闻列表存放路径
    $baseurl = "../uploads/images/news/";
    // 如果默认保存地址不存在则创建文件夹
    if (!file_exists($baseurl)) {
        mkdir($baseurl, 0777, true);
        clearstatcache();
    }
    // 搭建添加新闻的结构
    $news_create_data = array(
        // 图片
        // 新闻标题
        "news_name" => $_POST['news_name'],
        // 新闻作者
        "news_author" => $_POST['news_author'],
        // 发布者
        "news_userid" => '10000',
        // "news_userid" => $_POST['user_id'],
        // 发布时间
        "news_date" => time(),
        // 新闻内容
        "news_content" => $_POST['news_content'],
        // 发布状态
        "news_status" => $_POST['news_status'],
        // 时间ID值
        "_tid" => $tid
    );
    // 实例化
    $mycon = new MyConnect();
    // 判断是否有图片
    if (!empty($_FILES)) {
        // echo json_encode($_FILES);
        // 设置封面路径
        $news_front = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES['file']['name'] . '.png'));
        // 上传封面
        move_uploaded_file($_FILES['file0']['tmp_name'], $news_front);
        // 设置封面显示路径
        $news_create_data['news_image'] = substr($news_front, 2);
        // echo $news_create_data['news_image'];
    }
    // 存入新闻数据库
    $mycon->increase('news_list', $news_create_data);
    // 根据时间ID取得新闻唯一ID
    $newsid_require_where =  array(array('key' => '_tid', 'operation' => '=', 'value' => $tid));
    // 唯一ID结果
    $newsid_require_result = $mycon->inquire('news_list', array("*"), $newsid_require_where)['data'][0]['news_id'];
    // 处理剩下的图片 下标为0的已经用作封面
    if (count($_FILES) > 1) {
        // echo json_encode($_FILES['file0']);
        for ($i = 1; $i < count($_FILES); $i++) {
            // 生成路径
            $news_image_path = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES["file$i"]['name'] . '.png'));
            // 移动文件
            move_uploaded_file($_FILES["file$i"]['tmp_name'], $news_image_path);
            // 生成图表数据结构
            $news_image_data = array(
                // 新闻ID值
                '_newsid' => $newsid_require_result,
                '_img' => substr($news_image_path, 2),
            );
            // 把图片路径存入数据表
            $news_image_result =  $mycon->increase('news_images', $news_image_data);
            // echo json_encode($news_image_result);
        }
    }
    // 去除 TID 时间ID值
    $tid_delete_data = array('_tid' => '0');
    $tid_delete_where = array(
        array('key' => 'news_id', 'operation' => '=', 'value' => $newsid_require_result, 'next' => 'and'),
        array('key' => '_tid', 'operation' => '=', 'value' => $tid)
    );
    // 删除 TID
    $tid_delete_result = $mycon->update('news_list', $tid_delete_data, $tid_delete_where);
    // 返回结果集
    if ($tid_delete_result['code'] == 200) echo json_encode(setStatus(200, '资讯发布成功!', null));
    $mycon->close();
}
