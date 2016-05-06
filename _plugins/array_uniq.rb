module Jekyll
  module ArrayUniqFilter
    def to_array_uniq(str)
      str.split(',').uniq
    end
  end
end

Liquid::Template.register_filter('array_uniq',Jekyll::ArrayUniqFilter)