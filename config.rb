require 'pry'
require 'lib/skeleton'

activate :skeleton
activate :autoprefixer

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir,    'assets/stylesheets'
set :js_dir,     'assets/javascripts'
set :images_dir, 'assets/images'

set :relative_links, true

###
# Bower configuration
###

# Set bower components directory in `.bowerrc`
bowerrc_dir = JSON.parse(IO.read("#{root}/.bowerrc"))['directory']
# Sprockets
ready do
  sprockets.append_path(File.join(root, bowerrc_dir))
end
# Compass
compass_config do |config|
  config.add_import_path File.join(root, bowerrc_dir)
end

###
# Development-secific configuration
###

configure :development do
  # Enable Livereload
  activate :livereload, no_swf: true
  # Slim pretty-print
  Slim::Engine.set_default_options pretty: true
  # Compass configuration
  compass_config do |config|
    # config.output_style = :compact
    # config.line_comments = false
  end
end

###
# Build-specific configuration
###

configure :build do
  # Only build files prefixed by target extension (e.g. styles.css.scss)
  ignore /^.*(?<!\.css)\.scss$/
  # Ignore .coffee files
  ignore /^.*\.coffee$/

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
