require 'webrick'
require 'erb'


module TriggerHappy
  class InstallPageServer < WEBrick::HTTPServlet::AbstractServlet
  
    def do_GET(req, response)
      response.body = TEMPLATE.result(binding)
      response['Content-Type'] = "text/html"
    end
    
    BOOKMARKLET = <<-EOS
      (function() {
        var PageLoader = {};

        PageLoader.init = function() {
          while ( document.body.childNodes.length >= 1 ) {
            document.body.removeChild( document.body.firstChild );       
          }
          document.documentElement.style.height = '100%';
          document.body.style = {margin:0, height:'100%', overflow:'hidden'};

          this.iframe = document.createElement('iframe');
          this.iframe.setAttribute('src', document.location.href);
          this.iframe.setAttribute('style', 'width:100%;height:100%;');
          this.iframe.setAttribute('allowtransparency', 'true');
          this.iframe.setAttribute('frameborder', '0');
          this.iframe.setAttribute('sandbox', 'allow-same-origin allow-forms allow-scripts');
          this.iframe.setAttribute('scrolling', 'auto');
          document.body.appendChild(this.iframe);

          this.msg = document.createElement('div');
          this.msg.setAttribute('style', 'background-color:red;padding:10px;color:white;position:absolute;top:0;right:0;' );
          document.body.appendChild(this.msg);

          this.openSocket();
        };

        PageLoader.openSocket = function(text, permanent) {
          var self = this,
              ws = new WebSocket("ws://localhost:10101");

          ws.onmessage = function(evt) { 
            self.message("File Changed: " +evt.data); 
            self.refresh();
          };
          ws.onclose = function() { 
            self.message("Server Not Running<br/>Launch with `trigger-happy`", true);
            window.setTimeout(function() {self.openSocket();},500);
          };
          ws.onopen = function() {
            self.message("Connection to Server Opened");
          };
          ws.onerror = function() {
            self.message("An Error Has Occured"); 
          };
        };

        PageLoader.message = function(text, permanent) {
          var msgEl = this.msg;

          msgEl.style.display = 'inherit';
          msgEl.innerHTML = text;
          if (!permanent) {window.setTimeout(function() {msgEl.style.display = 'none';},1500);}
        };

        PageLoader.refresh = function() {
          this.iframe.contentWindow.location.reload(true);
        };

        PageLoader.init();
      })();
    EOS
    
    TEMPLATE = ERB.new <<-EOS
      <!DOCTYPE HTML>
      <html lang="en">
      <head>
      	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      	<title>Install Bookmarklet</title>
      	<meta name="author" content="Alex Gibbons">
      </head>
      <body>
        <p>Drag this link: <a href="javascript:<%= URI.escape(BOOKMARKLET) %>">Make TriggerHappy</a> up to your Bookmarks Toolbar</p>

      </body>
      </html>
    EOS
    
  end
end