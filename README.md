# render_with_locals

Be explicit about the things you send from your Rails controller to the view.

### Example

`app/controllers/application_controller.rb`:

```ruby
class ApplicationController
  include RenderWithLocals
end
```

`app/controllers/home_controller.rb`:

```ruby
class HomeController < ApplicationController
  def index
    render_with_locals posts: Post.all
  end
end
```

`app/views/home/index.html.erb`:

```erb
<ul>
  <% view.posts.each do |post| %>
    <li><%= link_to post.title, post %></li>
  <% end %>
</ul>
```

### Why not just use instance variables?

They feel like _magic_. Instead I like how this forces me to be explicit in what I send along to my templates. It's like a small step towards having a presenter/view layer (or whatever) but not going further than just adding the convention of using a single variable.

### What's `view`?

An object with reader methods for every key in the hash you gave it. A [HalfOpenStruct](https://gist.github.com/henrik/19c68b2a41ab4d098ce8) in a way.

## Installation

Add `render_with_locals` to your Gemfile:

```ruby
gem 'render_with_locals'
```

Include it in your `ApplicationController`:

```ruby
class ApplicationController
  include RenderWithLocals
end
```

# License

MIT
