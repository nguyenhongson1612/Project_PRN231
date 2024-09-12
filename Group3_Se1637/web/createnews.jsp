<%-- 
    Document   : createnews
    Created on : Feb 5, 2023, 10:12:53 PM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="./index.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
            rel="stylesheet"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>

        <div class="container p-5">
            <div class="row">

                <form   id="submit-form" method="post">


                    <div class="input-group mb-3 flex-column">
                        <h2 class="mb-2">Tiêu đề</h2>

                    </div>

                    <input
                        required=""
                        type="text"
                        name="title"
                        class="form-control w-100"
                        placeholder="Hãy chọn tiêu đề cho bài viết..."
                        aria-describedby="basic-addon1"
                        />
                    <br/><!-- comment -->
                    <div>
                        <h4 class = "mb-2"> Description</h4>
                    </div>
                    <input 
                        required
                        type="text"
                        name="desc"
                        class="form-control w-100 mb-3"
                        placeholder="Mô tả ngắn cho bài viết..."    
                        aria-describedby="basic-addon1"
                        />
                    <div class = "mb-3">
                        <h5 class = "mb-2">Chọn nhóm</h5>
                        <select id ="news-type" class="form-select w-auto" aria-label="Type" name="groupnews">


                            <c:forEach items="${requestScope.list}" var="c">
                                <option value="${c.getGid()}">${c.getGroupname()}</option>
                            </c:forEach>
                        </select>

                    </div>   
                    <button type ="button" id ="add-btn" class ="add-btn mb-3 bg-blue text-white rounded-2">
                        Thêm
                    </button>
                    <input type="text" name="addgroup" id ="add-text" class="add-text d-none mb-3"/>
                    <div id="error-message" class="text-danger mb-5 fw-bolder" ></div>

                    <textarea id="summernote" name="content"></textarea>

                    <div class = "d-flex justify-content-center my-5">
                        <div id ='avt' >
                            <div id = "avt-container" class = 'position-relative d-flex align-items-center justify-content-center'>
                                <button type="button" id ="avt-close-btn" class = "d-none btn btn-danger position-absolute p-2 avt-btn rounded-0">
                                    <i class="fa-solid fa-xmark"></i>
                                </button>
                                <div id ="avt-upload" class = "d-flex align-items-center">
                                    <label  class ="p-2 mb-3 bg-blue text-white border rounded-2" for="upload-photo">Chon file</label>
                                    <input type="file" name="img" id="upload-photo" onchange = "onChange()"/>
                                </div>
                            </div>

                        </div>
                    </div>
                    <button
                        id="submit-btn"
                        type="submit"
                        class="btn bg-blue text-white fw-bolder mt-3"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModal"

                        >

                        Xuất bản
                    </button>
                    <!-- sau khi ấn submit thì hiện ra hộp thoại chọn cho phép select tin vào mục nào: Giới thiệu, Tin tức, Đáng chú ý -->
                    <!-- Chon nhom tin -->
                </form>
            </div>
        </div>
        <!-- Button trigger modal -->



        <!-- Modal -->


        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script>
                                        $(document).ready(function () {
                                            $("#summernote").summernote({
                                                height: 300,

                                            });
                                        });
                                       

        </script>
        <script src ="./createnew.js"></script>
    </body>
</html>