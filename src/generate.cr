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

if ARGV.size == 0 || ARGV.size > 2
  puts "Usage: #{PROGRAM_NAME} INPUT [OUTPUT]"
  exit 1
end

input  = ARGV[0]
output = ARGV[1] unless ARGV.size == 1
app    = Cutback::Definition::Application.load("app.yml")
files  = {} of String => String
path   = File.basename(input)

app.for = :man if File.extname(input) =~ /\.roff$/

generate_templates(files, [ # TODO: Pragmatic
  "templates/config.yml",
  "templates/cutback.1.roff",
  "templates/cutback.5.roff",
  "templates/index.html",
  "templates/LICENSE",
  "templates/Makefile",
  "templates/options.cr",
  "templates/README.md",
])

unless files.has_key?(path)
  puts "Error: Unknown template '#{path}'"
  exit 1
end

data = files[path]

if output.nil?
  puts data
else
  File.open(output, "w+") do |io|
    io.puts(data)
  end
end

