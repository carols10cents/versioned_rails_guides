Versioned Rails Guides
======================

**Problem:** You have legacy projects using versions of Rails that are not the
latest. You like to use the Rails Guides for reference. The version of the
Rails guides on [guides.rubyonrails.org](http://guides.rubyonrails.org/) is
for a different version of Rails than what your legacy project is running,
so sometimes what the guides say doesn't match what you need to do.

**Solution:**

![Generate guides for ALL THE RAILS VERSIONS!!!!](https://raw.github.com/carols10cents/versioned_rails_guides/master/images/alltherailsversions.png)

Usage
-----

Run the script:

    ./versioned-rails-guides.rb

and this will generate the guides for all the rails versions in the 3.2 series
in the `output` directory.

Future improvements
-------------------

I would love help making this more useful, especially in these ways:

* [Be able to generate more than the 3.2 series](https://github.com/carols10cents/versioned_rails_guides/issues/1)
* [Show the version in the generated header](https://github.com/carols10cents/versioned_rails_guides/issues/2)
* [Have a way to change the version in the generated header](https://github.com/carols10cents/versioned_rails_guides/issues/3)
* [Have a master index page that links to all the versions](https://github.com/carols10cents/versioned_rails_guides/issues/4)
* [Host this somewhere (heroku), and document how to get your own set hosted easily](https://github.com/carols10cents/versioned_rails_guides/issues/5)

Contributing
------------

Follow [Github flow](http://scottchacon.com/2011/08/31/github-flow.html) for
submitting pull requests. Let me know if you need help with any of those steps
<3. There are no tests right now.

I follow the [rstat.us](https://github.com/hotsh/rstat.us)
contribution policies:

* Every pull request receives emoji
* You will be given push access to the repo upon your first accepted pull request
* Carol will love you forever

License
-------

MIT. See LICENSE.
