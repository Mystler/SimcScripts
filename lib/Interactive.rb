require_relative 'Logging'
require_relative 'SimcConfig'
require 'yaml'

module Interactive
  # SPECIAL NOTE: By default these function check for existing cmd arguments first.
  # You can disable that behavior by setting the optional parameter to false.

  # Fetch next cmd argument or wait for input
  def self.GetInputOrArg(checkArgs=true)
    arg = checkArgs ? ARGV.shift : nil
    unless arg
      return gets.chomp
    end
    puts arg
    return arg
  end

  # Offers all templates matching prefix_*.<ext> in the profiles folder
  # Returns the * part
  def self.SelectTemplate(prefixes, checkArgs=true)
    puts "Please choose what do you want to simulate:"
    profiles = {}
    index = 1
    if prefixes.is_a?(String)
      prefixes = [prefixes]
    end
    prefixes.each do |prefix|
      underscore = prefix.end_with?('/') ? '' : '_'
      files = Dir.glob("#{prefix}#{underscore}[_\-+a-zA-Z0-9]*\.*")
      files.sort!
      files.each do |file|
        if profile = file.match(/#{prefix}#{underscore}([_\-+a-zA-Z0-9]*)\.\w+/)
          profiles[index] = profile[1]
          puts "#{index}: #{profile[1]}"
          index += 1
        end
      end
    end
    print 'Profile: '
    input = GetInputOrArg(checkArgs)
    if profiles.has_value?(input)
      puts
      return input
    end
    index = input.to_i
    unless profiles.has_key?(index)
      Logging.LogScriptFatal "ERROR: Invalid profile index #{input} entered!"
      puts 'Press enter to quit...'
      GetInputOrArg(checkArgs)
      exit
    end
    puts
    return "#{profiles[index]}"
  end

  # Offers all templates matching prefix_*.<ext> in the profiles folder
  # Returns the selecitons as array, multiple selections allowed via [a,b] (no spaces)
  def self.SelectTemplateMulti(prefixes, checkArgs=true)
    puts "Please choose what do you want to simulate:"
    puts '(You can either enter one, or multiple using the format [a,b] without spaces.)'
    profiles = {}
    index = 1
    if prefixes.is_a?(String)
      prefixes = [prefixes]
    end
    prefixes.each do |prefix|
      underscore = prefix.end_with?('/') ? '' : '_'
      files = Dir.glob("#{prefix}#{underscore}[_\-+a-zA-Z0-9]*\.*")
      files.sort!
      files.each do |file|
        if profile = file.match(/#{prefix}#{underscore}([_\-+a-zA-Z0-9]*)\.\w+/)
          profiles[index] = profile[1]
          puts "#{index}: #{profile[1]}"
          index += 1
        end
      end
    end
    print 'Profile: '
    input = GetInputOrArg(checkArgs)
    inputArray = [(YAML.load(input))].flatten # Use YAML to automatically parse arrays as such
    templates = []
    inputArray.each do |el|
      if profiles.has_value?(el)
        templates.push(el)
        next
      end
      index = el.to_i
      if profiles.has_key?(index)
        templates.push("#{profiles[index]}")
      else
        Logging.LogScriptFatal "ERROR: Invalid profile index #{el} entered!"
        puts 'Press enter to quit...'
        GetInputOrArg(checkArgs)
        exit
      end
    end
    puts
    return templates
  end

  # Offers all subfolders in prefix in the profiles folder
  def self.SelectSubfolder(prefix, checkArgs=true)
    puts "Please choose a #{prefix} template folder:"
    folders = {}
    index = 1
    files = Dir.glob("#{SimcConfig['ProfilesFolder']}/#{prefix}/*/")
    files.sort!
    files.each do |file|
      if folder = file.match(/#{SimcConfig['ProfilesFolder']}\/#{prefix}\/(.*)\//)
        folders[index] = folder[1]
        puts "#{index}: #{folder[1]}"
        index += 1
      end
    end
    print 'Folder: '
    input = GetInputOrArg(checkArgs)
    if folders.has_value?(input)
      puts
      return input
    end
    index = input.to_i
    unless folders.has_key?(index)
      Logging.LogScriptFatal "ERROR: Invalid folder index #{input} entered!"
      puts 'Press enter to quit...'
      GetInputOrArg(checkArgs)
      exit
    end
    puts
    return "#{folders[index]}"
  end

  # Ask for talent permutation input string
  # Returns array of arrays with talents for each row
  def self.SelectTalentPermutations(checkArgs=true)
    puts 'Please select the talents for permutation:'
    puts 'Options: 0-off, 1-left, 2-middle, 3-right, x-Permutation'
    puts 'You can specify more per tier by wrapping the wanted columns in [].'
    puts 'Examples: xxx00xx, xxx00[12]x'
    print 'Talents: '
    talentstring = GetInputOrArg(checkArgs)
    talentdata = []
    isTierArray = false
    tierArray = []
    talentstring.each_char do |talentpart|
      if ['0', '1', '2', '3'].include?(talentpart)
        if isTierArray
          tierArray.push(talentpart.to_i)
        else
          talentdata.push([talentpart.to_i])
        end
      elsif !isTierArray && talentpart.downcase.eql?('x')
        talentdata.push((1..3).to_a)
      elsif !isTierArray && talentpart.eql?('[')
        isTierArray = true
        tierArray = []
      elsif isTierArray && talentpart.eql?(']')
        isTierArray = false
        talentdata.push(tierArray)
      else
        Logging.LogScriptFatal "ERROR: Invalid talent string input #{talentstring}!"
        puts 'Press enter to quit...'
        GetInputOrArg(checkArgs)
        exit
      end
    end
    if talentdata.length != 7
      Logging.LogScriptFatal "ERROR: Invalid number of talents! Got #{talentdata.length}"
      puts 'Press enter to quit...'
      GetInputOrArg(checkArgs)
      exit
    end
    return talentdata
  end

  # Choose from a given array. Prompt will show "Please choose a <name>:"
  def self.SelectFromArray(name, array, checkArgs=true)
    puts "Please choose a #{name}:"
    index = 1
    array.each do |item|
      puts "#{index}: #{item}"
      index += 1
    end
    print "#{name}: "
    input = GetInputOrArg(checkArgs)
    if array.include?(input)
      puts
      return input
    end
    index = input.to_i
    if index <= 0 || !array[index - 1]
      Logging.LogScriptFatal "ERROR: Invalid #{name} index #{input} entered!"
      puts 'Press enter to quit...'
      GetInputOrArg(checkArgs)
      exit
    end
    puts
    return array[index - 1]
  end
end
