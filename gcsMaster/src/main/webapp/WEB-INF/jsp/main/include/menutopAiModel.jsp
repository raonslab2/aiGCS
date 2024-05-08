<%--
  Class Name : EgovIncHeader.jsp
  Description : 화면상단 Header(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.05.18   MBA       신규
 
    author   : 평가계획관리시스템 MBA
    since    : 2021.05.18 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="egovframework.com.cmm.LoginVO" %>
    <div class="menu-container">
        <div class="menu-item " data-tab="1">
            <a href="/gcs/TD0001/TodayWork101.do" data-active="1">
                <div class="icon">
                    <i class='bx bx-folder'></i>
                    <i class='bx bxs-folder'></i>
                </div>
                <span class="link hide">Label 1</span>
            </a>
        </div> 
        <div class="menu-item" data-tab="2">
            <a href="/gcs/TD0001/TodayWork102.do" data-active="2">
                <div class="icon">
                    <i class='bx bx-folder'></i>
                    <i class='bx bxs-folder'></i>
                </div>
                <span class="link hide">Label 2</span>
            </a>
        </div>  
        <div class="menu-item" data-tab="3">
            <a href="/gcs/TD0001/TodayWork103.do" data-active="3">
                <div class="icon">
                    <i class='bx bx-folder'></i>
                    <i class='bx bxs-folder'></i>
                </div>
                <span class="link hide">Label 3</span>
            </a>
        </div>  
        <div class="menu-item" data-tab="4">
            <a href="/gcs/TD0001/TodayWork104.do" data-active="4">
                <div class="icon">
                    <i class='bx bx-folder'></i>
                    <i class='bx bxs-folder'></i>
                </div>
                <span class="link hide">Label 4</span>
            </a>
        </div> 
         
    </div>