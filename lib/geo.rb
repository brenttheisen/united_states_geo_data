module Geo
  class Engine < Rails::Engine
    rake_tasks do
      load File.expand_path('../tasks/load_seed.rake', __FILE__)
    end

    def load_seed
      seed_file = "#{paths["db/seeds"].first}.rb"
      load(seed_file) if File.exist?(seed_file)
    end
  end
end