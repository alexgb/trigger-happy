require 'webrick'
require 'erb'



class InstallPageServer < HTTPServlet::AbstractServlet
  TEMPLATE = ERB.new <<-EOF
    <!DOCTYPE HTML>
    <html lang="en">
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    	<title>Install Bookmarklet</title>
    	<meta name="author" content="Alex Gibbons">
    </head>
    <body>
      <p>Drag this link: <a href="javascript:<%= URI.escape(File.open(File.join(File.expand_path(File.dirname(__FILE__)), 'public/bookmarklet.js')).read) %>">Make TriggerHappy</a> up to your Bookmarks Toolbar</p>

    </body>
    </html>
  EOF
  
  def do_GET(req, response)
    response.body = TEMPLATE.result(binding)
    response['Content-Type'] = "text/html"
   end

  end
end