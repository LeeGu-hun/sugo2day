<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/xml" %>
<%@ page import="xml.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dataList" class="xml.DataList" />
<%
 List<Data> list = (List) request.getAttribute("datas");
%>
<letterlist>
 <% for (int i = 0; i < list.size(); i++) { %>
  <% Data data = list.get(i); %>
  <item>
   <num><%= data.getL_num() %></num>
   <writer><%= data.getL_writer() %></writer>
   <content><%= data.getL_content() %></content>
   <files><%= data.getL_files() %></files>
   <regdate><%= data.getL_regdate() %></regdate>
   <isquest><%= data.getL_isquest() %></isquest>
   <isprivate><%= data.getL_isprivate() %></isprivate>
   <questcate><%= data.getL_questcate() %></questcate>
  </item>
 <% } %>
</letterlist>
