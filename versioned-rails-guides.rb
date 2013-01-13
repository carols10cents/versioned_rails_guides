#!/usr/bin/env ruby
require 'fileutils'

# Useful values
RAILS_REPO_LOCATION = 'git://github.com/rails/rails.git'
RAILS_CHECKOUT      = 'rails'
BASE_DIR            = File.expand_path(File.dirname(__FILE__))
OUTPUT_DIR          = File.join(BASE_DIR, 'output')

# Utility functions
def check_out_clean_rails_repo
  puts "Checking out clean rails repo from #{RAILS_REPO_LOCATION} into #{RAILS_CHECKOUT}."
  FileUtils.rm_r(RAILS_CHECKOUT) if Dir.exists?(RAILS_CHECKOUT)
  `git clone #{RAILS_REPO_LOCATION} #{RAILS_CHECKOUT}`
end

def clobber_output_dir
  puts "Cleaning up old output."
  FileUtils.rm_r(OUTPUT_DIR) if Dir.exists?(OUTPUT_DIR)
  FileUtils.mkdir(OUTPUT_DIR)
end

def summary_text(versions)
  if versions.empty?
    "None."
  else
    versions.join(', ')
  end
end


# Processing
check_out_clean_rails_repo
clobber_output_dir

FileUtils.cd('rails') do
  all_tags = `git tag`.split("\n")
  released_version_regex = 'v3\.2\.\d+'
  released_version_tags = all_tags.select { |t|
                            t.match(/^#{released_version_regex}$/)
                          }

  successfully_generated = []
  failed_to_generate     = []

  released_version_tags.each do |tag|
    tag_output_directory = File.join(OUTPUT_DIR, tag)

    puts "Checking out Rails #{tag}"
    `git checkout #{tag} &> /dev/null`
    if File.exists?('Gemfile')
      puts "  Gemfile found. Bundling..."
      `bundle`
      puts "  Bundling complete. Generating guides..."
      FileUtils.cd('railties') do
        `bundle exec rake generate_guides ALL=1 RAILS_VERSION=#{tag} &> /dev/null`
        puts "  Generating guides complete. Copying to #{tag_output_directory}..."
        `cp -R guides/output/ #{tag_output_directory}`
      end
      puts "  Copying complete."
    else
      puts "  No Gemfile. I quit."
    end
    if File.exists?(File.join(tag_output_directory, 'index.html'))
      successfully_generated << tag
    else
      failed_to_generate << tag
    end
    puts "Done processing #{tag}."
  end

  puts "Summary:"
  puts "  Successfully generated guides for: #{summary_text(successfully_generated)}"
  puts "  Failed to generate guides for: #{summary_text(failed_to_generate)}"
end


# For each tag of a released version after 2.3.x
# and 'edge' too? edge needs a commit hash

#   Generate the guides:
#     bundle
#     cd railties
#     bundle exec rake generate_guides ALL=1
#     into a location named for the tag

# after some version??
#     bundle
#     cd guides
#     bundle exec rake guides:generate ALL=1

# @version  = ENV['RAILS_VERSION'] || 'local'