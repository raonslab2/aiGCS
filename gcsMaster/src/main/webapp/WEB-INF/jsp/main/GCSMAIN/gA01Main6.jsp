<%--
  Class Name : gA02Main.jsp
  Description : GCS
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2021.11.01   SCJ       GCS 생성
 
    author   : SCJ
    since    : 2021.11.01
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<link rel="icon" href="/images/favicon.svg" type="image/svg+xml" />
<title></title> 
        <meta name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <c:import url="/EmpPageLink.do?link=main/include/src" />   
 
 
  <style>
    table,th,td
    {
      border:2px solid white;
    }
    table
    {
      border-collapse:collapse;
      width:100%;
    }
    td
    {
      height:60px;
      text-align:center;
    }
    tr
    {
      background-color:green;
      color:white;
    }
    th
    {
      background-color:green;
      color:black;
    }
  </style>
 

</head> 
<body> 
    <table>
      <tr>
        <th>1</th>
        <th>2</th>
        <th>3</th>
        <th>4</th>
        <th>5</th>
        <th>6</th>
        <th>7</th>
        <th>8</th>
        <th>9</th>
        <th>10</th>
      </tr>
      <tr>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
      </tr>
      <tr>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#01DF01;">0.125</td>

        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
      </tr>
      <tr>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#04B431;">0.455</td>

      </tr>
      <tr>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#01DF01;">0.125</td>

        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
      </tr>
      <tr>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#04B404;">0.333</td>

        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
      </tr>
      <tr>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#04B431;">0.455</td>

      </tr>
      <tr>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
      </tr>
      <tr>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
      </tr>
      <tr>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
      </tr>
      <tr>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B431;">0.455</td>
        <td style="background-color:#04B404;">0.333</td>
        <td style="background-color:#01DF01;">0.125</td>
        <td style="background-color:#A9F5BC;">0.122</td>
        <td style="background-color:#81F781;">0.145</td>

        <td style="background-color:#81F781;">0.145</td>
        <td style="background-color:#A9F5BC;">0.122</td>
      </tr>
  
    </table>
</body>
</html>
