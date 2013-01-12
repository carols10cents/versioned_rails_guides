#!/usr/bin/env ruby

# For each tag of a released version after 2.3.x
# and 'edge' too? edge needs a commit hash
all_tags = `git tag`.split("\n")
released_version_tags = tags.select { |t|
                          t.match(/^v(2\.3\.\d+|[34]\.\d+\.\d+)$/)
                        }

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