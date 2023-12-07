<?php

use function PHPSTORM_META\type;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // 判断请求所需数据的值
    if (empty($_POST['meta']) || $_POST['meta'] == '') die(json_encode(setStatus(203, '无法完成请求！参数错误！', null)));
    // 处理数据
    switch ($_POST['meta']) {
            // 商品分类列表请求
        case 'shop_type_list_require':
            shop_type_list_require();
            break;
            // 商品分类数量统计请求
        case 'shop_list_count_require':
            shop_list_count_require();
            break;
            // 添加商品分类请求
        case 'shop_type_create_require':
            shop_type_create_require();
            break;
            // 修改分类请求
        case 'shop_type_update_require':
            shop_type_update_require();
            break;
            // 删除分类请求
        case 'shop_type_delete_require':
            shop_type_delete_require();
            break;
            // 商品列表请求
        case 'shop_list_require':
            shop_list_require();
            break;
            // 添加商品请求
        case 'shop_create_require':
            shop_create_require();
            break;
            // 商品删除请求
        case 'shop_delete_require':
            shop_delete_require();
            break;
            // 商品信息请求
        case 'shop_info_require':
            shop_info_require();
            break;
            // 商品信息请求2
        case 'shop_info_require2':
            shop_info_require2();
            break;
            // 更新商品信息请求
        case 'shop_update_require':
            shop_update_require();
            break;
            // 删除图片请求
        case "shop_image_delete_require":
            shop_image_delete_require();
            break;





            // 获取商品分类列表     (前台)
        case 'shop_type_web':
            shop_type_web();
            break;
            // 获取商品信息     (前台)
        case "shop_info_web":
            shop_info_web();
            break;
            // 获取商品列表  （前台）
        case "shop_list_web":
            shop_list_web();
            break;
            // 取得收货地址  （前台）
        case 'address_list_web':
            address_list_web();
            break;
            // 创建订单 （前台）
        case 'shop_create_mylist_web':
            shop_create_mylist_web();
            break;
    }
}








// 创建订单
function shop_create_mylist_web()
{
    // 解析
    $si = json_decode($_POST['shop']);
    // 获取价格(计算)
    $price = 0;
    foreach ($si->shopList as $key => $value) {
        $price = $price + floatval($value->shop->shop_price) * intval($value->count);
    }
    // 格式化金额（保留两位小数）
    $price = number_format($price, 2, '.', '');

    // 搭建数据结构
    $dingdan_create_data = array(
        // 商品列表
        "shop" => json_encode($si->shopList),
        // 订单下单用户
        "userid" => $si->address->userid,
        // 用户地址
        "address" => json_encode($si->address),
        // 订单时间
        "time" => time(),
        // 商品总价格
        "price" => $price,
        // 商品数量
        "count" => count($si->shopList)
    );

    $mycon = new MyConnect();
    // 减少余额
    $user_info_where = array(array('key' => 'id', 'operation' => '=', 'value' => $si->address->userid),);
    $user_info_result = $mycon->inquire('_db_users', array('*'), $user_info_where);
    $user_update_data = array('user_money' => floatval($user_info_result['data'][0]['user_money']) - $price);
    $user_update_result = $mycon->update('_db_users', $user_update_data, $user_info_where);
    $dingdan_create_result = $mycon->increase('dingdan', $dingdan_create_data);
    echo json_encode($dingdan_create_result);
    $mycon->close();
}



// 取得收货地址
function address_list_web()
{
    if (!empty($_SESSION) && isset($_SESSION['userinfo'])) {
        $mycon = new MyConnect();
        // 特定条件
        $address_list_where = array(array('key' => 'userid', 'operation' => '=', 'value' => $_SESSION['userinfo']['id']),);
        // 执行并返回结果
        $address_list_result = $mycon->inquire('address_list', array('*'), $address_list_where);
        // 返回字段
        echo json_encode($address_list_result);
        // 关闭数据库连接
        $mycon->close();
    } else {
        echo json_encode(setStatus(300, '未登陆状态！', NULL));
    }
}


