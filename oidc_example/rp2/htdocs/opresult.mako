<!DOCTYPE html>

<%!
    import htmlentitydefs
    import re, string

    # this pattern matches substrings of reserved and non-ASCII characters
    pattern = re.compile(r"[&<>\"\x80-\xff]+")

    # create character map
    entity_map = {}

    for i in range(256):
        entity_map[chr(i)] = "&#%d;" % i

    for entity, char in htmlentitydefs.entitydefs.items():
        if entity_map.has_key(char):
            entity_map[char] = "&%s;" % entity

    def escape_entity(m, get=entity_map.get):
        return string.join(map(get, m.group()), "")

    def escape(string):
        return pattern.sub(escape_entity, string)

    def createResult(result):
      """
      Creates a dropdown based on the service configurtion.
      """
      element = ""
      if result[0]:
        element += "<div class='panel-body'><p>You have successfully logged in!</p></div>"
        element += "<table class='table'>"
        element += "<tr>"
        element += "<td>Access token</td>"
        element += "<td>" + str(result[2]) + "</td>"
        element += "</tr>"
        try:
            text = str(result[3].authorization_endpoint)
            element += "<tr>"
            element += "<td>Authorization endpoint</td>"
            element += "<td>" + text + "</td>"
            element += "</tr>"
        except:
            pass
        try:
            text = str(result[3].registration_endpoint)
            element += "<tr>"
            element += "<td>Registration endpoint</td>"
            element += "<td>" + text + "</td>"
            element += "</tr>"
        except:
            pass
        try:
            text = str(result[3].token_endpoint)
            element += "<tr>"
            element += "<td>Token endpoint</td>"
            element += "<td>" + text + "</td>"
            element += "</tr>"
        except:
            pass
        try:
            text = str(result[3].userinfo_endpoint)
            element += "<tr>"
            element += "<td>UserInfo endpoint</td>"
            element += "<td>" + text + "</td>"
            element += "</tr>"
        except:
            pass
        for key, value in result[1].items():
            element += "<tr>"
            element += "<td>" +  escape(unicode(key).encode("utf-8")) + "</td>"
            element += "<td>" + escape(unicode(value).encode("utf-8")) + "</td>"
            element += "</tr>"
        element += '</table>'
      else:
        element += "<p>You have failed to connect to the designated OP with the message:</p><p> " + result[1] + "</p>"
      return element
%>

<html>
  <head>
    <title>pyoidc RP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
      <link href="static/style.css" rel="stylesheet" media="all">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

    <!-- Static navbar -->
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">pyoidc RP</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="logout">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
    </div>

    <div class="container">
     <!-- Main component for a primary marketing message or call to action -->
      <div class="panel panel-default">
        <div class="panel-heading">OP result</div>
          ${createResult(result)}
      </div>

    </div> <!-- /container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/static/jquery.min.1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>


  </body>
</html>