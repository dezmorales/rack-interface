require_relative './middleware/time_format'

class App

  def call(env)
    @request = Rack::Request.new(env)

    if @request.path_info == '/time'
      response = TimeFormat.new(@request.params)

      if response.incorrect_format.empty?
        http_response(200, Time.now.strftime(response.correct_format))
      else
        http_response(400, "Unknown time format #{response.incorrect_format}")
      end
    else
      http_response(404, 'Not Found')
    end
  end

  private

  def http_response(status, body)
    [
      status,
      { 'Content-Type' => 'text/plain' },
      [body]
    ]
  end

end