// 获取商品详情信息
function shop_info_web()
{
    $mycon = new MyConnect();
    $shop_info_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['shopid']));
    $shop_info_result = $mycon->inquire('shop_list', array("*"), $shop_info_where);
    $shop_image_where = array(array('key' => 'shop_id', 'operation' => '=', 'value' => $_POST['shopid']));
    $shop_image_result = $mycon->inquire('shop_images', array("*"), $shop_image_where)['data'];
    $shop_info_result['data'][0]['images'] = $shop_image_result;
    // 输出结果
    echo json_encode($shop_info_result);
    // 关闭数据库的连接
    $mycon->close();
}



// 获取商品列表
function shop_list_web()
{
    // 实例化
    $mycon = new MyConnect();
    // 搭建商品查询条件结构
    $shop_list_where = array(array('key' => 'shop_type', 'operation' => '=', 'value' => $_POST['shop_type']),);
    // 查询评论
    $shop_list_result = $mycon->inquireByLimit('shop_list', array('*'), $shop_list_where, json_decode($_POST['limit']));
    // 多表
    foreach ($shop_list_result['data'] as $key => $value) {
        $shop_image_where = array(array('key' => 'shop_id', 'operation' => '=', 'value' => $value['id']));
        $shop_image_result = $mycon->inquire('shop_images', array("*"), $shop_image_where)['data'];
        $shop_list_result['data'][$key]['images'] = $shop_image_result;
    }
    // 返回数据
    echo json_encode($shop_list_result);
    // 关闭数据库链接
    $mycon->close();
}

// 获取商品分类列表
function shop_type_web()
{
    // 实例化
    $mycon = new MyConnect();
    // 读所有分类
    $shop_type_list_result = $mycon->inquire('shop_type', array("*"), null);
    // 查询商品
    // foreach ($shop_type_list_result['data'] as $key => $value) {
    //     
    // }
    // 输出结果
    echo json_encode($shop_type_list_result);
    // 关闭数据库的连接
    $mycon->close();
}
















// 商品分类列表请求
function shop_type_list_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 读所有分类
    $shop_type_list_result = $mycon->inquire('shop_type', array("*"), null);
    // 查询数量
    foreach ($shop_type_list_result['data'] as $key => $value) {
        $shop_count_where = array(array('key' => 'shop_type', 'operation' => '=', 'value' => $value['id']));
        $shop_count_result = $mycon->inquire('shop_list', array("count(*)"), $shop_count_where)['data'][0]['count(*)'];
        $shop_type_list_result['data'][$key]['count'] = $shop_count_result;
    }
    // 输出结果
    echo json_encode($shop_type_list_result);
    // 关闭数据库的连接
    $mycon->close();
}

















// 分类商品数量统计请求
function shop_list_count_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 条件
    $shop_count_where = array(array('key' => 'shop_type', 'operation' => '=', 'value' => $_POST['shopid']));
    // 读所有
    $shop_count_result = $mycon->inquire('shop_list', array("count(*)"), $shop_count_where);
    // 输出结果
    echo json_encode(setStatus(200, '计算成功！', array(array('count' => $shop_count_result['data'][0]['count(*)']))));
    // 关闭数据库的连接
    $mycon->close();
}





















// 添加商品分类请求
function shop_type_create_require()
{
    // 搭建创建分类数据结构
    $shop_type_create_data = array("name" => $_POST['name']);
    // 实例化
    $mycon = new MyConnect();
    // 执行创建分类并返回结果 `
    $shop_type_create_result = $mycon->increase('shop_type', $shop_type_create_data);
    // 输出结果
    echo json_encode($shop_type_create_result);
    // 关闭数据库连接
    $mycon->close();
}





















// 修改分类请求
function shop_type_update_require()
{
    // 搭建修改分类数据结构
    $shop_type_update_data = array("name" => $_POST['name']);
    //  条件
    $shop_type_update_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']));
    // 实例化
    $mycon = new MyConnect();
    // 执行创建分类并返回结果
    $shop_type_update_result = $mycon->update('shop_type', $shop_type_update_data, $shop_type_update_where);
    // 输出结果
    echo json_encode($shop_type_update_result);
    // 关闭数据库连接
    $mycon->close();
}

















// 删除分类请求
function shop_type_delete_require()
{
    // 搭建分类删除条件结构
    $shop_list_delete_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']),);
    // 实例化数据库对象
    $mycon = new MyConnect();
    // 执行删除分类并返回结果
    $shop_list_delete_result = $mycon->delete("shop_type", $shop_list_delete_where);
    // 返回结果
    echo json_encode($shop_list_delete_result);
    // 关闭数据库连接
    $mycon->close();
}




















