require 'pry'

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

     if req.path.match(/items/)
      # resp.write "You requested an item"
      binding.pry
      item_name = req.path.split("/items/").last
      find_item(item_name)
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
