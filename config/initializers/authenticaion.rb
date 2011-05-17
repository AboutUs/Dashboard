require 'yaml'

unless File.exist?(File.join(Rails.root, 'config', 'auth.yml'))
  STDERR.puts "*" * 80
  STDERR.puts "** Nothing found at #{File.expand_path(File.join(Rails.root, 'config', 'auth.yml')).inspect}. Running WITHOUT authentication."
  STDERR.puts "*" * 80
  AUTH_PARAMS = nil
else
  AUTH_PARAMS = YAML.load_file(File.join(Rails.root, 'config', 'auth.yml'))
end