// 商品列表请求
function shop_list_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 读所有
    $shop_list_result = $mycon->inquire('shop_list', array("*"), null);
    // 替换结果
    foreach ($shop_list_result['data'] as $key => $value) {
        // 商品分类查询
        $shop_type_name_where = array(array('key' => 'id', 'operation' => '=', 'value' => $value['shop_type']),);
        $shop_type_name_result = $mycon->inquire('shop_type', array("*"), $shop_type_name_where);
        // 转换分类显示
        $shop_list_result['data'][$key]['shop_type'] = $shop_type_name_result['data'][0]['name'];
    }
    // 输出结果
    echo json_encode($shop_list_result);
    // 关闭数据库的连接
    $mycon->close();
}




















// 商品删除请求
function shop_delete_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 删除相关图片
    $shop_image_where = array(array('key' => 'shop_id', 'operation' => '=', 'value' => $_POST['id']));
    // 获得图片相关路径
    $shop_image_result = $mycon->inquire('shop_images', array('*'), $shop_image_where);
    // 循环删除图片
    if ($shop_image_result['code'] == 200) {
        foreach ($shop_image_result['data'] as $key => $value) {
            if (file_exists('..' . $value['img']) && is_file('..' . $value['img'])) {
                unlink('..' . $value['img']);
            }
        }
    }
    // 删除在数据表里面的记录
    $shop_image_delete_result = $mycon->delete('shop_images', $shop_image_where);
    // 搭建删除帖子的条件
    $shop_delete_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']));
    // 删除帖子
    $shop_delete_result = $mycon->delete('shop_list', $shop_delete_where);
    // 输出结果
    echo json_encode($shop_delete_result);
    // 关闭数据库的连接
    $mycon->close();
}






















// 商品信息请求
function shop_info_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 信息查询条件
    $shop_info_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['shopid']),);
    // 读所有
    $shop_list_result = $mycon->inquire('shop_list', array("*"), $shop_info_where);
    // 替换结果
    foreach ($shop_list_result['data'] as $key => $value) {
        // 商品分类查询
        $shop_type_name_where = array(array('key' => 'id', 'operation' => '=', 'value' => $value['shop_type']),);
        $shop_type_name_result = $mycon->inquire('shop_type', array("*"), $shop_type_name_where);
        // 转换分类显示
        $shop_list_result['data'][$key]['shop_type'] = $shop_type_name_result['data'][0]['name'];
    }
    // 查询图片
    $shop_images_where = array(array('key' => 'shop_id', 'operation' => '=', 'value' => $_POST['shopid']),);
    $shop_images_result = $mycon->inquire('shop_images', array("*"), $shop_images_where);
    $shop_list_result['data'][0]['images'] = $shop_images_result['data'];
    // 输出结果
    echo json_encode($shop_list_result);
    // 关闭数据库的连接
    $mycon->close();
}

// 商品信息请求2
function shop_info_require2()
{
    // 实例化
    $mycon = new MyConnect();
    // 信息查询条件
    $shop_info_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['shopid']),);
    // 读所有
    $shop_list_result = $mycon->inquire('shop_list', array("*"), $shop_info_where);
    // 查询图片
    $shop_images_where = array(array('key' => 'shop_id', 'operation' => '=', 'value' => $_POST['shopid']),);
    $shop_images_result = $mycon->inquire('shop_images', array("*"), $shop_images_where);
    $shop_list_result['data'][0]['images'] = $shop_images_result['data'];
    // 输出结果
    echo json_encode($shop_list_result);
    // 关闭数据库的连接
    $mycon->close();
}





















// 删除图片请求
function shop_image_delete_require()
{
    // 实例化
    $mycon = new MyConnect();
    // 删除相关图片条件
    $shop_image_delete_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']));
    // 获得图片相关路径
    $shop_image_delete_result = $mycon->inquire('shop_images', array('*'), $shop_image_delete_where);
    if (file_exists('..' . $shop_image_delete_result['data'][0]['img']) && is_file('..' . $shop_image_delete_result['data'][0]['img'])) {
        unlink('..' . $shop_image_delete_result['data'][0]['img']);
    }
    // 删除在数据表里面的记录
    $shop_image_delete_result = $mycon->delete('shop_images', $shop_image_delete_where);
    echo json_encode($shop_image_delete_result);
    $mycon->close();
}


















