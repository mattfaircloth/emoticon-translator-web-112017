# require modules here
require 'yaml'

def load_library(file)
#emoticons = {:angel => ["O:)", "☜(⌒▽⌒)☞"], :angry => [">:(", "ヽ(ｏ`皿′ｏ)ﾉ"]}
  emoticons = YAML.load_file(file)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}

emoticons.each do |word, symbol_array|
    english, japanese = symbol_array
    new_hash["get_emoticon"][english] = japanese
    new_hash["get_meaning"][japanese] = word
  end
  new_hash
end

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)

  answer = emoticons["get_emoticon"][emoticon]
  if answer
    answer
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  emoticons = load_library(file)

  answer = emoticons["get_meaning"][emoticon]
  if answer
    answer
  else
    "Sorry, that emoticon was not found"
  end
end
