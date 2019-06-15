# Template generator built to bin/generate for internal file generation

require "yaml"
require "json"
require "ecr"

#require "./setup"

# Standard library extensions
require "./ext/**"

require "./cutback/roff"

require "./cutback/helpers/**"

require "./cutback/formatter"
require "./cutback/formatter/**"

require "./cutback/definition"
require "./cutback/definition/**"

macro generate(path)
  String.build { |io| ECR.embed({{path}}, io) }
end

macro generate_templates(hash, paths)
  {% for path, index in paths %}
    {{hash}}[File.basename({{path}})] = generate({{path}})
  {% end %}
end

if ARGV.size != 2
  puts "Usage: #{PROGRAM_NAME} INPUT OUTPUT"
  exit 1
end

input       = ARGV[0]
output      = ARGV[1]
app         = Cutback::Definition::App.load("app.yml")
files       = {} of String => String
path        = File.basename(input)
#controllers = Cutback::Controller.all.sort_by(&.name) # TODO REMOVE

app.for = :man  if File.extname(input) =~ /\.\d/

generate_templates(files, [
  "templates/cutback.1",
  "templates/cutback.5",
  "templates/README.md",
  "templates/options.cr",
])

unless files.has_key?(path)
  puts "Error: Unknown template '#{path}'"
  exit 1
end

data = files[path]

File.open(output, "w+") do |io|
  io.puts(data)
end

