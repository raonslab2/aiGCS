<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title> 
<link rel="stylesheet" href="/common/css/gA03Main.css"> <!-- 새로운 CSS 파일 추가 -->
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/gcs/gA03Main.js"></script>
</head>

<body page-data="menu-project">
    <!-- left menu List -->
    <c:import url="/EmpPageLink.do?link=main/include/droneHeadMenu" />

    <main> <!-- content st -->
        <div class="content-container">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-header">
								<div class="local-position">
								    <div class="left-group">
								        <a href="/gcs/dashboard/projectMain1001.do">최근 프로젝트</a> | 
								        <a href="#">나의 프로젝트</a> |
								        <a href="#">조직 프로젝트</a>
								    </div>
								    <div class="view-switch-buttons">
								        <label for="tmLat">Latitude:</label>
								        <input type="text" id="tmLat" style="width:120px;" name="tmLat" value="" class="position-input">
								        <label for="tmLng">Longitude:</label>
								        <input type="text" style="width:120px;" id="tmLng" name="tmLng" value="" class="position-input">
								        <a id="createRouterPath" href="#" class="add-plan-link">
								            <button type="button" class="btn_style02 btn_green">
								                3D Plan <span>▷</span>
								            </button>
								        </a>
								        <a id="createRouterPolygonPath" href="#" class="add-plan-link">
								            <button type="button" class="btn_style02 btn_green">
								                2D Plan <span>▷</span>
								            </button>
								        </a>
								    </div>
								</div>

                            
                                <div class="local-position" style="margin-top:20px;">
                                    <div class="left-group">

                                    </div> 
									<!-- gA03Main.jsp 파일에서 view-switch-buttons 영역 수정 -->
									<div class="view-switch-buttons">
									    <button class="toggle-button list-view active" id="viewSwitchToggle"></button>
									</div> 
                                </div>
                            </div>
                            <form id="searchForm">
                            <input type="hidden" id="page" name="page" value="">
                            <input type="hidden" id="pageUnit" name="pageUnit" value="15">
                            </form>

                            <div class="card-body" style="margin-top: 20px;">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 5%" onclick="sortTable(0)">ID</th>
                                                <th scope="col" style="width: 100px">Map</th>
                                                <th scope="col" onclick="sortTable(2)">Mission Name</th>
                                                <th scope="col" onclick="sortTable(3)">Address</th>
                                                <th scope="col" style="width: 7%">Edit</th>
                                                <th scope="col" style="width: 7%">DEL</th>
                                                <th scope="col" style="width: 8%" onclick="sortTable(6)">Reg</th>
                                            </tr>
                                        </thead>
                                        <tbody id="resultList">


                                        </tbody>
                                    </table>
                                </div>
                                <div class="gallery" id="galleryView" style="display:none;">
                                    <!-- Gallery items will be inserted here -->
                                </div>
                                <div class="bbs_page">
                                    <ul class="pagination">
                                    </ul>
                                </div>
                                <!-- e :bbs_page -->
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- content ed -->
        <p class="copyright">
            &copy; 2020 - <span>RaonsLab</span> All Rights Reserved.
        </p>
    </main>
</body>

</html>
