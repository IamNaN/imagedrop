# ImageDrop

Good for avatars and such!

Transforms the lowly file input field into sophisticated looking drag-and-drop targets complete with a preview image and placeholder text.

*  Home page: https://github.com/iamnan/imagedrop
*  Demo: http://iamnan.github.io/imagedrop

Actually, it's nothing fancy, but very effective. ImageDrop employs a little CSS trickery to change the  file input field into a drop zone.

A tiny bit of javascript validates the file type and generates the image preview by updating the the parent element's background-image with the image dropped on the input field.

During dragging and dropping, another div (sibling to the input) is temporarily revealed to act as a placeholder. This is also done purely with CSS.

So the html structure in the form looks like this:

    <div data-imagedrop>
      <input type='file'>
      <div>Placeholder</div>
    </div>

## Requirements/Compatibility

ImageDrop uses simple CSS that is compatible with all browsers back to IE8. (Create a github issue if you find I'm wrong about that.) It also uses the browser's FileReader API through javascript, and that is compatible with most everything. So, the requirements are:

* Jquery (whatever version)
* Uh, that's it...

## Features
* It's small. (Just 989 characters of javascript.)
* Works with a *lot* of browsers; [most browsers](http://caniuse.com/#search=FileReader) in fact.
* Supports a live image preview on the client-side, no bugging the server about it.
* Supports placeholder text and/or images (for drag operations).
* Validates the file type before on the client-side, no bugging the server about that either.
* Can be integrated into any web framework, not just Rails although this gem is mostly for Rails.
* Plays nice with Bootstrap.

## Installation

Be sure to already have jquery in your project and then add this line to your application's Gemfile:

    gem 'imagedrop'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imagedrop

In your application.js add:

    //= require imagedrop

And your application.css add:

    *= require imagedrop
    *= require imagedrop_sample // optional

`imagedrop_sample.css.scss` is a good looking example, but it's just there to give you an idea of how you might style the ImageDrop. I guess you could call this the theme file_field. 

## Usage

ImageDrop was designed to be super simple to get working. To be thorough, here are step-by-step instructions.

### In Rails

ImageDrop expects a loose html structure. Just wrap the input field with a div. Add the `data-imagedrop` attribute to this div.

The input field may have an optional sibling div to act as the placeholder text. Here is an example:

    <div data-imagedrop style='background-image: url(<%= @user.avatar_image %>)'>
      <div class='placeholder'>Drop an image here</div>
      <%= f.file_field :avatar %>
    </div>

`div.placeholder` contains a small snippet of text in this example. It may contain any content you wish but does not accept mouse and keyboard input. The class name is not necessary, I'm just using it here for clarity. 
      
In this example, I'm using an `avatar_image` method from my code that provides the path to the user's image or a default image if one doesn't exist. You could do something similar. In a view helper add a function:

    def avatar_image(@user)
      asset_path
        @user.new_record? || @user.avatar_url.blank? ?
        'default.jpg' : @user.avatar_url
    end

And then call it like this:

    <div style='background-image: url(<%= avatar_image(@user) %>)'>

Obviously, your version will be a little different.

### Outside of Rails

The same HTML structure expectation applies whether inside or outside of Rails (so check that out above). You can extract the coffeescript file from this repo and convert it to vanilla javascript at [js2coffee.org](http://js2coffee.org) kindly written and hosted by [Rico Sta Cruz](http://ricostacruz.com/).

The SCSS stylesheet, both of them, can be converted to whitebread CSS at [SASSMeister](http://sassmeister.com/) brilliantly offered by [Jed Foster](http://jedfoster.com/) and [Dale Sande](http://www.dalesande.com/).

## Alternatives

There are alternatives to ImageDrop. While experimenting, I found a cool way to let CSS do the heavy lifting. I want to keep things small and very simple.

This may not be enough for your purposes. You might need to drop multiple files, do realtime back-end processing, display upload progress, etc. Here are some alternatives:

* [jQuery File Upload](http://blueimp.github.io/jQuery-File-Upload/) 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/imagedrop/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
