require "yaml"

def load_library(path)
  h = YAML.load_file(path)
   result = {
    'get_emoticon' => {}
  }
  
  h.each do |k,v|
    if result['get_meaning'].nil?
      result['get_meaning'] = {}
    end
    if result['get_meaning'][k].nil?
      result['get_meaning'][v[1]] = k
    end
  end
  
  h.each do |k,v|
    if result['get_emoticon'].nil?
      result['get_emoticon'] = {}
    end
    if result['get_emoticon'][k].nil?
      result['get_emoticon'][v[0]] = v[1]
    end
  end

  return result
end

def get_japanese_emoticon(path, emoticon)
  translation = load_library(path)
  if translation['get_emoticon'][emoticon].nil?
    return "Sorry, that emoticon was not found"
  end
  return translation['get_emoticon'][emoticon]
end

def get_english_meaning(path, emoticon)
   translation = load_library(path)
  if translation['get_meaning'][emoticon].nil?
    return "Sorry, that emoticon was not found"
  end
  return translation['get_meaning'][emoticon]
end