// 更新商品信息
function shop_update_require()
{
    // 商品图片列表存放路径
    $baseurl = "../uploads/images/shop/";
    // 实例化
    $mycon = new MyConnect();

    // 搭建修改商品数据结构
    $shop_update_data = array(
        // 分类
        "shop_type" => $_POST['shop_type'],
        // 名称
        "shop_name" => $_POST['shop_name'],
        // 描述
        "shop_content" => $_POST['shop_content'],
        // 价格
        "shop_price" => $_POST['shop_price'],
        // 库存
        "shop_count" => $_POST['shop_count'],
    );

    // 处理新图片
    if (!empty($_FILES) && count($_FILES) > 0) {
        for ($i = 0; $i < count($_FILES); $i++) {
            // 生成路径
            $shop_image_path = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES["file$i"]['name'] . '.png'));
            // 移动文件
            move_uploaded_file($_FILES["file$i"]['tmp_name'], $shop_image_path);
            // 生成图表数据结构
            $shop_image_data = array('img' => substr($shop_image_path, 2), 'shop_id' => $_POST['id']);
            // 把图片路径存入数据表
            $shop_image_result =  $mycon->increase('shop_images', $shop_image_data);
        }
    }
    // 搭建商品更新条件
    $shop_update_where = array(array('key' => 'id', 'operation' => '=', 'value' => $_POST['id']));
    // 更新新闻数据并返回结果
    $shop_update_result = $mycon->update('shop_list', $shop_update_data, $shop_update_where);
    // 输出结果
    echo json_encode($shop_update_result);
    // 关闭数据库连接
    $mycon->close();
}























// 添加商品
function shop_create_require()
{

    // 时间ID tid 生成
    $tid = rand(0, time() / 100) + rand(0, time() / 1000);
    // 讨论图片列表存放路径
    $baseurl = "../uploads/images/shop/";
    // 如果默认保存地址不存在则创建文件夹
    if (!file_exists($baseurl)) {
        mkdir($baseurl, 0777, true);
        clearstatcache();
    }
    // 搭建发表帖子的结构
    $shop_create_data = array(
        // 分类
        "shop_type" => $_POST['shop_type'],
        // 标题
        "shop_name" => $_POST['shop_name'],
        // 描述
        "shop_content" => $_POST['shop_content'],
        // 价格
        "shop_price" => $_POST['shop_price'],
        // 库存
        "shop_count" => $_POST['shop_count'],
        // 时间ID值
        "_tid" => $tid
    );
    // 实例化
    $mycon = new MyConnect();
    // 存入商品数据库
    $mycon->increase('shop_list', $shop_create_data);
    // 根据TID取得新闻唯一ID
    $shop_id_require_where =  array(array('key' => '_tid', 'operation' => '=', 'value' => $tid));
    // 唯一ID结果
    $shop_id_require_result = $mycon->inquire('shop_list', array("*"), $shop_id_require_where)['data'][0]['id'];
    // 上传图片
    if (!empty($_FILES) && count($_FILES) > 0) {
        for ($i = 0; $i < count($_FILES); $i++) {
            // 生成路径
            $shop_image_path = $baseurl . time() . '_' . rand(time(), 9999999999) . '.' . end(explode('.', $_FILES["file$i"]['name'] . '.png'));
            // 移动文件
            move_uploaded_file($_FILES["file$i"]['tmp_name'], $shop_image_path);
            // 生成图表数据结构
            $shop_image_data = array(
                // 图片路径
                'img' => substr($shop_image_path, 2),
                // 商品编号
                'shop_id' => $shop_id_require_result,
            );
            // 把图片路径存入数据表
            $discuss_image_result =  $mycon->increase('shop_images', $shop_image_data);
        }
    }
    // 去除 TID 时间ID值
    $tid_delete_data = array('_tid' => '0');
    $tid_delete_where = array(
        array('key' => 'id', 'operation' => '=', 'value' => $shop_id_require_result, 'next' => 'and'),
        array('key' => '_tid', 'operation' => '=', 'value' => $tid)
    );
    // 删除 TID
    $tid_delete_result = $mycon->update('shop_list', $tid_delete_data, $tid_delete_where);
    // 返回结果集
    if ($tid_delete_result['code'] == 200) echo json_encode(setStatus(200, '商品发布成功!', null));
    $mycon->close();
}
