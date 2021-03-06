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

  Init of address component

--%><%@include file="/libs/foundation/global.jsp"%><%
%><%@ page import="com.day.cq.wcm.foundation.forms.FormsHelper,
                   com.day.cq.wcm.foundation.forms.FieldDescription,
                   com.day.cq.wcm.foundation.forms.FieldHelper" %><%
    final String name = FormsHelper.getParameterName(resource);

    FieldHelper.addDescription(slingRequest, new FieldDescription(resource, name + ".firstname"));
    FieldHelper.addDescription(slingRequest, new FieldDescription(resource, name + ".lastname"));
    FieldHelper.addDescription(slingRequest, new FieldDescription(resource, name + ".street1"));
    FieldHelper.addDescription(slingRequest, new FieldDescription(resource, name + ".street2"));
    FieldHelper.addDescription(slingRequest, new FieldDescription(resource, name + ".zip"));
    FieldHelper.addDescription(slingRequest, new FieldDescription(resource, name + ".city"));
    FieldHelper.addDescription(slingRequest, new FieldDescription(resource, name + ".firstname"));
%>
