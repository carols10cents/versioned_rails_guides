#!/usr/bin/env ruby
require 'fileutils'

# FileUtils.rmdir('rails') if Dir.exists?('rails')
`rm -rf rails` if Dir.exists?('rails')

RAILS_REPO_LOCATION = '~/Ruby/rails'
`git clone #{RAILS_REPO_LOCATION}`

FileUtils.cd('rails') do
  all_tags = `git tag`.split("\n")
  released_version_tags = all_tags.select { |t|
                            t.match(/^v(2\.3\.\d+|[34]\.\d+\.\d+)$/)
                          }
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