<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="icon" href="common/img/web-title.ico" type="image/x-icon"/>
    <title>webuploader测试</title>
    <%@ include file="../../common/include/dependent.jsp" %>
</head>
<body>

<h3>图片上传</h3>
<!--dom结构部分-->
<div id="uploader-demo">
    <!--用来存放item-->
    <div id="fileList" class="uploader-list"></div>
    <div id="upInfo" ></div>
    <div id="filePicker">选择文件</div>
</div>
<input type="button" id="btn" value="开始上传">

<link rel="stylesheet" type="text/css" href="${ctxPlugins}/webuploader/0.1.5/webuploader.css">

<script src="${ctxPlugins}/webuploader/0.1.5/webuploader.js" type="text/javascript"></script>
<script>
    // 图片上传demo
    jQuery(function() {
        var $ = jQuery,
            $list = $('#fileList'),
            // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,
            // 缩略图大小
            thumbnailWidth = 200 * ratio,
            thumbnailHeight = 200 * ratio,
            // Web Uploader实例
            uploader;
        // 初始化Web Uploader
        uploader = WebUploader.create({
            // 自动上传。
            auto: true,
            // swf文件路径
            swf:'../js/Uploader.swf',
            // 文件接收服务端。
            server: '${ctx}/uploader/images',
            threads:'5',        //同时运行5个线程传输
            fileNumLimit:'3',  //文件总数量只能选择10个

            // 选择文件的按钮。可选。
            pick: {id:'#filePicker',  //选择文件的按钮
                multiple:true},   //允许可以同时选择多个图片
            // 图片质量，只有type为`image/jpeg`的时候才有效。
            quality: 90,

            //限制传输文件类型，accept可以不写
            accept: {
                title: 'Images',//描述
                extensions: 'gif,jpg,jpeg,bmp,png,zip',//类型
                mimeTypes: 'image/*'//mime类型
            }
        });


        // 当有文件添加进来的时候，创建img显示缩略图使用
        uploader.on( 'fileQueued', function( file ) {
            var $li = $(
                '<div id="' + file.id + '" class="file-item thumbnail">' +
                '<img>' +
                '<div class="info">' + file.name + '</div>' +
                '</div>'
                ),
                $img = $li.find('img');

            // $list为容器jQuery实例
            $list.append( $li );

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr( 'src', src );
            }, thumbnailWidth, thumbnailHeight );
        });

        // 文件上传过程中创建进度条实时显示。    uploadProgress事件：上传过程中触发，携带上传进度。 file文件对象 percentage传输进度 Nuber类型
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                $percent = $li.find('.progress span');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<p class="progress"><span></span></p>')
                    .appendTo( $li )
                    .find('span');
            }

            $percent.css( 'width', percentage * 100 + '%' );
        });

        // 文件上传成功时候触发，给item添加成功class, 用样式标记上传成功。 file：文件对象，    response：服务器返回数据
        uploader.on( 'uploadSuccess', function( file,response) {
            $( '#'+file.id ).addClass('upload-state-done');
            //console.info(response);
            $("#upInfo").html("<font color='red'>"+response._raw+"</font>");
        });

        // 文件上传失败                                file:文件对象 ， code：出错代码
        uploader.on( 'uploadError', function(file,code) {
            var $li = $( '#'+file.id ),
                $error = $li.find('div.error');

            // 避免重复创建
            if ( !$error.length ) {
                $error = $('<div class="error"></div>').appendTo( $li );
            }

            $error.text('上传失败!');
        });

        // 不管成功或者失败，文件上传完成时触发。 file： 文件对象
        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress').remove();
        });

    });
</script>
</body>

<%--<script type="text/javascript">--%>
    <%--$(document).ready(function(){--%>
        <%--var $ = jQuery,--%>
            <%--$list = $('#thelist'),--%>
            <%--$btn = $('#ctlBtn'),--%>
            <%--state = 'pending';--%>
         <%--var uploader = WebUploader.create({--%>
            <%--swf: '${ctxPlugins}/webuploader/0.1.5/Uploader.swf',--%>

            <%--// 文件接收服务端。--%>
            <%--server: '${ctx}/uploader/images',--%>

            <%--// 选择文件的按钮。可选。--%>
            <%--// 内部根据当前运行是创建，可能是input元素，也可能是flash.--%>
            <%--pick: '#picker',--%>
            <%--auto:true,--%>
            <%--// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！--%>
            <%--resize: false--%>
            <%--});--%>
        <%--// 当有文件添加进来的时候--%>
        <%--uploader.on( 'fileQueued', function( file ) {--%>
            <%--$list.append( '<div id="' + file.id + '" class="item">' +--%>
                <%--'<h4 class="info">' + file.name + '</h4>' +--%>
                <%--'<p class="state">等待上传...</p>' +--%>
                <%--'</div>' );--%>
        <%--});--%>

        <%--// 文件上传过程中创建进度条实时显示。--%>
        <%--uploader.on( 'uploadProgress', function( file, percentage ) {--%>
            <%--var $li = $( '#'+file.id ),--%>
                <%--$percent = $li.find('.progress .progress-bar');--%>

            <%--// 避免重复创建--%>
            <%--if ( !$percent.length ) {--%>
                <%--$percent = $('<div class="progress progress-striped active">' +--%>
                    <%--'<div class="progress-bar" role="progressbar" style="width: 0%">' +--%>
                    <%--'</div>' +--%>
                    <%--'</div>').appendTo( $li ).find('.progress-bar');--%>
            <%--}--%>

            <%--$li.find('p.state').text('上传中');--%>

            <%--$percent.css( 'width', percentage * 100 + '%' );--%>
        <%--});--%>

        <%--uploader.on( 'uploadSuccess', function( file ) {--%>
            <%--$( '#'+file.id ).find('p.state').text('已上传');--%>
        <%--});--%>

        <%--uploader.on( 'uploadError', function( file ) {--%>
            <%--$( '#'+file.id ).find('p.state').text('上传出错');--%>
        <%--});--%>

        <%--uploader.on( 'uploadComplete', function( file ) {--%>
            <%--$( '#'+file.id ).find('.progress').fadeOut();--%>
        <%--});--%>

        <%--uploader.on( 'all', function( type ) {--%>
            <%--if ( type === 'startUpload' ) {--%>
                <%--state = 'uploading';--%>
            <%--} else if ( type === 'stopUpload' ) {--%>
                <%--state = 'paused';--%>
            <%--} else if ( type === 'uploadFinished' ) {--%>
                <%--state = 'done';--%>
            <%--}--%>

            <%--if ( state === 'uploading' ) {--%>
                <%--$btn.text('暂停上传');--%>
            <%--} else {--%>
                <%--$btn.text('开始上传');--%>
            <%--}--%>
        <%--});--%>

        <%--$btn.on( 'click', function() {--%>
            <%--if ( state === 'uploading' ) {--%>
                <%--uploader.stop();--%>
            <%--} else {--%>
                <%--uploader.upload();--%>
            <%--}--%>
        <%--});--%>
    <%--})--%>
 <%-- </script> --%>
</html>