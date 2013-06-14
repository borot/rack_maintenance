# Rack_Maintenance, for your maintenance

## What's this?
 Rack_Maintenance is a rack middleware to show maintenance page while you maintenance application.

## Installation

    gem install rack_maintenance

## How to use
####basic usage

    #config.ru
    require 'rack/maintenance'
    use Rack::Maintenance

####set template page to show

    #config.ru
    require 'rack/maintenance'
    use Rack::Maintenance,
      template: File.read('path/to/maintenance.html')

####set inactivate

    #config.ru
    require 'rack/maintenance'
    use Rack::Maintenance,
      template: File.read('path/to/maintenance.html'),
      activate: false

An 'activate' option is default to true and maintenance page will be displayed. When it set to false,<code>Rack::Maintenance</code> is not work.

####set status code if you wish to. (default to 503)

    #config.ru
    require 'rack/maintenance'
    use Rack::Maintenance,
      status: 200,
      template: File.read('path/to/maintenance.html'),

Although status code can be changed, there are almost no need to do so.
