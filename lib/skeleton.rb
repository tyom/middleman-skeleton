class Skeleton < ::Middleman::Extension
  def initialize(app, options_hash={})
    super
    require_relative './method_missing'
    require 'open-uri'
  end

  helpers do
    def resources_for(dir, ext = 'html', exclude_indexes = false)
      resources = sitemap.resources
        .select {|r| r.ext == ".#{ext}"}                # Select files only HTML files
        .reject {|r| r.data.hidden}                     # reject hidden (Front matter)
        .select {|r| r.url.start_with?(dir)}            # Select files in the given dir
        .sort_by(&:url)                                 # Sort by URL (ensures indexes first)
        .reject {|r| r.url == dir}                      # Exclude main directory index
        .reject {|r|                                    # Exclude all directory indexes
          exclude_indexes ? r.directory_index? : false
        }
    end

    # Data loader
    def load_data(path, options = nil)
      resource = if path.start_with? 'http'
        load_remote_data(path, options)
      else
        sitemap.find_resource_by_path(relative_dir(current_page.path, path).to_s)
      end

      raise "#{path} not found" unless resource

      if ['.yaml', '.yml'].include? resource.ext
        yaml = resource.render
      elsif resource.ext == '.json'
        json = resource.render
      end

      if json
        JSON.parse(resource.render)
      elsif yaml
        YAML.load(resource.render)
      end
    end

    private

    def load_remote_data(url, options)
      begin
        if(options)
          resource = open(url, http_basic_authentication: [options[:user], options[:password]])
        else
          resource = open(url)
        end
      rescue
        raise "Couldn't load the remote: #{url}."
      end
      # fake MM resource
      {
        ext: '.json',
        render: resource.read
      }
    end

    # Constructs path relative to base path (first argument)
    def relative_dir(path, *args)
      relative_path = args ? args.join('/') : ''
      Pathname(path).dirname.join(relative_path)
    end
  end
end

::Middleman::Extensions.register(:skeleton, Skeleton)
