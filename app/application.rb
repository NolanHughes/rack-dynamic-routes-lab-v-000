class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Response.new(env)

     if req.path.match(/items/)
      resp.write "You requested an item"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
