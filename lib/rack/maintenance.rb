module Rack
  class Maintenance

    class InvalidStatus < StandardError; end

    def initialize(app, options = {})

      raise InvalidStatus if options[:status] && options[:status].to_i < 100

      @app      = app
      @status   = options[:status] || default_status
      @headers  = options[:headers] || default_headers
      @template = options[:template] || default_template
      @active   = options[:active].nil? ? true : options[:active]
    end

    def call(env)
      if active?
        headers['Content-Length'] = body.bytesize.to_s
        return [status, headers, [body]]
      end
      
      @app.call(env)
    end
 
  private
    attr_reader :status, :headers, :template, :active

    alias body template

    def default_status
      503
    end

    def default_headers
      {'Content-Type'=> 'text/html'}
    end

    def default_template
      "<h2>Sorry. We're under maintenance...<h2>"
    end

    def active?
      !!@active
    end
 end
end

