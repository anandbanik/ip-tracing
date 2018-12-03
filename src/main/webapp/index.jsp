<%@ page import="java.util.Enumeration" %>
<html>
<body>
<h2>IP Trace</h2>
<%

String remoteAddr = "";

if (request != null) {
    remoteAddr = request.getHeader("X-FORWARDED-FOR");
    if (remoteAddr == null || "".equals(remoteAddr)) {
        remoteAddr = request.getRemoteAddr();
    }
}

%>

<h3>Source IP is <%= remoteAddr %></h3>


<h3> Request Headers</h3>
<table border=1 cellpadding=5>
          <tr>
            <th>Key</th>
            <th>Value</th>
          </tr>
<%
		Enumeration headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = (String) headerNames.nextElement();
            String value = request.getHeader(key);
            %>	
            <tr>
            <td><%= key%></td>
            <td><%= value%>
            </tr>
        <% } %>    
</table>
</body>
</html>
