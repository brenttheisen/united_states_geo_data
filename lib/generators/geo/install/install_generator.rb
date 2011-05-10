require 'rails/generators/migration'

module Geo
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "add the migrations"

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "create_geo_tables.rb", "db/migrate/create_geo_tables.rb"
        puts "\nCopied create_geo_tables.rb to your app's migrations dir. Don't forget to run 'rake db:migrate' on your app.\n"
      end
    end
  end
end
