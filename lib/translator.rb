# require modules here
require 'yaml'
# def load_library(file)
#   library = YAML.load_file(file)
# end
# def get_japanese_emoticon(name)
#       load_library.each do |lib_name, emote|
#                   if lib_name == name
#                         return emote[1]
#                   end
#       end
# end
# def get_english_meaning(j_emote)
#       load_library.each do |lib_name, emote|
#                   if emote[1] == j_emote
#                         return lib_name
#                   end
#       end
# end

def load_library(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |meaning, array|
    english, japanese = array
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_emoticon"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_meaning"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end
