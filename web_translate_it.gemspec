Gem::Specification.new do |s|
  s.name        = "web_translate_it" 
  s.version     = "1.4.2"
  s.summary     = "Sync your translations between your Rails app and Web Translate It"
  s.email       = "edouard@atelierconvivialite.com"
  s.homepage    = "https://webtranslateit.com"
  s.description = "A rack middleware and a handful of rake tasks to sync your translations between webtranslateit.com and your rails applications."
  s.authors     = ["Édouard Brière"]
 
  s.files =  ["history.md", "MIT-LICENSE", "README.md", "version.yml"]
  s.files += ["examples/locale.rb", "examples/translation.yml"]
  s.files += ["lib/web_translate_it.rb", "lib/web_translate_it/auto_fetch.rb", "lib/web_translate_it/configuration.rb", "lib/web_translate_it/translation_file.rb", "lib/web_translate_it/util.rb", "lib/web_translate_it/tasks.rb"]
  
  s.test_files = ["spec/spec.opts", "spec/spec_helper.rb", "spec/web_translate_it/configuration_spec.rb", "spec/web_translate_it/translation_file_spec.rb", "spec/examples/en.yml", "spec/examples/config/translation.yml"]  
  
  s.add_dependency("multipart-post", ["~> 1.0"])
  
  s.has_rdoc = false
end
