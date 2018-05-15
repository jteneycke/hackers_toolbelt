require "hackers_toolbelt/version"

%w[
awesome_print
chainable_methods
clipboard
colored
fileutils
http
json
nokogiri
open-uri
ostruct
pry
pry-doc
sanitize
smarter_csv
sqlite3
tty-prompt
].each{|gem| require gem }

#class Array
  #def to_struct
    #JSON.parse(self.to_json, object_class: OpenStruct)
  #end
#end

module HackersToolbelt
  module_function

  def clean_html(html)
    Sanitize.fragment(html, {
      elements: ['div', 'input', 'label', 'span']
    })
  end

  def save_as_file(name, data)
    File.open(name, 'w') {|f| f.write(data) }
  end

  def p(obj)
    ap(obj,
       index: false,
       plain: true
      );nil
  end;

  def table(file_path)
    SmarterCSV
      .process(file_path)
      .map{|row| OpenStruct.new(row) }
  end

  include Nokogiri
  def extract(url:, selector:, cleaner:, filter: false)
    items =
      CM(url)
      .open
      .HTML.parse
      .css(selector)
      .map{|node| cleaner.call(node) }
      .unwrap

    if filter
      items.select{|node| filter.call(node) }
    else
      items
    end
  end

end
