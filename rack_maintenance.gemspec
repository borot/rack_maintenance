Gem::Specification.new do |s|
  s.name            = "rack_maintenance"
  s.version         = "0.1.0"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "Rack middleware to show maintenance page"
  s.license         = "MIT"

  s.description = <<-EOF
It provide maintenance page to your rack application.
Also see https://github.com/borot/rack_maintenance.
EOF

  s.files           = Dir['{lib/**/*, spec/*}'] +
                        %w(rack_maintenance.gemspec )
  s.require_path    = 'lib'

  s.author          = 'Masato Ishimoto'
  s.email           = 'masato.ishimoto@gmail.com'
  s.homepage        = 'https://github.com/borot/rack_maintenance'
end
