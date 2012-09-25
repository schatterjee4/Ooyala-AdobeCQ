<%@page import="com.day.cq.wcm.api.WCMMode"%>
<%@page import="javax.jcr.Node"%>
<%@page session="false" contentType="application/json; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.0"%>
<%@include file="/libs/foundation/global.jsp" %>
<sling:defineObjects />
<%!
    boolean DEBUG = false;

    /*
        For a given node <code>node</code>, this method assumes that the key provided is the name of the 
        property in the node, and assumes that it is the same key needed for the player's parameter. It
        checks to see if the node has the property, and if not, returns with the default value. If the
        default value is null, it returns an empty string.
    */
    String getParameterAsString(Node node, String key, String defaultValue) throws Exception
    {
        String output = key +"="+ (node.hasProperty(key) ? node.getProperty(key).getString() : defaultValue);
        System.out.println("*******" + output);
        return (output == null) ? "" : output;
    }    
    
    
    
    /*
        For a given node <code>node</code>, this method assumes that the key provided is the name of the 
        property in the node, and assumes that it is the same key needed for the player's parameter. It
        checks to see if the node has the property, and if not, returns with the default value. If the
        default value is null, it returns an empty string.
    */
    String getParameterAsBoolean(Node node, String key, int defaultValue) throws Exception
    {
        String output = "";
        if(node.hasProperty(key))
            output = key +"="+ ("on".equals(node.getProperty(key).getString()) ? 1 : 0);
        else
            output = key +"="+ defaultValue;
        System.out.println("*******" + output);
        return output;
    }
%>
<%
    final String videoIdProperty     = "videoid";
    final String playerIdProperty    = "playerID";
    final String widthProperty       = "width";
    final String heightProperty      = "height";
    final String autoPlayProperty	 = "autoPlay";
    
    final boolean isEditMode     = (WCMMode.fromRequest(request) == WCMMode.EDIT);    
    final String videoId         = currentNode.hasProperty(videoIdProperty) ? currentNode.getProperty(videoIdProperty).getString() : null;
    final String playerId        = currentNode.hasProperty(playerIdProperty) ? currentNode.getProperty(playerIdProperty).getString() : null;
    final String width           = currentNode.hasProperty(widthProperty) ? currentNode.getProperty(widthProperty).getString() : null;
    final String height          = currentNode.hasProperty(heightProperty) ? currentNode.getProperty(heightProperty).getString() : null;
    final double randomDigit     = 1000 * Math.random();
    final boolean autoPlay 		 = currentNode.hasProperty(autoPlayProperty) ? currentNode.getProperty(autoPlayProperty).getBoolean() : false;
    
    pageContext.setAttribute("isEditMode", isEditMode);
    pageContext.setAttribute("videoid", videoId);
    pageContext.setAttribute("playerID", playerId);
    pageContext.setAttribute("width", width);
    pageContext.setAttribute("height", height);
    pageContext.setAttribute("videoDivID", videoId + "asdf");
    pageContext.setAttribute("autoPlay", autoPlay);
    
    // response.addHeader("Access-Control-Allow-Origin", "*");
    // response.addHeader("Access-Control-Allow-Credentials", "true");
%>

<%-- ONLY IN AUTHOR MODE --%>
<c:choose>
    <c:when test="${isEditMode}">
        <p>
            <strong>Drag video here to replace.</strong>
        </p>
                
        <ul>
            <c:if test="${empty videoid}">
                <li>Video Not Provided.</li>
            </c:if>       
             
            <c:if test="${empty playerID}">
                <li>Player ID Not Provided.</li>
            </c:if>
        </ul>
    </c:when>
    <c:otherwise></c:otherwise>
</c:choose>

<%-- BOTH AUTHOR AND PUBLISH --%>
<c:choose>
    <c:when test="${ (!empty videoid) && (!empty playerID) }">
        <div id="${ videoDivID }" class='ooyalaVideoDiv' style="<c:if test="${not empty height }">height:${ height }px; </c:if><c:if test="${not empty width  }">width: ${ width  }px;</c:if>">
            <script type="text/javascript" src="http://player.ooyala.com/v3/${playerID}"></script>
            <script type="text/javascript">
                var videoPlayer = OO.Player.create('${ videoDivID }','${videoid}', {
                    <c:if test="${not empty height }">height : '${ height }px',</c:if>
                    <c:if test="${not empty width  }">width  : '${ width  }px',</c:if>
                });
                <c:if test="${autoPlay}">
               		videoPlayer.play();
               	</c:if>
            </script>
        </div>
    </c:when>
</c:choose>