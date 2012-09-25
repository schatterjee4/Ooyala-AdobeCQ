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



--%><%--
    Open configuration dialog if the property designated by "connectedWhen" is filled in.
    Derived components may override this to change the opening condition.
    --%>
    <script type="text/javascript">
<% if (((String)properties.get(configuration.getInherited("connectedWhen", "username"), "")).trim().equals("")) { %>
        CQ.WCM.onEditableReady("<%= path %>", function(editable){
            CQ.wcm.EditBase.showDialog(editable);
        }, this);
<% } else {%>
        $CQ(".when-config-successful").show();
<% } %>
    </script>     
