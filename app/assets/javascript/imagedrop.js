(function() {
  jQuery(function() {
    return $('*[data-imagedrop]').each(function() {
      return new ImageDrop($(this));
    });
  });

  this.ImageDrop = (function() {
    function ImageDrop(element) {
      this.element = element;
      $(this.element).find('input[type="file"]').change(function() {
        return ImageDrop.readURL(this);
      });
      $(this.element).on('dragenter', function(event) {
        return $(this).addClass('dragging');
      });
      $(this.element).on('dragleave', function(event) {
        return $(this).removeClass('dragging');
      });
      $(this.element).on('drop', function(event) {
        return $(this).removeClass('dragging');
      });
    }

    ImageDrop.readURL = function(input) {
      var reader;
      if (input.files && input.files[0] && ImageDrop.checkFileType(input.files[0])) {
        reader = new FileReader();
        reader.target_elem = $(input).parent();
        reader.onload = function(e) {
          $(reader.target_elem).fadeOut('fast', function() {
            $(reader.target_elem).attr('style', 'background-image: url(' + e.target.result + ')');
            return $(reader.target_elem).fadeTo(1);
          });
        };
        reader.readAsDataURL(input.files[0]);
      }
    };

    ImageDrop.checkFileType = function(file) {
      var ext, fileTypes;
      ext = file.name.substring(file.name.lastIndexOf('.')).toLowerCase();
      fileTypes = ".jpeg , .jpg , .png , .bmp, .gif , .webp , .svg";
      if (fileTypes.toLowerCase().indexOf(ext) < 0) {
        alert("That doesn't appear to be an image file.");
        return false;
      } else {
        return true;
      }
    };

    return ImageDrop;

  })();

}).call(this);
