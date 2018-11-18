require "yaml"
require "ecr/macros"

macro generate(path)
  String.build { |io| ECR.embed({{path}}, io) }
end

macro generate_templates(hash, paths)
  {% for path, index in paths %}
    {{hash}}[File.basename({{path}})] = generate({{path}})
  {% end %}
end

class String
  def indent(amount : Int64, first_line=false)
    chomp.lines.map_with_index do |line, index|
      !first_line && index == 0 ? line : (" " * amount) + line
    end.join("\n")
  end
end

if ARGV.size != 2
  puts "Usage: #{PROGRAM_NAME} INPUT OUTPUT_PATH"
  exit 1
end

app      = YAML.parse(File.read("app.yml")).as_h
app.merge!(YAML.parse(File.read("shard.yml")).as_h)

input  = ARGV[0]
output = ARGV[1]

name        = app["name"]
version     = app["version"]
homepage    = app["homepage"]
repository  = app["repository"]
issues      = app["issues"]
summary     = app["summary"]
mit_license = app["mit_license"]
description = app["description"].as_s.chomp
strategy    = app["strategy"].as_s.chomp
options     = app["options"]

files = {} of String => String
generate_templates(files, [
  "templates/cutback.1",
  "templates/cutback.5",
  "templates/help",
  "templates/version",
  "templates/README.md",
])

path = File.basename(input)

unless files.has_key?(path)
  puts "Error: Unknown template '#{path}'"
  exit 1
end

data = files[path]

File.open(output, "w+") do |io|
  io.puts(data)
end

