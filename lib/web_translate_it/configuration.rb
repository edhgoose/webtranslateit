module WebTranslateIt
  class Configuration
    require 'yaml'
    require 'fileutils'
    attr_accessor :api_key, :files, :ignore_locales
    
    def initialize
      file = File.join(RAILS_ROOT, 'config', 'translation.yml')
      configuration       = YAML.load_file(file)
      self.api_key        = configuration['api_key']
      self.files          = []
      self.ignore_locales = configuration['ignore_locales'].to_a.map{ |locale| locale.to_s }
      configuration['files'].each do |file_id, file_path|
        self.files.push(TranslationFile.new(file_id, file_path, api_key))
      end
    end
    
    def locales
      WebTranslateIt::Util.http_connection do |http|
        request = Net::HTTP::Get.new(api_url(locale))
        request.add_field('If-Modified-Since', last_modification(file_path)) if File.exist?(file_path) and !force
        response      = http.request(request)
        response.body.split
      end
    end
    
    def self.create_config_file
      config_file = "config/translation.yml"
      unless File.exists?(config_file)
        puts "Created #{config_file}"
        FileUtils.copy File.join(File.dirname(__FILE__), '..', '..', 'examples', 'translation.yml'), config_file
      end
    end
    
    def api_url
      "/api/projects/#{api_key}/locales"
    end
  end
end