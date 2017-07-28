require_relative 'env'

class App < Roda
  plugin :json # TODO: add oj serialization
  plugin :multi_route
  plugin :all_verbs
  plugin :not_found
  plugin :error_handler

  route do |r|
    r.root {
      {
        hello: "hello world!"
      }
    }
  end

  not_found do
    {
      error: 404,
      error_message: "404 - Not Found"
    }
  end

  error do |err|
    case err
    # catch a proper error instead of nil...
    when nil
    # when CustomError
    #   "ERR" # like so
    else
      puts "-"*70
      puts "ERROR:"
      puts err
      puts "-"*70
      {
        error: 500,
        error_message: "500 - Internal Server Error - check logs for details - error: '#{err.class} - #{err.message}'"
      }
    end
  end
end
