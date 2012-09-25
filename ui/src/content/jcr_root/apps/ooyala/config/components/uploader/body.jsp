<%--
  Copyright 1997-2009 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================



--%><%@page contentType="text/html"
            pageEncoding="utf-8"
            import="javax.jcr.Node,
                    java.util.Iterator,
                    com.day.cq.wcm.webservicesupport.Configuration,
                    com.day.cq.wcm.webservicesupport.Service,
                    org.apache.commons.lang.StringEscapeUtils,
                    org.apache.sling.api.resource.Resource"%><%
%><%@include file="/libs/foundation/global.jsp"%>
<%@include file="/libs/cq/cloudserviceconfigs/components/configpage/init.jsp"%>
<%
    String id = currentPage.getName();
    String title = StringEscapeUtils.escapeHtml(properties.get("jcr:title", id)); 
    String description = StringEscapeUtils.escapeHtml(properties.get("jcr:description", ""));
    

    String path = resource.getPath();
    String resourceType = resource.getResourceType();
    String dialogPath = (!resourceType.startsWith("/libs") ? "/libs/" : "") + resourceType + "/dialog";  
     
%><body>
    <div><cq:include path="trail" resourceType="cq/cloudserviceconfigs/components/trail"/></div>
    <h1><%= title %></h1>
    <p><%= description %></p>
    <cq:include script="content.jsp" />
    <p>&nbsp;</p>
</body>