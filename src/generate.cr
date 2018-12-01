# Template generator built to bin/generate for internal file generation
# WARNING: This file contains some atrocious code.
# However, sometimes ugly code works so TODO: Refactor

require "ecr/macros"

require "./setup"

macro generate(path)
  String.build { |io| ECR.embed({{path}}, io) }
end

macro generate_templates(hash, paths)
  {% for path, index in paths %}
    {{hash}}[File.basename({{path}})] = generate({{path}})
  {% end %}
end

class String
  def indent(amount : Int64, first_line=true)
    chomp.lines.map_with_index do |line, index|
      !first_line && index == 0 ? line : (" " * amount) + line
    end.join("\n")
  end
end

def help_option(option)
  flags = String.build do |io|
    io << "-"
    io << option["short"]
    io << ", --"
    io << option["long"]
  end

  is_bool = option["type"] == "bool"

  flags_just = is_bool ? 25 : 17

  String.build do |io|
    io << flags.ljust(flags_just)
    io << "VALUE".ljust(8) unless is_bool
    io << option["description"].as_s
  end
end

def man_escape(value)
  value.gsub(/-/, "\\-")
end

def man_option(option)
  String.build do |io|
    io << man_escape(help_option(option))
    io << "\n"
    io << ".br"
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

name        = app["name"].as_s
version     = app["version"].as_s
homepage    = app["homepage"].as_s
repository  = app["repository"].as_s
issues      = app["issues"].as_s
summary     = app["summary"].as_s
mit_license = app["mit_license"].as_s
description = app["description"].as_s.chomp
strategy    = app["strategy"].as_s.chomp
options     = app["options"].as_a
controllers = app["controllers"].as_h

app_controllers = Cutback::Controller.all.sort_by(&.name)

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

