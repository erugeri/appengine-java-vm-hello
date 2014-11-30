<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.demos.hello.server.HelloInfo" %>

<%--
  ~ Copyright (c) 2013 Google Inc. All Rights Reserved.
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License"); you
  ~ may not use this file except in compliance with the License. You may
  ~ obtain a copy of the License at
  ~
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
  ~ implied. See the License for the specific language governing
  ~ permissions and limitations under the License.
  --%>

<%
  UserService userService = UserServiceFactory.getUserService();
  User user = userService.getCurrentUser();
%>

<!DOCTYPE html>

<html>

<head>
  <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
</head>

<body>

  <h2>Hello!</h2>

  <p>Hello, <%= user.getNickname() %>.
     I'm running on <%= HelloInfo.getInfo() %>.
  </p>

  <%-- Will throw an IllegalStateException on runtime --%>
  <%--
  java.lang.IllegalStateException
        at org.apache.jasper.runtime.ServletResponseWrapperInclude.getOutputStream(ServletResponseWrapperInclude.java:65)
        at javax.servlet.ServletResponseWrapper.getOutputStream(ServletResponseWrapper.java:94)
        at com.google.apphosting.vmruntime.CommitDelayingResponse.<init>(CommitDelayingResponse.java:62)
        at com.google.apphosting.vmruntime.CommitDelayingResponseServlet3.<init>(CommitDelayingResponseServlet3.java:23)
        at com.google.apphosting.vmruntime.jetty9.VmRuntimeWebAppContext.doScope(VmRuntimeWebAppContext.java:394)
   --%>
  <jsp:include page="includedPage.jsp" />  
  
</body>
</html>
