require 'pry'

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

     if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      binding.pry
      resp.write find_item(item_name)
    else
      resp.write "Route not found"
      resp.status = 404
    end

    def find_item(item_name)
      binding.pry
      item = @@items.find {|item| item.name = item_name }
      item.price
    end

    resp.finish
  end
end
