class MockApp
  BODY = <<-EOH
  <html>
  <head></head>
    <body>
      <p>test body</p>
    </body>
  </html>
  EOH
 
  def call(env)
    case env['PATH_INFO']
    when '/'
      [200, {"Content-Type" => "text/html"}, [BODY]]
    when '/404'
      [404, {"Content-Type" => "image/ipg"}, [BODY]]
    when '/image.jpg'
      [200, {"Content-Type" => "image/ipg"}, [BODY]]
    end
  end
end
