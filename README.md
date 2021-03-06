# FriendlyId

[![Build Status](http://travis-ci.org/norman/friendly_id.png)](http://travis-ci.org/norman/friendly_id)

FriendlyId is the "Swiss Army bulldozer" of slugging and permalink plugins for
Ruby on Rails. It allows you to create pretty URL's and work with human-friendly
strings as if they were numeric ids for Active Record models.

Using FriendlyId, it's easy to make your application use URL's like:

    http://example.com/states/washington

instead of:

    http://example.com/states/4323454


## FriendlyId Features

FriendlyId offers many advanced features, including: slug history and
versioning, scoped slugs, reserved words, and custom slug generators.

FriendlyId is compatible with Active Record **3.0** and **3.1**.

## Version 4.x

FriendlyId 4.x introduces many changes incompatible with 3.x. If you're
upgrading, please [read the
docs](http://norman.github.com/friendly_id/file.WhatsNew.html) to see what's
new.

## Rails Quickstart

    gem install friendly_id

    rails new my_app

    cd my_app

    gem "friendly_id", "~> 4.0.0.beta8"


    rails generate scaffold user name:string slug:string

    # edit db/migrate/*_create_users.rb
    add_index :users, :slug, :unique => true

    rake db:migrate

    # edit app/models/user.rb
    class User < ActiveRecord::Base
      extend FriendlyId
      friendly_id :name, :use => :slugged
    end

    User.create! :name => "Joe Schmoe"

    rails server

    GET http://localhost:3000/users/joe-schmoe

## Docs

The current docs can be found
[here](http://norman.github.com/friendly_id/)

## Benchmarks

The latest benchmarks for FriendlyId are maintained
[here](https://gist.github.com/1129745).


## Bugs

Please report them on the [Github issue
tracker](http://github.com/norman/friendly_id/issues) for this project.

If you have a bug to report, please include the following information:

* **Version information for FriendlyId, Rails and Ruby.**
* Stack trace and error message.
 * Any snippets of relevant model, view or controller code that shows how you
  are using FriendlyId.

If you are able to, it helps even more if you can fork FriendlyId on Github,
and add a test that reproduces the error you are experiencing.

## Credits

FriendlyId was originally created by Norman Clarke and Adrian Mugnolo, with
significant help early in its life by Emilio Tagua. I'm deeply gratful for the
generous contributions over the years from [many
volunteers](https://github.com/norman/friendly_id/contributors).

Part of the inspiration to rework FriendlyId came from Darcy Laycock's library
[Slugged](https://github.com/Sutto/slugged), which he was inspired to create
because of frustrations he experienced while using FriendlyId 3.x. Seeing a
smart programmer become frustrated with my code was enough of a kick in the
butt to make me want to improve this library significantly.

Many thanks to him for providing valid, real criticism while still being a cool
about it. I definitely recommend you check out his library if for some reason
FriendlyId doesn't do it for you.

Lastly, FriendlyId uses [Travis](http://travis-ci.org/) for continuous
integration. It's an excellent, free service created by a whole bunch of [good
people](https://github.com/travis-ci) - if you're not already using it, you
should be!

Copyright (c) 2008-2011 Norman Clarke, released under the MIT license.
