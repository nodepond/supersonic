# SuperSonic LiveCoding-Tool. Some IRB-goodness, made by m.wisniowski (nodepond.com) at 3.2014

def clr
  system 'clear'
end

# Short-code for require-method (to load presets and self-written methods from local files)
# This methods searches the local folder
def r(filename)
  require "./#{filename}"
end
# Short-code for load-method (to load presets and self-written methods from local files)
# This methods searches the local folder. You do not need to add .rb - it will added automatically
def l(filename)
  load "#{filename}.rb"
end

clr
puts "This is SuperSonic.\n"
puts "You could become coding rockstar!\n"
puts "\n\n"